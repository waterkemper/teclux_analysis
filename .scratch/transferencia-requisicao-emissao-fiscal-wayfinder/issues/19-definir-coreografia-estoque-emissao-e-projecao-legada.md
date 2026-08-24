# Definir a coreografia de estoque, emissão e projeção legada

Type: grilling
Status: resolved
Blocked by: 18

## Question

Qual é a transação e a ordem canônica entre confirmação da Transferência, movimentos `SPT`/`SET`/`TPE`/`TFR`, fotografia fiscal, alocação de número, autorização SEFAZ e projeção em `dadosfiscais`, `notas` e `pedidosfiliais`, garantindo que o Laravel não duplique o estoque já movimentado e que Delphi e Laravel possam reconciliar o mesmo documento?

O ticket deve decidir também o comportamento em falha antes/depois do commit, a associação do `dadofiscal` aos pedidos, o tratamento de reprocessamento e a autoridade entre confirmação operacional e emissão fiscal. Somente `Transferencia` permanece em escopo; `VendaTransferencia`, `DevolucaoTransferencia`, NF-e de entrada e financeiro ficam fora.

## Answer

### Decisão consolidada

Para cada grupo de requisições elegível, Laravel deve executar uma transação curta e atômica de preparação operacional e fiscal:

1. Recarregar e bloquear requisições, estoque, série e demais dependências necessárias.
2. Validar elegibilidade, lotes, quantidades, saldos, emitente, destinatário e fotografia fiscal.
3. Selar a fotografia fiscal imutável.
4. Alocar o `dadofiscal` e o número fiscal usando `FOR UPDATE` na combinação filial/estabelecimento, modelo, série e ambiente.
5. Persistir `dadosfiscais`, `notas`, itens, volumes e o vínculo de `pedidosfiliais.dadofiscal`.
6. Gravar uma única vez os movimentos `SPT`/`SET` e, quando a regra operacional exigir, `TPE`/`TFR`. Os movimentos devem aceitar e persistir o vínculo fiscal com `dadofiscal` e, quando aplicável, número/série; não deve ser criado um segundo movimento após a autorização.
7. Fechar a requisição operacionalmente e criar o outbox de autorização.
8. Fazer commit.
9. Transmitir assincronamente pelo pipeline fiscal comum e atualizar o estado fiscal, protocolo, XML e artefatos.

A comunicação com a SEFAZ nunca deve ocorrer dentro da transação que mantém os bloqueios de numeração e estoque.

### Estados e falhas

- O estado operacional da requisição é concluído no commit da confirmação; o estado fiscal é acompanhado separadamente como preparado, pendente de transmissão, autorizado, rejeitado ou requerendo inutilização manual.
- Falhas antes do commit fazem rollback da preparação, dos vínculos e dos movimentos.
- Depois do commit, indisponibilidade ou rejeição da SEFAZ não desfaz estoque nem reabre a requisição automaticamente.
- A mesma NF-e pode ser retransmitida de forma idempotente, sem reservar novo número. Depois das tentativas previstas, o documento fica em `requer_inutilizacao_manual`; a inutilização poderá ser executada futuramente no Delphi, pelo módulo de notas fiscais avulsas.
- Um número alocado não é reutilizado depois do commit. A unicidade deve ser garantida por filial/estabelecimento, modelo, série, ambiente e número, em conjunto com o bloqueio pessimista.

### Coexistência Laravel/Delphi

Antes de reservar número, Laravel deve procurar documento fiscal já vinculado à transferência ou ao `dadofiscal`. Se existir, deve reconciliar o mesmo documento e nunca emitir outro. Para transferências novas, Laravel é o emissor; Delphi pode consultar, imprimir e inutilizar manualmente, mas não emitir novamente a mesma transferência.

Após a autorização, a projeção é fiscal e idempotente: protocolo, status, XML, DANFE/artefatos e vínculos legados. Não há NF-e de entrada automática, fluxo financeiro, `VendaTransferencia` ou `DevolucaoTransferencia` neste escopo.

### Classificação das evidências

- **CONFIRMADO:** a confirmação Laravel já grava movimentos operacionais e a plataforma fiscal comum possui outbox, numeração, autorização e artefatos.
- **CONFIRMADO:** o Delphi relaciona o documento fiscal aos movimentos e usa bloqueio na numeração.
- **DIVERGENTE:** o fluxo atual separa confirmação operacional e emissão fiscal e o contrato Laravel dos movimentos ainda não recebe toda a identificação fiscal.
- **DECISÃO NOVA:** a preparação operacional/fiscal será atômica; os movimentos existentes serão o único efeito de estoque; a transmissão ocorrerá depois do commit; e a falha fiscal não reverterá automaticamente o estoque.
