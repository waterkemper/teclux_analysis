# Prompt para `/speckit.specify` — fundação, domínio e segurança

````text
/speckit.specify

Crie uma especificação funcional e técnica para a fundação do módulo Laravel **Interlojas → Transferência de Requisição para Exposição**. Não implemente código nesta etapa. Inspecione o checkout Laravel e cite arquivos concretos. Use como contrato inicial o README e as pesquisas deste diretório, além dos prompts existentes de Requisição para Exposição, Consulta de Requisições para Exposição e Cadastro de Romaneios. Não duplique componentes compartilhados já especificados.

## Fronteira do prompt

Defina o agregado, vocabulário, identidade, estados, filial efetiva, parâmetros, menu, acesso, escopo por filial, auditoria e schema gate necessários para os prompts seguintes. A unidade operacional é uma linha de `pedidosfiliais`; a transferência é uma operação sobre requisições abertas para exposição, não um novo agregado fiscal.

Estados observados no Delphi: `A` aberta, `F` fechada, `D` confirmada e `C` cancelada. Documente transições válidas, editabilidade e o significado de cada estado. Não inferir autorização a partir de `ReadOnly`; estado e autorização são regras separadas.

## Fontes obrigatórias

- `pesquisa-interface-delphi.md`;
- `pesquisa-sql-dominio-efeitos-delphi.md`;
- `pesquisa-parametros-autorizacoes-menu.md`;
- `pesquisa-padroes-laravel-reuso.md`;
- `schema/postgresql-authoritative-2026-08-06.json` e `schema/README.md`;
- `C:\projetos.vcl\biblio\clparametrossistema.pas`;
- prompts existentes em `modules/interlojas/requisicao-para-exposicao/`, `modules/interlojas/consulta-requisicoes-exposicao/` e `modules/entregas/cadastro-romaneios/`.

## Parâmetros

Mapeie cada leitura Delphi para o literal persistido e para `parametros_valor(descricao, filial_efetiva)`, sem aceitar valor do browser como autoridade. A resolução deve ser batched por filial e obedecer ao contexto da filial ativa/`FilialBase`, não à filial escolhida no filtro.

Inclua somente os call sites comprovados e documente tipo, ausência, fallback e efeito:

- `USAR GRADES PRODUTOS`;
- `REQUISICAOSUBTRAIESTOQUE`;
- `Permitir requisições de produtos duplicadas`;
- `Transferir Produtos Compostos`;
- `Informar o motivo do cancelamento do pedido`;
- `Reincluir requisições com saldo pendente`;
- `Exibir localização por código de barras nas transferências`;
- `DATA CONTABIL` e `DIASNOTARETROATIVA` para validação do período;
- `Imprimir Requisição Não Confirmada`, somente para o relatório operacional quando aplicável.

Não transforme `EmissorNFe`, `NomeImpressoraNotaMercadorias`, parâmetros fiscais ou regras de emissão em requisito deste módulo. Não usar a máscara de quantidade para validar quantidade. Valores ausentes ou inválidos devem seguir contrato Laravel explícito e seguro, sem copiar silenciosamente a data sentinela Delphi.

## Menu, acesso e filial

Defina folha própria sob **Interlojas → Transferência**, com rota canônica e acesso em `acessosmodulos` seguindo o serviço/middleware Laravel existente. O nome legado comprovado é `mitTransferenciaRequisicaoExposicao`; não invente código numérico nem copie automaticamente o acesso de Requisição para Exposição sem decisão registrada.

O servidor deve derivar a filial ativa da sessão, validar o acesso à folha e limitar consulta, modal F9, exportação e comandos às filiais autorizadas (`usuariosfiliais`). O requisitante não pode ser autoridade de escopo enviada pelo cliente. Se forem criadas capabilities separadas para cancelar, confirmar, lotear ou conferir, nomeie-as e justifique-as como decisão Laravel; o Delphi não comprovou grants operacionais específicos.

## Auditoria e schema gate

Especifique auditoria compatível com o padrão já existente, sem reescrever `pedidosfiliais_log` nem movimentos históricos. Alterações sensíveis precisam de usuário da aplicação, request/trace quando disponível e revisão/concorrência coerente com escritores Delphi.

O teste/CI deve validar o checksum e os objetos do snapshot antes de aceitar SQL novo. O request operacional não pode fazer introspecção estrutural. Confirme no snapshot nulabilidade, FK, constraints, índices, triggers, funções e sequences antes de afirmar um join ou efeito.

## Aceite mínimo

- [ ] O vocabulário e a unidade `pedidosfiliais` estão definidos sem criar entidade fiscal.
- [ ] Estados `A/F/D/C`, transições e editabilidade estão explícitos.
- [ ] Os parâmetros usam literais comprovados e `parametros_valor` em lote por filial.
- [ ] O frontend não controla parâmetros, filial, acesso ou situação permitida.
- [ ] A folha/menu e o middleware protegem todas as rotas, incluindo exportação e comandos.
- [ ] O snapshot autoritativo e o gate de checksum são referenciados.
- [ ] Exclusões de emissão fiscal, venda entre filiais, grades obsoletas, driver e hashtablefs/hastablefs estão repetidas no resultado.

## Fora de escopo

Consulta/grid, operações transacionais, lotes/conferência e implementação da interface. Não implementar emissão de NF-e, venda entre filiais, migrations aplicadas ou mudanças nos fontes Delphi.
````

