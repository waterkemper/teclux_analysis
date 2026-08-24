# Decidir etiquetas de mercadoria e volume da Transferência

Type: grilling
Status: resolved

## Answer

Etiquetas de mercadoria ou volume ficam fora da especificação atual da Transferência. O levantamento Delphi não comprovou chamada de emissão de etiquetas nesta jornada, nem existe contrato decidido para conteúdo, cardinalidade, código de barras, modelo, momento de geração, reimpressão, auditoria ou impressora.

Não será usado o campo emiteetiqueta de outro domínio como regra implícita, nem a configuração geral de impressoras de etiquetas será conectada automaticamente à Transferência. O tema será detalhado posteriormente em uma etapa/spec própria, quando o usuário fornecer a regra operacional. Até lá, a saída auxiliar da Transferência permanece somente a DANFE padrão em PDF.
Blocked by: 20

## Question

A Transferência de Requisição deve gerar etiquetas de mercadoria ou volume? Se sim, qual é a origem autoritativa dos dados, a cardinalidade por produto/volume, conteúdo, código de barras, modelo, momento de geração, versionamento, reimpressão, auditoria e dispositivo/impressora? A decisão deve separar etiqueta logística de DANFE e não usar emiteetiqueta de outro domínio sem comprovar a regra desta jornada.

Recomendação inicial: não gerar etiquetas automaticamente nesta spec, pois o Delphi pesquisado não comprova essa chamada na Transferência; manter a configuração geral de impressoras como infraestrutura não utilizada até existir contrato funcional explícito.
