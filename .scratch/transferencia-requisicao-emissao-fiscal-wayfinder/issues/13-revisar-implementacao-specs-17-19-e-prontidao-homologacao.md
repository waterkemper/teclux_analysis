# Revisar implementação das specs 17–19 e prontidão para homologação

Type: research
Status: resolved
Blocked by:

## Question

Depois das specs 17, 18 e 19, o fluxo atual está pronto para emitir a primeira NF-e modelo 55 de `Transferencia` em homologação? Quais ajustes ainda precisam de prompts `/speckit.specify` antes do teste real?

## Scope

Somente `Transferencia`, NF-e modelo 55, filial base emitente e ambiente de homologação. `VendaTransferencia`, `DevolucaoTransferencia`, NF-e de entrada automática e financeiro permanecem fora do fluxo.

## Answer

As specs 17–19 fecharam os bloqueadores anteriores de origem autoritativa da fotografia, indicadores `ide`, revalidação obrigatória do `nfeProc`, aplicação dos quatro endpoints efetivos, gate de elegibilidade e associação do snapshot ao grupo.

O primeiro smoke real ainda não deve ser liberado por três motivos:

1. `RunFiscalHomologacaoDiagnosticoService` seleciona o certificado por filial, mas `NfePhpFiscalGateway::statusServico` cria outro `CertificateRequest` com `filialCodigo: null`. Em um grupo de filiais com a mesma raiz de CNPJ, isso permite diagnosticar com um certificado e transmitir com outro.
2. `schemaPackageHash` é tratado como hash do arquivo XSD raiz. A especificação chama esse valor de hash do pacote; um XSD importado pode ser alterado sem que a validação detecte a divergência.
3. O dry-run persiste `FalhaOperacional` quando há bloqueios, mas responde `estado_preparacao` a partir do objeto de grupo em memória. A resposta operacional pode declarar um estado diferente do estado persistido que o gate consulta.

Há ainda uma decisão de fonte que deve ser explicitada antes da emissão: `tp_imp` é lido de chaves dentro de `endpoints`/`qrcode`, estruturas que não são semanticamente sua fonte natural. Deve haver uma regra documentada e testada, sem valor inventado silenciosamente.

## Evidências

- Revisão desde `56f6b8d3` até `8f5194ba2edcc444282d868aebee06b4bc7278a1`.
- Specs implementadas nos commits `27030dc3`, `d8c70545` e `8f5194ba`.
- Os arquivos críticos passaram em `php -l` com PHP local 8.2.21.
- A suíte não foi executada: o projeto exige PHP `^8.5` e não havia configuração Docker disponível neste checkout para executar o ambiente suportado.

## Veredito

`NAO_LIBERAR_SMOKE_REAL` até implementar e validar os prompts 20 e 21 em PHP 8.5, executar a suíte autoritativa, obter diagnóstico aprovado para a filial concreta e confirmar o gate `liberado_rb03=true` para o mesmo grupo.

