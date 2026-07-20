# Documentar o fluxo completo de impressão Delphi

Type: task
Status: resolved
Blocked by:

## Question

Qual é o comportamento comprovável da impressão no Cadastro e na Consulta, incluindo habilitação do F11, gravação prévia, seleção em lote, datasets, cálculos, seções, ordem, paginação, preview, erros e diferenças entre os dois gatilhos?
## Answer

A investigação do Delphi é responsabilidade exclusiva deste workspace. O Cursor/SpecKit não possui acesso ao código Delphi e, portanto, não pode ser instruído a inspecionar PAS, DFM, data modules, queries, FastReport ou qualquer outra fonte legada.

O handoff deve levar um pacote de evidências Delphi autocontido, com cada regra relevante já classificada e descrita de forma verificável. Para a impressão de Orçamentos, esse pacote deve cobrir os gatilhos do Cadastro e da Consulta, persistência prévia, seleção em lote, datasets, cálculos, seções, ordenação, paginação, preview, falhas, Parâmetros do Sistema, fotos e a divergência de autorização entre os dois gatilhos. Referências a nomes de units, métodos, campos e parâmetros podem acompanhar as conclusões como rastreabilidade, mas nunca como tarefa de inspeção para o Cursor.

A divisão obrigatória de responsabilidades fica assim:

- este workspace inspeciona Delphi e Laravel, resolve divergências e produz as evidências Delphi consolidadas;
- o prompt do `/speckit.specify` apresenta as evidências Delphi como entradas autoritativas do requisito;
- o Cursor inspeciona somente o checkout Laravel ao qual tem acesso, valida o estado atual e confronta-o com as evidências fornecidas;
- se o pacote Delphi deixar uma dúvida, o Cursor deve registrá-la como dúvida ou bloqueio e devolvê-la para investigação neste workspace, sem tentar inferir a regra nem solicitar caminhos Delphi;
- imagens fornecidas no Cursor servem apenas como referência visual e não substituem evidência funcional extraída aqui.

Consequentemente, instruções como “Inspecione o Delphi”, “Analise PAS e DFM” e “derive regras do código Delphi” são inválidas em qualquer prompt destinado ao Cursor. Devem ser substituídas por “Considere as evidências Delphi fornecidas neste prompt como o pacote funcional legado; inspecione o Laravel e reporte contradições ou lacunas”.
