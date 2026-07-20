-- =============================================================================
-- erp_estoques_preco_marketplace_margem_final (v2 — fixed-point iteration)
--
-- Resolve a dependência circular  preço ↔ frete  iterando até convergência
-- (máx 10 passos, tolerância R$ 0,01) em vez de 2 passos fixos.
--
-- Assinatura mantida:
--   erp_estoques_preco_marketplace_margem_final(produto_codigo, account_id, preco_base)
-- =============================================================================

CREATE OR REPLACE FUNCTION public.erp_estoques_preco_marketplace_margem_final(
    bigint,   -- $1  produto_codigo
    uuid,     -- $2  account_id
    numeric   -- $3  preco_base (mantido por paridade; não usado no cálculo)
)
RETURNS numeric
LANGUAGE plpgsql
AS $function$
DECLARE
    pProduto    ALIAS FOR $1;
    pAccountId  ALIAS FOR $2;
    -- $3 mantido por compatibilidade de assinatura

    -- dados fixos carregados uma vez
    vProduto                 bigint;
    vTabelaFrete             integer;
    vPrecoVendaCargo         numeric(11,2);
    vCustoProduto            numeric(11,2);
    vPercComissao            numeric(5,2);
    vAliqICMS                numeric(6,2);
    vMargemFinalPM           numeric(5,2);   -- margem do vínculo produto-conta
    vMargemFinalMK           numeric(5,2);   -- margem padrão da conta
    vPrecotabelado           boolean;
    vDescricaoMarketplace    varchar;

    -- controle do loop
    vMargemMinima            numeric(5,2);
    vFrete                   numeric(11,2);
    vPrecoAtual              numeric(11,2);
    vPrecoAnterior           numeric(11,2);
    vPercComissaoEfetivo     numeric(5,2);
    vIter                    int := 0;
    vMaxIter                 int := 10;
    vEpsilon                 numeric := 0.01;

    vMultiplo                numeric(9,2);
    vPrecoFinal              numeric(11,2);
