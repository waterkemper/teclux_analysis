# Prompt `/speckit.specify` — preservar certificado e filial em todo o smoke fiscal

## Contexto

Na revisão do `HEAD` após as specs 17–19, o diagnóstico resolve material de certificado com `filialCodigo` concreto, mas `NfePhpFiscalGateway::statusServico` cria um novo `CertificateRequest` com `filialCodigo: null`. Assim, o status pode usar um certificado selecionado por UF/ambiente/modelo, enquanto a emissão usa outro.

Isso é um risco real para grupos de filiais que compartilham a mesma raiz de CNPJ: a raiz não deve substituir a associação explícita da filial ao certificado. O problema é de identidade do alvo e de segurança operacional, não de reabrir venda ou devolução.

Não implementar nesta etapa. Gerar a especificação `/speckit.specify`, contratos, tarefas e testes; manter o escopo em `Transferencia`, NF-e 55 e homologação.

## Objetivo

Garantir que diagnóstico, status, assinatura, autorização e consultas do smoke usem o mesmo emitente fiscal e a mesma identidade de certificado resolvida para a filial base do grupo.

## Requisitos

- A intenção de `StatusServicoCommand` deve carregar a filial concreta ou o material de certificado já resolvido, conforme a fronteira arquitetural vigente; o gateway não pode descartar essa identidade e fazer seleção ampla.
- O `CertificateRequest` do status deve conservar `filialCodigo`, UF, ambiente, modelo e finalidade observável nos testes, sem registrar segredo, senha ou PEM.
- A emissão deve rejeitar certificado ausente, expirado, incompatível, não vinculado à filial ou divergente do alvo antes de transmitir.
- Filiais com a mesma raiz de CNPJ devem continuar podendo compartilhar certificado somente quando houver associação explícita válida; nunca selecionar certificado apenas pela raiz.
- Diagnóstico, preparação, autorização e reconciliação devem permitir auditar `filial`, identificador não sensível do certificado, snapshot e endpoint, sem material secreto.
- O fluxo deve continuar somente em homologação e somente para `Transferencia`; não adicionar fallback para produção, venda, devolução ou NF-e de entrada.
- Definir a posse/lifetime do material em memória: liberar segredo após o uso e não persistir certificado bruto em logs, fotografia ou pacote de evidências.

## Testes de aceite

- Teste unitário prova que `statusServico` recebe a filial base concreta no `CertificateRequest`.
- Duas filiais da mesma raiz, com certificados diferentes, provam que diagnóstico e emissão não trocam de certificado.
- Certificado explicitamente associado à filial A e usado para a filial B resulta em bloqueio tipado, sem chamada SEFAZ.
- Diagnóstico e emissão com o mesmo certificado autorizado produzem evidência compatível de filial, certificado não sensível, snapshot e endpoint.
- Nenhum teste ou log contém senha, PEM, chave privada ou conteúdo integral do certificado.
- O smoke com filial elegível continua exigindo ambiente de homologação, grupo `Transferencia`, gate liberado e uma única tentativa idempotente.

## Saída esperada

Publicar spec, contrato de identidade do certificado, matriz de falhas, tarefas e atualização do roteiro de homologação. Não alterar código nesta chamada e não declarar prontidão sem executar os testes no PHP 8.5.

