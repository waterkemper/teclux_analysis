# Prompt 30 - Editor completo de Rotinas ECC

## Objetivo

Entregar uma tela operacional onde o usuario cadastra, renomeia, duplica, configura, ativa e desativa Rotinas ECC sem depender de API.

## Criacao e identidade

- Remover o select de tres tipos fixos.
- Solicitar nome da rotina e filial requisitante.
- Permitir varias rotinas para a mesma filial.
- Oferecer **Duplicar rotina** como atalho opcional; clone nasce inativo, com nova identidade e payload independente.
- Criar rotina nova sem filiais, marcas, grupos, depositos, horario ou filtros pre-selecionados.

## Editor

Separar em secoes ou abas:

1. Identidade: nome, filial e situacao.
2. Agenda: modo permitido, intervalo de dias, primeira execucao, horario e timezone.
3. Regras temporais: habilitar/desabilitar ultima venda, entrada NF e futuras regras catalogadas; offsets, intervalo inclusivo, filial/deposito e explicacao do recorte.
4. Filtros da Consulta de Compras: reutilizar `ProductFilterPanel`, `SupplierFilterPanel`, selecao de filiais/grupos, periodo 0..9999, estoque, flags, compostos, conceitos e demais abas existentes.
5. Motor: curva ABC, redutora, sugestao zero, percentual acima do minimo, pedidos entre filiais e pedidos de compra.
6. Politicas ECC: prefixos M/D/U/F/O/C, minimo/maximo, concentracao, fontes, urgencia, gerente de vendas e demais regras previstas no contrato.
7. Resumo: fotografia da configuracao nao salva, validacoes, versao e proxima janela estimada.

O editor deve usar o seam compartilhado do prompt 24 para hidratar e serializar os filtros. Nao duplicar o motor de filtros no ECC.

## Edicao e ativacao

- Permitir renomear sem mudar UUID, historico ou snapshots.
- Salvar com OCC e preservar alteracoes locais em erro.
- Alteracoes passam a valer na proxima execucao; snapshot existente nunca e alterado.
- Salvar nao ativa. Ativar exige validacao completa do backend.
- Mostrar claramente que o job prepara propostas e que a revisao humana ainda gera `pedidosfiliais` pelo fluxo existente.

## Guardrails de interface

Nao aceitar SQL, PHP, cron arbitrario ou expressao executavel nos campos configuraveis. O catalogo de campos, operadores, agendas e politicas vem do backend e a UI renderiza controles correspondentes.

## Testes obrigatorios

- criar e editar uma rotina totalmente nova;
- renomear e recarregar sem perder identidade;
- manter duas rotinas da mesma filial na listagem;
- duplicar sem compartilhar alteracoes;
- round-trip completo dos filtros e motor;
- configurar regras temporais diferentes em duas rotinas;
- nenhuma selecao ou horario e inventado;
- OCC, ativacao, desativacao e erros ficam visiveis.