BEGIN

    -- ------------------------------------------------------------------
    -- 0. Parâmetro global de margem mínima
    -- ------------------------------------------------------------------
    vMargemMinima := coalesce(
        cast(nullif(parametros_valor('Margem Minima Marketplace'), '') as numeric(5,2)),
        0
    );

    -- ------------------------------------------------------------------
    -- 1. Carrega dados fixos (uma única query, sem custo_frete)
    -- ------------------------------------------------------------------
    SELECT
          p.codigo
        , CASE
              WHEN ma.filial_estoque_codigo IS NOT NULL
               AND customedio(p.codigo, ma.filial_estoque_codigo) > 0
                  THEN customedio(p.codigo, ma.filial_estoque_codigo)
              ELSE coalesce(e.valorultimacompra, 0)
          END                                                          -- custo_produto
        , (
              CASE
                  WHEN ma.preco_cargo_codigo IS NULL THEN
                      estoques_precoporcargonormal(p.codigo, ma.filial_codigo, 0::numeric)
                  WHEN cast(ma.preco_cargo_codigo as varchar)
                       = parametros_valor('Cargo Tabela Preco Internet')
                      THEN estoques_preco(p.codigo, ma.filial_codigo, coalesce(pc.markup, 0))
                  ELSE
                      estoques_precoporcargonormal(p.codigo, ma.filial_codigo, coalesce(pc.markup, 0))
              END
          )                                                            -- precovendacargo
        , coalesce(
              (
                  SELECT g_m_c.comissao
                  FROM   grupo_marketplace_comissao g_m_c
                  WHERE  g_m_c.grupo_codigo           = g.codigo
                    AND  ma.legacy_marketplace_codigo IS NOT NULL
                    AND  g_m_c.marketplace_codigo     = ma.legacy_marketplace_codigo
              ),
              (
                  SELECT cu.percprazo
                  FROM   comissoesusuarios cu
                  WHERE  cu.usuario = u.codigo
                  LIMIT  1
              ),
              0::numeric(5,2)
          )                                                            -- perccomissao
        , CASE
              WHEN fm.regimetributario = 1 THEN
                  CASE
                      WHEN c.csosn NOT IN ('101','102','900')
                          THEN (
                              coalesce(
                                  cast(nullif(parametros_valor('Alíquota Simples Nacional', fm.codigo), '') as numeric(6,2)),
                                  cast(nullif(parametros_valor('Aliquota Simples Nacional', fm.codigo), '') as numeric(6,2)),
                                  0::numeric(6,2)
                              ) * 66.5
                          ) / 100
                      ELSE
                          coalesce(
                              cast(nullif(parametros_valor('Alíquota Simples Nacional', fm.codigo), '') as numeric(6,2)),
                              cast(nullif(parametros_valor('Aliquota Simples Nacional', fm.codigo), '') as numeric(6,2)),
                              0::numeric(6,2)
                          )
                  END
              ELSE
                  CASE
                      WHEN ti.valor IN ('00','20')
                          THEN (
                              SELECT ei.valor
                              FROM   estadosicms ei
                              WHERE  ei.icms   = c.icms
                                AND  ei.estado = fm.estado
                          )
                      ELSE 0::numeric(6,2)
                  END
          END                                                          -- aliq_icms
        , ma.margem_final_desejada                                     -- margem_final_desejada_mk
        , pl.margem_final_desejada                                     -- margem_final_desejada_pm
        , c.precotabelado
        , ma.tabela_frete_codigo                                       -- tabela_frete
        , coalesce(nullif(upper(btrim(ma.legacy_descricao)), ''), upper(ma.channel))  -- descricao_marketplace
    INTO
          vProduto
        , vCustoProduto
        , vPrecoVendaCargo
        , vPercComissao
        , vAliqICMS
        , vMargemFinalMK
        , vMargemFinalPM
        , vPrecotabelado
        , vTabelaFrete
        , vDescricaoMarketplace
    FROM
          produtos p
          INNER JOIN erp_marketplace_accounts ma
              ON  ma.id = pAccountId
          LEFT  JOIN erp_marketplace_product_links pl
              ON  pl.produto_codigo = p.codigo
              AND pl.account_id    = ma.id
          LEFT  JOIN produtoscargos pc
              ON  ma.preco_cargo_codigo IS NOT NULL
              AND pc.produto = p.codigo
              AND pc.cargo   = ma.preco_cargo_codigo
          LEFT  JOIN cargos cg
              ON  ma.preco_cargo_codigo IS NOT NULL
              AND cg.codigo = ma.preco_cargo_codigo
          INNER JOIN filiais fm
              ON  fm.codigo = ma.filial_codigo
          LEFT  JOIN usuarios u
              ON  ma.vendedor_usuario_codigo IS NOT NULL
              AND u.codigo = ma.vendedor_usuario_codigo
          INNER JOIN caracteristicas c
              ON  p.caracteristica = c.codigo
          INNER JOIN tributosicms ti
              ON  ti.codigo = c.incidencia
          INNER JOIN csosn
              ON  csosn.codigo = c.csosn
          LEFT  JOIN estoques e
              ON  ma.filial_estoque_codigo IS NOT NULL
              AND e.filial  = ma.filial_estoque_codigo
              AND e.produto = p.codigo
          INNER JOIN grupos g
              ON  g.codigo = c.grupo
    WHERE p.codigo = pProduto;

    -- produto não encontrado / conta inválida
    IF vProduto IS NULL THEN
        RETURN NULL;
    END IF;

    -- ------------------------------------------------------------------
    -- 2. Semente: frete calculado sobre o preço de tabela/cargo
    -- ------------------------------------------------------------------
    vPrecoAtual := vPrecoVendaCargo;
    vFrete      := custo_frete(vProduto, vTabelaFrete, vPrecoAtual);

    -- ------------------------------------------------------------------
    -- 3. Fixed-point iteration  preço ↔ frete
    -- ------------------------------------------------------------------
    LOOP
        vPrecoAnterior := vPrecoAtual;

        -- Taxa SHOPEE: se comissão aplicada > R$ 100, recalcula percentual efetivo
        IF vDescricaoMarketplace = 'SHOPEE'
           AND vPrecoAtual * vPercComissao / 100 > 100
        THEN
            vPercComissaoEfetivo := 100.0 / vPrecoAtual * 100;
        ELSE
            vPercComissaoEfetivo := vPercComissao;
        END IF;

        IF vPrecotabelado THEN
            -- Usa preço de cargo; só recalcula se margem ficou abaixo do mínimo
            IF vMargemMinima = 0
               OR cast(
                    ((vPrecoVendaCargo - vCustoProduto - vFrete
                      - vPrecoVendaCargo * (vPercComissaoEfetivo + vAliqICMS) / 100)
                     / vPrecoVendaCargo) * 100
                    as numeric(5,2)
                  ) > vMargemMinima
            THEN
                vPrecoAtual := vPrecoVendaCargo;
            ELSE
                vPrecoAtual :=
                    (vCustoProduto + vFrete
                     + CASE WHEN vDescricaoMarketplace = 'INTEGRACOMMERCE' THEN 5.00 ELSE 0 END)
                    / (1
                       - vMargemMinima            / 100.0
                       - vPercComissaoEfetivo      / 100.0
                       + vAliqICMS                / 100.0);   -- ICMS reduz denominador como no original
            END IF;
        ELSE
            -- Preço livre: cobre custo + frete + taxa fixa / (1 - margens)
            vPrecoAtual :=
                (vCustoProduto
                 + vFrete
                 + CASE WHEN vDescricaoMarketplace = 'INTEGRACOMMERCE' THEN 5.00 ELSE 0 END)
                / (1
                   - vPercComissaoEfetivo                                            / 100.0
                   - vAliqICMS                                                       / 100.0
                   - coalesce(vMargemFinalPM, vMargemFinalMK, vMargemMinima, 0)      / 100.0);
        END IF;

        -- Guarda-chuva: preço inválido (denominador ≤ 0, etc.)
        IF vPrecoAtual IS NULL OR vPrecoAtual <= 0 OR vPrecoAtual > 99999 THEN
            vPrecoAtual := 99999;
            EXIT;
        END IF;

        -- Recalcula frete com novo preço
        vFrete := custo_frete(vProduto, vTabelaFrete, vPrecoAtual);

        vIter := vIter + 1;
        EXIT WHEN ABS(vPrecoAtual - vPrecoAnterior) <= vEpsilon
               OR vIter >= vMaxIter;
    END LOOP;

    -- ------------------------------------------------------------------
    -- 4. Arredondamento final (múltiplo não utilizado, mantido por paridade)
    -- ------------------------------------------------------------------
    vMultiplo := 0;

    IF vMultiplo > 0 THEN
        vPrecoFinal := ROUND(multiplo(vPrecoAtual, vMultiplo), 2);
    ELSE
        vPrecoFinal := ROUND(vPrecoAtual, 2);
    END IF;

    RETURN vPrecoFinal;

END;
$function$;
