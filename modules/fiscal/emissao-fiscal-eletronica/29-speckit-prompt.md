# Prompt para `/speckit.specify` — configuração normativa fiscal por UF e resolução automática pela Filial

```text
/speckit.specify

Revise o código Laravel atual e produza uma especificação pronta para implementação para substituir a dependência operacional do UniNFe/Delphi na configuração normativa de emissão fiscal.

Não implemente código nesta execução. Defina a habilitação administrativa do pacote fiscal, a resolução automática pela UF da Filial e a exibição da configuração efetiva no cadastro fiscal da Filial.

## Escopo que prevalece

1. O escopo funcional é a plataforma fiscal comum, com primeiro aceite em NF-e modelo 55, Transferência e homologação.
2. NFS-e, Emissor Nacional, regras municipais e modelo 98 permanecem fora.
3. Venda entre Filiais, `VendaTransferencia`, devolução entre Filiais e `DevolucaoTransferencia` permanecem fora.
4. Produção e ativação automática em produção permanecem fora.
5. Certificados continuam na tela própria e vinculados explicitamente ao estabelecimento. Não criar fallback por raiz de CNPJ.
6. O runtime alvo é Linux.

## Contexto confirmado no código

O projeto já possui:

- `FiscalConfigurationResolver`, que recebe Filial, modelo, ambiente e data e consulta a configuração pela UF da Filial;
- `cloud_fiscal_pacotes_regulatorios` e `cloud_fiscal_configuracoes`;
- `fiscal:publicar-config`, com validação de pacote e `schema_package_hash`;
- `fiscal:xsd-package-digest`;
- diagnóstico de homologação;
- governança normativa JSON em `/fiscal/normativo/eventos`;
- tela administrativa de certificados em `/fiscal/certificados`.

O diagnóstico para `filial=1`, `UF=SC`, `modelo=55` retornou `LACUNA`: não existe configuração `PUBLICADA` vigente para SC/modelo 55/homologação/data atual.

O baseline contém apenas uma configuração de exemplo para SP, mas não configura SC. A ausência da linha publicada é uma lacuna operacional de habilitação, não motivo para cadastrar endpoints e XSD individualmente em cada Filial.

Confirme também que o diagnóstico declara `--uf` opcional, mas o serviço exige UF explícita. A UF deve ser derivada do cadastro da Filial no fluxo normal.

## Decisão arquitetural obrigatória

Especificar uma solução híbrida:

- configuração normativa centralizada por UF, modelo, ambiente e vigência;
- UF derivada automaticamente do cadastro autoritativo da Filial;
- configuração efetiva resolvida pelo módulo fiscal comum;
- certificado, série, numeração e demais particularidades próprias da Filial;
- sem duplicar endpoint, XSD, hash, MOC ou notas técnicas em cada Filial;
- sem inferir endpoint ou pacote normativo apenas pelo texto da UF;
- tela da Filial somente exibe a configuração efetiva.

A interface do resolvedor deve permanecer pequena e profunda: callers informam Filial, modelo, ambiente e data; SQL, vigência, pacote, endpoints, hash e validações permanecem internos.

## Requisitos funcionais

### RF-01 — Resolução pela UF da Filial

Especificar e testar que:

- a UF é lida da Filial e normalizada em maiúsculas;
- duas Filiais do mesmo estado resolvem o mesmo snapshot normativo vigente;
- Filiais de estados diferentes resolvem configurações independentes;
- a resolução considera modelo, ambiente e data de vigência;
- configuração ausente, sobreposta, expirada ou incompatível gera código tipado;
- nunca é escolhido simplesmente o último registro inserido;
- certificado de uma Filial não é compartilhado automaticamente com outra da mesma raiz.

### RF-02 — Diagnóstico sem UF manual obrigatória

Corrigir o contrato do diagnóstico:

- sem `--uf`, usar a UF da Filial;
- com `--uf`, apenas confirmar que coincide com a Filial;
- UF divergente bloqueia antes de chamada à SEFAZ;
- HTTP não pode aceitar UF que substitua a UF cadastrada;
- evidência deve registrar a UF efetivamente resolvida.

### RF-03 — Tela administrativa de configuração normativa

Especificar uma tela seguindo o padrão visual existente, restrita a administrador/capability fiscal, contendo:

- listagem por UF, modelo, ambiente, vigência, pacote e estado;
- consulta da configuração vigente e do histórico;
- importação de pacote/configuração versionados;
- `dry-run` antes da publicação;
- publicação explícita com motivo obrigatório;
- validação de sobreposição de vigência;
- imutabilidade de publicação utilizada, exigindo nova versão/código;
- estados `PUBLICADA`, `INELEGÍVEL`, `EXPIRADA`, `SOBREPOSTA` e `INCOMPLETA`;
- endpoint sanitizado, pacote, leiaute, autorizador e hash, sem segredos ou certificado;
- auditoria de usuário, data, motivo e versão.

A tela não deve solicitar razão social, raiz de CNPJ ou dados repetidos de Filial. A Filial serve para resolução e consulta da configuração efetiva.

Definir se a tela chama o caso de uso de publicação ou gera payload para o fluxo existente. Em qualquer alternativa, reutilizar todas as validações do `fiscal:publicar-config` e nunca gravar diretamente por controller.

### RF-04 — Contrato do pacote importado

O contrato deve conter, no mínimo:

- código imutável;
- leiaute, MOC e notas técnicas;
- referência lógica do XSD raiz;
- manifesto e `schema_package_hash` completo;
- autorizador;
- endpoints por serviço;
- UF, modelo, ambiente e vigência;
- contingências compatíveis;
- metadados sanitizados.

Reutilizar o resolver/validador XSD existente. Não duplicar o algoritmo de digest em tela, controller ou serializer.

Rejeitar antes da publicação:

- hash ausente, inválido, de XSD raiz ou divergente;
- import/XSD ausente ou incompatível;
- endpoint de produção em homologação;
- pacote não publicado ou incompatível com o modelo;
- vigência sobreposta;
- configuração sem autorizador ou serviço obrigatório;
- alteração de pacote publicado.

Publicação, dry-run e validação de pacote não podem chamar a SEFAZ.

### RF-05 — Configuração efetiva na Filial

Especificar um cartão somente leitura na área fiscal da Filial com:

- UF derivada do cadastro;
- modelo e ambiente consultados;
- configuração efetiva;
- pacote, leiaute e vigência;
- status de resolução;
- motivo de bloqueio, se houver;
- link para detalhes da configuração normativa;
- ação para diagnóstico de homologação.

Separar claramente configuração normativa, certificado da Filial, schemas/XSD, infraestrutura e comunicação SEFAZ. Não apresentar “pronto” quando apenas a configuração normativa estiver válida.

### RF-06 — Governança e segurança operacional

Manter publicação controlada:

- somente administrador/capability fiscal publica;
- `dry-run` não persiste;
- motivo é obrigatório;
- publicação é versionada e auditável;
- nenhuma ativação automática por evento observado;
- homologação nunca pode apontar para produção;
- não exibir senha, PFX, chave privada, token ou segredo em tela, logs ou evidências.

## Homologação obrigatória

Atualizar o runbook com a sequência:

1. confirmar a UF da Filial;
2. importar e validar o pacote XSD normativo real;
3. executar `fiscal:xsd-package-digest`;
4. executar `fiscal:publicar-config --dry-run`;
5. publicar a configuração SC/modelo 55/homologação;
6. consultar a configuração efetiva na tela da Filial;
7. confirmar o certificado vinculado especificamente à Filial;
8. executar o diagnóstico sem exigir `--uf`;
9. aceitar comunicação somente com `cStat=107`;
10. somente então executar o gate de Transferência.

Não criar endpoint, XSD, hash ou vigência fictícios para liberar o teste.

## Testes obrigatórios

Criar testes Unit/Feature/PostgreSQL para provar:

- diagnóstico sem `--uf` usando a UF da Filial;
- `--uf` coincidente aceito;
- `--uf` divergente bloqueado antes da SEFAZ;
- duas Filiais de SC usando o mesmo snapshot normativo;
- SC e SP usando snapshots distintos;
- certificado nunca escolhido por fallback de raiz;
- publicação válida criando configuração vigente;
- pacote sem hash, hash raiz ou hash divergente recusado;
- sobreposição recusada;
- publicação imutável recusada;
- `dry-run` sem persistência;
- usuário sem capability impedido de publicar;
- ausência de configuração apresentada como `LACUNA` clara na tela da Filial;
- configuração válida exibida como efetiva sem cadastro manual de endpoint na Filial;
- diagnóstico e emissão utilizando o mesmo snapshot;
- nenhum segredo na resposta administrativa;
- nenhum fluxo de NFS-e, venda ou devolução criado ou reativado.

## Critérios de aceite

- administrador consegue habilitar SC/modelo 55/homologação sem editar diretamente o PostgreSQL;
- todas as Filiais de SC aproveitam a mesma configuração normativa vigente;
- tela da Filial não solicita UF, endpoint, XSD ou hash como dados manuais;
- diagnóstico deriva a UF da Filial e usa `--uf` apenas como confirmação opcional;
- ausência de configuração informa `LACUNA` e o próximo passo administrativo;
- pacote publicado possui hash completo e verificável do manifesto XSD;
- configuração, certificado e infraestrutura continuam dimensões distintas;
- nenhuma chamada SEFAZ ocorre durante importação, validação, dry-run ou publicação;
- escopo permanece emissão fiscal NF-e 55/Transferência em homologação Linux.

## Entregáveis

Entregar `spec.md`, contratos do resolvedor e das telas, contrato de importação/dry-run/publicação, matriz de autorização/auditoria/estados, tarefas de backend/frontend/banco/testes, atualização do runbook e matriz de rastreabilidade entre Filial, UF, pacote, certificado e diagnóstico.

Não alterar código nesta chamada e não declarar prontidão sem pacote normativo real publicado, diagnóstico aprovado e evidência sanitizada.
```
