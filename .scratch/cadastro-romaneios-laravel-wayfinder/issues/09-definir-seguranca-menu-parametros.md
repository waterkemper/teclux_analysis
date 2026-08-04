# Definir segurança, menu e parâmetros do Cadastro de Romaneios

Type: grilling
Status: resolved
Blocked by: 03, 04, 05, 06

## Question

Qual contrato final de acesso ao módulo, capabilities por operação, reautorização sensível, escopo de Filial, migration idempotente de `acessosmodulos` e manifest batched de Parâmetros do Sistema deve ser especificado para o Laravel?

## Answer

Por decisão do usuário, o Cloud preservará a hierarquia Delphi **Entregas e Montagens → Entregas → Romaneios**. A migration reutiliza a raiz canônica existente, cria/reutiliza agrupador e folha por rotas estáveis, é idempotente e não copia o acesso Delphi nem concede grants em massa. Administrador segue o acesso global; Usuário comum depende de concessão explícita em `usuariosacessosmodulos`.

Middleware protege todas as rotas e Policies/capabilities revalidam cada operação. `UserBranchAccessService` alcança filtros, lookups, F6, chave NF-e, exportações, relatórios e comandos; emissão, origem/destino, parâmetros e financeiro exigem acesso a todas as Filiais relevantes.

Confirmar recebimento, Liberar e Reter reutilizam provas sensíveis compartilhadas, curtas, contextuais e de uso único. O Autorizador precisa de credencial válida e Usuário ativo, sem perfil adicional inventado; o Operador continua obrigado a possuir módulo, Filiais e capacidade. Cancelar pagamento permanece fora.

`CadastroRomaneiosParameterManifest` resolve em uma chamada por Filial `Incluir documento a pagar no romaneio` e `Evento para pagamento de romaneio`. Com financeiro ativo, evento ausente/inválido bloqueia toda a gravação antes dos efeitos; não há default nem persistência parcial.

A geração financeira deve compor o núcleo de Contas a Pagar já implementado no Laravel — commands de rascunho, repositories de `documentospag`/`duplicatas`, revisão, reconciliador e proteção de parcelas — com as regras de origem confirmadas no Delphi. Se os commands atuais estiverem acoplados à tela, extrair um seam compartilhado executável dentro da transação do Romaneio; não duplicar writer ou motor financeiro. Duplicata autorizada/paga segue as invariantes Laravel, e Estorno do Pagamento permanece fora do Romaneio.

O contrato completo de árvore, grants, capabilities, Filiais, provas, parâmetros, integração com Contas a Pagar, endpoints e testes está em [seguranca-menu-parametros.md](../../../modules/entregas/cadastro-romaneios/seguranca-menu-parametros.md).
