# Revisar a implementação da spec 23 e a prontidão para homologação

Type: research
Status: resolved
Blocked by:

## Question

Após a implementação da spec 23, o publicador grava e valida o digest do pacote XSD sem criar uma segunda autoridade? Existem novos bloqueios de código antes do teste real de NF-e 55 em homologação?

## Scope

Transferência, NF-e 55, homologação e runtime Linux. Venda/devolução entre filiais, produção e implementação nesta revisão permanecem fora.

## Answer

A implementação fiscal da spec 23 está presente no `HEAD` `543f0c50`, no commit `bc8d77f0`, sobre a spec 22 `26cc593b`:

- `fiscal:xsd-package-digest` calcula o digest por `FiscalXsdPackageIntegrityPort` e usa a mesma autoridade do resolver;
- `fiscal:publicar-config` valida ausência, formato, hash da raiz e divergência antes de gravar;
- `CloudFiscalPublishRepository` persiste `schema_package_hash` e recusa pacote publicado legado sem hash;
- `--dry-run` não grava e retorna digest sanitizado;
- o snapshot carrega o digest persistido;
- a documentação ordena soap → bucket → digest → publicação → cache → diagnóstico → dry-run → gate.

Não foi encontrado novo bloqueador funcional claro que justifique o Prompt 24. A suíte autoritativa ainda precisa rodar no container Linux: nesta sessão o Docker não permitiu acesso ao daemon. Há apenas trailing whitespace em documentação/specs novas.

O merge também contém alterações de UI sem relação com o fiscal; elas não foram consideradas no veredito fiscal.

## Operational verdict

`CÓDIGO FISCAL PRONTO PARA ENSAIO CONTROLADO`, mas ainda `NÃO_LIBERAR_TRANSMISSÃO` até: imagem com SOAP, bucket, configuração SC/55/homologação com endpoints reais, digest publicado, certificado da filial, suíte verde, diagnóstico `APROVADO` com `cStat=107`, dry-run elegível e gate liberado.

