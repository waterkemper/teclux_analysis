# Conferir Produtos na Confirmação por Notas

## Contrato observado

**Evidência.** O botão passa o dataset da nota, campos de produto/código visual/descrição/quantidade/grades, tipo literal `NST` e `dadofiscal` como código; `numero` é default. A função copia isso ao formulário genérico e não retorna estado ao chamador. (`C:\projetos.vcl\apps\interlojas\fmconfirmarnotastransferencia.pas:292-308`; `C:\projetos.vcl\repositorio\fmConferenciaProdutos.pas:214-219,1241-1256`)

**Evidência.** `NST` é **nota de saída de transferência**: o relatório usa `TipoNotaSaidaTransferencia`, projeta `NST`, liga `dadosfiscais.numero=conferencia.codigo` e produtos fiscais a `produtosconferencia`. (`C:\projetos.vcl\apps\estoque\dmrelatorioprodutosconferidos.dfm:323-336,352-362`)

## UX

**Evidência.** Abre modal e foca o código de barras. Leitura soma 1; quantidade manual substitui `lido` e marca `digitado`. A visão calcula faltante/excedente. Há salvar, refazer todos e recomeçar faltantes; Enter na grade foca quantidade lida. (`C:\projetos.vcl\repositorio\fmConferenciaProdutos.pas:700-726,1145-1148,1260-1282,1709-1727,1819-1838`)

**Evidência.** Conferir é botão independente sem atalho declarado; F5/F6 são de Confirmar/Gerar. (`C:\projetos.vcl\apps\interlojas\fmconfirmarnotastransferencia.dfm:608-638`; `C:\projetos.vcl\apps\interlojas\fmconfirmarnotastransferencia.pas:212-233,292-308`)

## Persistência e autorização

**Evidência.** O Delphi procura/cria `conferencia` por `(tipo,codigo)`, com data/usuário, e abre `produtosconferencia`, componentes e visão pela mesma chave. Agrega esperado por produto e expande compostos configurados para conferência. (`C:\projetos.vcl\repositorio\fmConferenciaProdutos.pas:755-895`)

**Evidência.** Salvar atualiza usuário/data e persiste cabeçalho/produtos/componentes. Alterar `qtderecebida` da origem é exclusivo de `TRF`; `NST` não altera produtos fiscais. (`C:\projetos.vcl\repositorio\fmConferenciaProdutos.pas:1357-1396,1535-1541,1680-1705`)

**Evidência.** Conferir não pede `ObterAutorizacao`; usa usuário conectado. Reautorização por senha/login existe somente em Confirmar. (`C:\projetos.vcl\apps\interlojas\fmconfirmarnotastransferencia.pas:236-253,292-308`; `C:\projetos.vcl\repositorio\fmConferenciaProdutos.pas:760-771,1391-1394`)

## Efeito sobre confirmação

**Evidência.** Confirmar chama `ConfirmaTransferencia` sem consultar `conferencia`, produtos ou `NST`. `incluirconferenciadocumentos` usa tipos distintos `ROS`/`ROE` para romaneio. Logo, `NST` **não bloqueia** confirmação no Delphi e não é conferência documental. (`C:\projetos.vcl\apps\interlojas\fmconfirmarnotastransferencia.pas:236-253,292-308`; `C:\projetos.vcl\apps\interlojas\dmconfirmarnotastransferencia.pas:456-473`; `C:\projetos.vcl\apps\interlojas\dmconfirmarnotastransferencia.dfm:1503-1523`)

## Seam Laravel e recomendação

**Evidência.** `LegacyConferenceRepository` já persiste as três tabelas com transação/lock. `ConferenceEngine` abre sem escrita, reconstrói esperado, mescla leituras/componentes, calcula completude/token e salva autoritativamente. Controller/adapters já separam auth de leitura/escrita e usam usuário/filial da sessão. (`laravel/backend/app/Infrastructure/Persistence/Legacy/Cadastros/Conferencia/LegacyConferenceRepository.php:119-175,192-268`; `laravel/backend/app/Application/Cadastros/Conferencia/ConferenceEngine.php:24-71,247-260`; `laravel/backend/app/Http/Controllers/Cadastros/ConferenciasController.php:52-113,192-205`; `laravel/backend/app/Domain/Cadastros/Conferencia/ConferenceTypeAdapterInterface.php:11-81`)

**Evidência.** Rotas genéricas show/state/scan/quantidade/reiniciar/salvar/relatório e a UI `Cadastros/Conferencias/Show.tsx` já existem. Resolver registra `LPA`, `ORC`, `CTR`, não `NST`. (`laravel/backend/routes/web.php:1179-1194`; `laravel/backend/app/Providers/AppServiceProvider.php:432-438`)

**Recomendação.** A página deve navegar para `/cadastros/conferencias/NST/{dadofiscal}`. Criar apenas `NstConferenceAdapter`: reconstruir itens por `dadofiscal`; validar nota/filial ativa; usar auth do módulo sem reautorização `TransferenciaPorItem`; suportar componentes; proibir inesperados/remoção da origem; não alterar `produtosdadosfiscais`; sem gate de disponibilidade; navegação de volta. Reutilizar engine/UI, mantendo abertura pura e sem gate `NST` em Confirmar. Pode mostrar progresso/link, mas confirmação permanece independente.
