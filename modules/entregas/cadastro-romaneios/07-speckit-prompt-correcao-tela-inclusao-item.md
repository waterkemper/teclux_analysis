# Prompt para `/speckit.specify` — correção da tela de inclusão de Item de Romaneio

```text
/speckit.specify

Revise a especificação da tela Laravel de inclusão unitária de Item de Romaneio, após a implementação ter apresentado divergências visuais e operacionais em relação ao Delphi. Esta é uma correção da experiência e do contrato da inclusão unitária; não reabra a arquitetura mestre–detalhe, o contrato de Contas a Pagar, a F6 de inclusão múltipla ou os componentes compartilhados sem evidência de lacuna.

Não implemente nesta etapa. Inspecione o checkout Laravel atual e produza uma especificação pronta para implementação, citando arquivos e linhas. Consuma obrigatoriamente:

- `modules/entregas/cadastro-romaneios/pesquisa-interface-delphi.md`;
- `modules/entregas/cadastro-romaneios/pesquisa-sql-dominio-efeitos-delphi.md`;
- `modules/entregas/cadastro-romaneios/interface-operacoes-componentes.md`;
- `modules/entregas/cadastro-romaneios/modelo-dominio-coexistencia-transacoes.md`;
- `modules/entregas/cadastro-romaneios/schema/README.md` e o snapshot autoritativo;
- `laravel/docs/architecture/entregas-cadastro-romaneios-crud.md`;
- `laravel/backend/resources/js/Pages/Entregas/Romaneios/components/ItemRomaneioModal.tsx`;
- `laravel/backend/resources/js/Pages/Entregas/Romaneios/Cadastro.tsx`;
- `laravel/backend/app/Application/Entregas/Romaneios/RomaneioItemPayloadResolver.php`;
- `laravel/backend/app/Http/Controllers/Entregas/CadastroRomaneiosItemLookupController.php`;
- `laravel/backend/app/Infrastructure/Persistence/Legacy/Entregas/LegacyCadastroRomaneiosItemLookupRepository.php`;
- `laravel/backend/app/Services/Entregas/Romaneios/CadastroRomaneiosPageService.php`;
- `laravel/backend/app/Infrastructure/Persistence/Legacy/Entregas/RomaneioFinancialOriginAdapter.php`.

Classifique cada constatação como CONFIRMADO, DIVERGENTE, POSSÍVEL BUG ATUAL, POSSÍVEL BUG LEGADO, INFERIDO, DÚVIDA ou NÃO LOCALIZADO, sempre com evidência. O banco legado é a fonte canônica. Não crie tabela Laravel paralela, migration para duplicar `tabeladefretes`, nem valor financeiro calculado no browser.

## Decisão de composição visual

Não manter abas visuais `Nota Fiscal` / `Cupom Fiscal` no modal. O Laravel deve ter uma única superfície interativa de “Inclusão de Item de Romaneio”, preservando os dois tipos de documento por um seletor explícito de modo (radio/segmented control ou equivalente acessível), sem usar o componente de abas. O modo escolhido deve ser evidente por texto, não apenas por estilo ou cor.

Suporte a Cupom Fiscal continua obrigatório. Não remover o domínio, os campos, o payload ou a persistência de cupom apenas porque as abas foram removidas. Trocar o modo deve limpar ou confirmar o descarte dos identificadores incompatíveis, nunca misturar Filial/Série/NF com ECF/Intervenção/Cupom.

## Composição da tela

Organize o modal em regiões estáveis: contexto do Romaneio e modo Documento Fiscal; identificação do documento; informações resolvidas; frete, entrega e valor; observação, anulação quando autorizada e comandos.

### Identificação Nota Fiscal

No modo Nota Fiscal, exiba e valide Filial de emissão, Série, Nº Nota, Somente NF com itens para entrega e Chave NF-e.

A chave deve permanecer no fluxo de scanner: Enter em chave válida localiza o documento, preenche os campos canônicos e confirma o Item quando a operação estiver autorizada. Use `NfeAccessKeyInput`, `NfeAccessKey` e `NfeAccessKeyValid`; não copie regex, máscara ou cálculo de dígito verificador do Delphi.

### Identificação Cupom Fiscal

No modo Cupom Fiscal, exiba e valide Filial de emissão, ECF/Máquina, Intervenção, Nº Cupom e o filtro Somente NF com itens para entrega quando a regra compartilhada continuar aplicável ao candidato, com rótulo correto para documento fiscal.

Não exiba Série/Nº NF como se fossem identificadores do cupom. O payload deve usar `modo=cupom`, `filial_emissao`, `ecf`, `intervencao` e `numero_cupom`, e o backend deve resolver o `dadofiscal` pela identidade do cupom, incluindo Filial quando fizer parte da chave da consulta.

## Auto Incluir e bipagem contínua

`Auto Incluir` deve iniciar **marcado** em toda nova abertura do modal. O usuário precisa poder bipar várias NF-e sem clicar em Incluir a cada documento.

Com Auto Incluir, após confirmação bem-sucedida mantenha o modal aberto; limpe apenas os identificadores e valores específicos do novo Item; preserve o modo, `Somente NF com itens para entrega` e a preferência de Auto Incluir; no modo Nota devolva foco à Chave NF-e e selecione seu conteúdo; no modo Cupom devolva foco à Filial de emissão ou ao primeiro identificador configurado para leitura contínua; anuncie sucesso e modo por `aria-live`, sem depender de piscada/animação. Uma falha não pode limpar o rascunho nem avançar o foco como se tivesse gravado.

O comportamento deve funcionar tanto para Romaneio novo com itens pendentes quanto para Romaneio já persistido. A resposta do comando deve atualizar Item, Revisão, Situação e resumo financeiro; o reset do modal não pode deixar `auto_incluir=false` ou perder o modo.

## Lookups e dependências

Corrija os lookups para reproduzir a cadeia do Delphi com UX Laravel.

### Filial de emissão

- use lookup paginado padrão do Laravel, mostrando código e nome;
- inicie com a Filial efetiva/default quando houver uma no contexto;
- restrinja no backend às Filiais que o usuário pode consultar e usar na inclusão;
- ao trocar Filial, limpe Série/Nº NF e qualquer `dadofiscal` resolvido; no cupom, limpe ECF/Intervenção/Nº Cupom e o documento resolvido;
- não aceite código apenas porque existe no browser: resolva e autorize no servidor.

### Série

- só habilite depois de Filial válida;
- consulte `seriesfiliais` pela Filial selecionada, usando `valor` como Série;
- não use catálogo global sem Filial;
- exiba a Série real, sem fabricar descrição “Série X” como substituto da autoridade;
- ao trocar Série, limpe Nº NF, Chave, documento resolvido e valores derivados;
- preserve o limite/formato confirmado no schema, sem truncar silenciosamente o valor digitado.

### Nº NF

- só habilite depois de Filial e Série válidas;
- consulte `notas` em conjunto com `dadosfiscais`, filtrando Filial + Série + número e elegibilidade do Romaneio;
- exclua cancelados/inelegíveis conforme a regra autoritativa;
- permita digitação exata e pesquisa paginada pela lupa;
- ao selecionar/localizar, preencha Chave, emissão, `dadofiscal`, filial, série, número, cliente, volumes, frete e valor canônicos;
- nunca consulte somente `n.numero` sem Filial e Série.

### Cupom

Adicione lookup/consulta unitária de Cupom com a identidade efetiva `Filial + ECF/Máquina + Intervenção + Nº Cupom`, usando `cupons` + `dadosfiscais` e o mesmo contrato de elegibilidade. A lupa deve devolver o `dadofiscal` e os dados resolvidos sem exigir que o usuário conheça uma chave interna.

## Frete e origem do documento a pagar

Distinguir explicitamente três conceitos:

1. `Tipo/Tabela de Frete`: `romaneiosnotas.codigofrete`, lookup em `tabeladefretes`;
2. `Valor de Tabela`: `tabeladefretes.valorfornecedor`, somente leitura após resolver a Tabela de Frete;
3. `Valor do Frete`: `romaneiosnotas.valor`, valor monetário do Item usado no total canônico do Romaneio e no rascunho do Documento a Pagar.

O lookup da Tabela de Fretes deve usar o endpoint/padrão Laravel de `tabeladefretes`, mostrar Código, Descrição e, quando autorizado, `valorfornecedor`, carregar descrição/valor pelo servidor, limpar os derivados quando o código for limpo e nunca permitir que o browser invente Código, Descrição ou Valor de Tabela. Respeite `codigo`, `descricao`, `observacoes`, `valorcliente` e `valorfornecedor` confirmados no snapshot.

Ao localizar Nota ou Cupom, aplique os defaults comprovados do legado: frete existente do documento ou frete derivado pela regra autoritativa de região/bairro, quando presente; `Valor do Frete` inicial vindo do `dadosfiscais.valorfrete`/consulta canônica, não do `valorfornecedor` sem uma decisão explícita do domínio. Se a regra determinar que a Tabela deve substituir esse valor, documente e teste a decisão; não a infira no frontend.

O backend deve persistir somente campos canônicos do Item, especialmente `codigofrete` e `valor` em `romaneiosnotas`. `valorfornecedor` é projeção da Tabela de Fretes, não uma coluna inventada em `romaneiosnotas`. O Documento a Pagar é mantido pelo seam `DocumentoPagFinancialDraftByOriginPort`; seu total continua calculado no servidor pela soma dos `romaneiosnotas.valor` não cancelados. O browser não envia total, duplicata, `documentopag` ou previsão como autoridade.

## Campos comuns, preenchimento e validação

Exiba emissão somente leitura após resolver o Documento Fiscal; Tipo/Tabela de Frete; Valor de Tabela; Valor do Frete; data/hora de entrega quando o Item puder recebê-la; observação; e anulado/cancelado somente quando a capability e a Situação permitirem.

Regras mínimas: Nota exige Série e Nº NF, ou Chave NF-e válida; Cupom exige Filial, ECF, Intervenção e Nº Cupom; Item com entrega exige Valor do Frete válido e não negativo; Documento já vinculado, cancelado ou incompatível falha sem alteração parcial; o servidor revalida modo, identidade, elegibilidade, Filial, Romaneio, Revisão, capability e tabela de frete sob lock; erros ficam associados ao campo e mantêm foco/rascunho; não há sucesso parcial entre Item e atualização financeira.

## Integração com comando e financeiro

Reutilize os comandos existentes (`storeItem`/upsert) e a revisão/idempotência do agregado. Não crie endpoint paralelo só para a nova UI. Ao gravar, envie o documento selecionado e somente valores editáveis; revalide `dadofiscal` fazendo a identidade prevalecer sobre campos exibidos; persista `romaneiosnotas` transacionalmente; recalcule `Atualizar_situacao_romaneio`; mantenha/atualize o Documento a Pagar pelo adapter financeiro compartilhado; devolva Item enriquecido, nova Revisão, Situação e resumo financeiro; e, com Auto Incluir, retorne sinalização explícita de reset mantendo modo e preferências.

## Aceite obrigatório

- [ ] Não existem abas visuais Nota/Cupom no modal.
- [ ] Nota e Cupom continuam inclusíveis pela mesma superfície, sem mistura de identificadores.
- [ ] Auto Incluir começa marcado e permite cinco inclusões consecutivas por scanner sem fechar/clicar novamente.
- [ ] Após cada sucesso, o foco retorna ao campo correto e modo/checkboxes persistentes permanecem.
- [ ] Filial filtra Série; Filial+Série filtram Nº NF; mudar um pai limpa os filhos.
- [ ] Lookup de Cupom resolve Filial+ECF+Intervenção+Nº Cupom e retorna `dadofiscal`.
- [ ] Lookup de Tabela de Fretes mostra descrição e `valorfornecedor` sem permitir edição indevida.
- [ ] Valor de Tabela e Valor do Frete aparecem separados e são testados com valores diferentes.
- [ ] O total enviado ao Documento a Pagar é calculado no servidor pela soma não cancelada de `romaneiosnotas.valor`.
- [ ] Chave NF-e usa a autoridade compartilhada e cobre scanner, colar, inválida, não encontrada e já vinculada.
- [ ] Erros, conflito de revisão, respostas tardias e reenvio idempotente preservam o rascunho.
- [ ] Testes frontend cobrem modo, cadeia de lookups, foco, dirty state e Auto Incluir.
- [ ] Testes HTTP/feature cobrem segurança dos lookups, Cupom, Tabela de Fretes e payload adulterado.
- [ ] Teste PostgreSQL comprova vínculo canônico, ausência de N+1 e efeito financeiro sem duplicar Documento a Pagar/Duplicata.

## Fora de escopo

- reintroduzir abas Nota/Cupom;
- alterar o layout Delphi;
- criar cópia Cloud de `tabeladefretes`, `notas`, `cupons` ou `romaneiosnotas`;
- alterar a tela de inclusão múltipla F6, salvo contratos compartilhados explicitamente comprovados;
- alterar o núcleo Contas a Pagar ou criar uma segunda origem financeira;
- migrations de negócio, introspecção de schema em runtime ou alteração do Delphi.
```
