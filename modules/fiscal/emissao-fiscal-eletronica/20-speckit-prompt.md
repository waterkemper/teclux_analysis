# Prompt para /speckit.specify — gerenciamento de certificados fiscais A1

```text
/speckit.specify

Revise e complete o gerenciamento administrativo de certificados digitais A1 da plataforma fiscal, considerando o estado atual do projeto. Não implemente durante esta etapa: produza somente a especificação funcional/técnica, critérios de aceite, matriz de testes e instruções para a implementação posterior.

## Evidências do estado atual

- Existe a rota `POST /fiscal/certificados/contribuintes/{contribuinte_id}/versoes`, nomeada `fiscal.certificados.contribuintes.versoes.store`.
- O backend já possui as telas Inertia `Fiscal/Certificados/Index` e `Fiscal/Certificados/Show`.
- `Show` já permite selecionar/adicionar estabelecimento, enviar `.pfx`/`.p12`, informar a senha do certificado e confirmar a senha de login, além de listar estabelecimentos, versões e vínculos.
- O backend já expõe operações para validar/revogar versões e criar, ativar e inativar vínculos.
- A prop/rota `vinculo_store` é enviada pelo controller, mas a tela atual não oferece o formulário/ações para criar, ativar ou inativar vínculos.
- A tela inicializa o código da filial com `1`; isso não pode ser assumido em uma tela genérica de gerenciamento.
- Existe teste da página `Index`, mas não há evidência equivalente de teste da página `Show`, do menu ou do fluxo completo de vínculo.
- Não foi localizada entrada de menu para `/fiscal/certificados` nas definições versionadas de menu. O menu do sistema é dinâmico e deriva de `acessosmodulos`; a especificação deve definir a forma correta de cadastrar/habilitar essa entrada sem duplicá-la.

## Objetivo

Disponibilizar uma área fiscal descobrível pelo menu e suficiente para o ciclo administrativo completo: cadastrar contribuinte fiscal, associar estabelecimentos, carregar uma nova versão de certificado, validar/revogar versões e vincular explicitamente uma versão a cada filial, UF, ambiente, modelo e capacidade de uso.

## Requisitos obrigatórios

### 1. Menu e autorização

- Criar ou habilitar uma única entrada de menu para `fiscal.certificados.index`, com rótulo claro como `Certificados fiscais`.
- Posicionar a entrada dentro da área Fiscal/Emissão fiscal conforme a árvore atual de `acessosmodulos`.
- Respeitar o mecanismo de autorização já utilizado pelo `MenuService`; menu não substitui autorização de rota/ação.
- Exibir estado ativo para `/fiscal/certificados` e `/fiscal/certificados/contribuintes/*`.
- Garantir que a entrada apareça para administrador e somente para usuários com o módulo/permissão correspondente.
- Não criar um segundo menu legado em Cadastros de Filiais para armazenar senha ou arquivo de certificado.

### 2. Índice de contribuintes

- Listar contribuintes fiscais com razão social, raiz do CNPJ, quantidade/status de estabelecimentos, versões e alertas de validade.
- Permitir cadastrar contribuinte e abrir o detalhe.
- Mostrar estados vazios, carregamento, erros de autorização e falhas de backend de forma recuperável.
- Nunca exibir senha, PFX, P12, material cifrado ou chave mestra.

### 3. Detalhe do contribuinte e upload

- Permitir adicionar/selecionar estabelecimento por código de filial, sem valor inicial fixo e sem confundir raiz de CNPJ com uma filial específica.
- No upload aceitar somente extensões e tamanho já validados pelo backend; manter a confirmação de reautenticação exigida pelo fluxo atual.
- Limpar arquivo e campos de senha após sucesso ou erro definitivo.
- Exibir somente metadados sanitizados da versão: estado, titular, CNPJ, fingerprint conforme política existente, validade, data de inclusão e resultado de validação.
- Usar as rotas existentes para upload, validação e revogação; não criar caminho paralelo.

### 4. Vínculos de certificado

- Implementar na tela o formulário baseado em `vinculo_store` para vincular uma versão a:
  - estabelecimento/filial exato;
  - capacidade (`Assinatura` ou `Transmissao`, conforme enumeração já existente);
  - UF;
  - ambiente (`homologacao` ou `producao`);
  - modelo (`55` ou outro modelo suportado);
  - vigência e preferência, quando aplicável.
- Permitir ativar e inativar vínculos pelas rotas existentes, com confirmação, motivo quando exigido e atualização idempotente da tela.
- Exibir claramente vínculos ativos, inativos, expirados, preferenciais e conflitos.
- Impedir ou explicar conflitos de seleção preferencial e combinações sem certificado utilizável.
- Manter a seleção por chave completa `(filial, UF, ambiente, modelo, capacidade)`; certificado compartilhado por raiz de CNPJ não autoriza implicitamente todas as filiais.
- Garantir que o caso de uma mesma raiz de CNPJ com certificado comum e o caso de certificados diferentes por filial sejam ambos suportados.

### 5. Segurança e compatibilidade

- Manter PFX/P12 cifrado em repouso pelo vault existente e nunca persistir senha em texto claro.
- Não colocar certificado, senha, ciphertext, `APP_KEY` ou `FISCAL_CERT_MASTER_KEY_*` em props Inertia, HTML, logs, eventos, URLs ou mensagens de erro.
- Não usar S3 para armazenar o certificado nesta entrega, salvo decisão arquitetural já documentada; não reativar os campos legados `filiais.senhacertificadodigital`/arquivo.
- Manter auditoria das ações de upload, validação, revogação, criação/ativação/inativação de vínculo, sem registrar segredos.
- Usar as políticas/autorização existentes também quando a URL for acessada diretamente.

### 6. Testes e evidências

Defina testes automatizados e roteiro manual cobrindo, no mínimo:

- entrada e visibilidade do menu por perfil, módulo habilitado e rota ativa;
- navegação do índice para o contribuinte e retorno;
- upload válido, extensão/tamanho inválidos, senha incorreta, reautenticação inválida e erro de certificado;
- ausência de senha, arquivo, ciphertext e chave em DOM, props, respostas e logs;
- criação de vínculo para filial específica, UF SC, homologação, modelo 55 e capacidade de transmissão;
- ativação, inativação, revogação, conflito de preferência, vínculo expirado e tentativa sem autorização;
- uso de duas filiais com a mesma raiz de CNPJ, uma compartilhando certificado e outra com certificado distinto;
- confirmação de que nenhum fluxo assume automaticamente a filial `1`;
- seleção posterior do certificado pelo gateway/diagnóstico usando a chave completa do vínculo;
- regressão das rotas e serviços atuais de custódia, seleção, alertas e auditoria.

## Fora de escopo

- Implementar código nesta execução do `/speckit.specify`.
- Alterar o vault, o formato de cifragem, a rotação de chaves, o gateway SEFAZ ou a lógica de emissão de NF-e.
- Armazenar certificados em S3.
- Reintroduzir venda entre filiais, devolução entre filiais ou qualquer regra de negócio de transferência.
- Fazer fallback silencioso para certificado legado ou arquivo local em uma transmissão real.

## Entregáveis da especificação

Produza:

1. fluxo de telas e estados;
2. contrato de menu/autorização;
3. contrato dos formulários e rotas existentes;
4. modelo de vínculo e regras de conflito;
5. critérios de segurança e sanitização;
6. plano de testes automatizados e manual para homologação;
7. checklist de aceite e evidências esperadas.

Não implemente durante `/speckit.specify`.
```
