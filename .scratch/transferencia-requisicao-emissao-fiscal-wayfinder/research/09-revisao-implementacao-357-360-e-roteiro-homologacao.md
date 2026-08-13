# Revisao da implementacao 357-360 e roteiro de homologacao

Data: 2026-08-12

## Base observada

O checkout `laravel` esta em `main`, commit `5346c04c`, com as implementacoes das specs 357, 358, 359 e 360:

- `86e48891` - fotografia, XML, chave e pacote normativo;
- `6b473608` - parser SEFAZ e custodia;
- `75c6ab4f` - preflight, smoke gate e runtime;
- `5346c04c` - gates de integridade, projecao, reconciliacao e outbox.

Nenhum codigo foi alterado nesta revisao.

## O que foi fechado

- Serializer exige fotografia completa, `cNF`, `dhEmi`, `cDV`, chave e campos fiscais sem defaults silenciosos.
- Parser passou a usar DOM/namespaces e nao fabrica protocolo autorizado.
- `nfeProc` possui builder separado e rejeita protocolo sintetico.
- Allowlist de adapters reais, status `cStat=107`, limpeza de certificado e probes de infraestrutura foram adicionados.
- Projecao exige hash/revisao/identidade, possui outbox, retry, sweep e dead-letter.
- Composer passou a declarar PHP `^8.5`.
- VendaTransferencia e DevolucaoTransferencia continuam fora do fluxo ativo.

## Bloqueadores restantes para NF-e real

### R-15 - caminho HTTP ainda nao fornece fotografia fiscal completa

`TransferenciaFiscalPrepararFotografiaService` ainda obtem `codigo_fiscal`, transporte, pagamento e volumes somente de `overrides`. Tributos podem vir de override; indicadores como ambiente, `tpNF`, `idDest`, `tpImp`, `tpEmis`, `finNFe`, `indFinal`, `indPres`, `procEmi` e `verProc` ainda recebem valores construidos pelo preparer. O endpoint HTTP real passa fixture vazia fora de testes e, portanto, tende a bloquear antes do seal ou nao possui fonte de dominio suficiente.

O serializer nao chama `tagvol`; o campo `volumes` da fotografia nao chega ao XML. A origem oficial de cada campo deve ser definida antes de qualquer smoke real.

### R-16 - snapshot, endpoint e pacote XSD ainda nao sao a mesma coisa usada na transmissao

O gateway valida a existencia do endpoint de autorizacao, mas `NfePhpToolsFactory` monta `Tools` sem receber o endpoint efetivo. A chamada pode seguir o mapeamento interno do NFePHP, diferente do endpoint evidenciado pelo snapshot. A selecao XSD ainda possui nomes fixos `nfe_v4.00` e fallback por glob.

### R-17 - custodia canonica precisa de prova final de identidade

`NfePhpNfeProcBuilder` ainda usa `4.00` como fallback da versao do `nfeProc` e o caminho `Complements::toAuthorize` precisa provar, apos a montagem, que a NF-e assinada persistida e o `protNFe` real possuem a mesma chave, digest, ambiente, emitente, modelo, serie e numero.

### R-18 - preflight e smoke precisam estar vinculados ao alvo real

O diagnostico resolve certificado com `filialCodigo: null`. O smoke gate aceita `uf` ausente, valida apenas o veredito do diagnostico e nao confere se o registro aprovado corresponde exatamente a filial, UF, modelo, ambiente e snapshot usados no grupo. O comando liberado apenas retorna checklist; a emissao continua sendo uma chamada HTTP separada.

## Pre-requisitos externos

- container PHP 8.5 com dependencias Composer instaladas;
- banco, Redis, worker/Horizon e storage de artefatos operacionais;
- UF, filial base e filial requisitante definidas;
- CNPJ/IE, endereco IBGE, regime CRT, certificado A1 e vinculo explicito com a filial emissora;
- credenciamento de homologacao e autorizador/endpoint confirmados;
- grupo Transferencia real com itens, NCM, CFOP, GTIN/SEM GTIN explicitamente resolvido, ICMS/PIS/COFINS, totais, transporte e pagamento;
- nenhum dado de VendaTransferencia, DevolucaoTransferencia ou NF-e de entrada.

## Roteiro de teste recomendado

1. Rodar a suite 357-360 no container e arquivar exit code e saida.
2. Executar `fiscal:diagnostico-homologacao --filial=<BASE> --modelo=55 --uf=<UF> --json`; exigir `APROVADO`, `cStat=107`, allowlist, certificado, schemas e infraestrutura pass.
3. Executar `fiscal:smoke-transferencia-homologacao --filial=<BASE> --modelo=55 --uf=<UF> --diagnostico-id=<ID> --grupo=<KEY> --json`; exigir `liberado_rb03=true`.
4. Somente entao chamar a rota existente `POST /consultas/interlojas/transferencia-requisicao-exposicao/fiscal/emitir` com o grupo Transferencia real, sem fixture e sem `usar_contrato_fake`.
5. Consultar o grupo por `GET .../fiscal/grupos/{key}` e arquivar fotografia/hash, serie/numero, chave, situacao fiscal/processamento e referencias de XML assinado, protocolo e `nfeProc`.
6. Em autorizacao, conferir protocolo SEFAZ real, digest, chave e `nfeProc`; em processamento/timeout, consultar por recibo/chave e nao retransmitir cegamente.
7. Confirmar uma unica projecao, repetir a leitura/replay e confirmar zero segunda satisfacao, zero NF-e de entrada e zero efeito financeiro fora do escopo.
8. Encerrar com pacote sanitizado e aprovacao fiscal/operacional. Homologacao nao tem validade juridica nem promove producao.

## Veredito

As specs 357-360 estao implementadas substancialmente, mas a primeira NF-e real permanece bloqueada ate fechar R-15 a R-18 e obter os pre-requisitos externos.
