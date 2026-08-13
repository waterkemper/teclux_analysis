# Definir o documento e os papéis fiscais da transferência

Type: grilling
Status: resolved
Blocked by: 01

## Question

Na transferência confirmada, qual é o Documento Fiscal de Saída, quem é o Estabelecimento Fiscal emitente, quem é destinatário/cliente, e existe Documento Fiscal de Entrada ou apenas uma projeção na Filial Requisitante? Decidir a unidade de emissão, a relação com Requisição, Transferência, Lote e Conferência, o modelo fiscal aplicável e os casos de Filiais no mesmo ou em diferentes Contribuintes Fiscais.

## Answer

A operação produz NF-e modelo 55 de saída, emitida pela FilialBase como Estabelecimento Fiscal elegível e destinada à Filial Requisitante. Não há NF-e de entrada automática; o destino recebe somente uma projeção idempotente após autorização. O grupo é Transferência + Filial Requisitante + operação + conjunto imutável de linhas. Raiz de CNPJ participa da classificação legada, mas nunca escolhe certificado ou estabelecimento sozinha. Decisão consolidada em [especificacao.md](../../../modules/interlojas/transferencia-requisicao-emissao-fiscal/especificacao.md), DECISÃO-TRF-FISCAL-001 a 003.
