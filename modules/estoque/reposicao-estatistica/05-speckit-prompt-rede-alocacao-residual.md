# Prompt 05 — Rede de abastecimento, alocação e residual

## Prompt para /speckit.specify

/speckit.specify

Especifique e implemente a alocação da necessidade calculada no prompt 04, reutilizando o ECC e o fluxo existente. Inspecione ReposicaoEccAlocador, revalidação, concentrações, pedidos entre filiais e pedidosfiliais antes de alterar qualquer contrato.

O algoritmo deve:

1. receber a necessidade única por produto e filial requisitante;
2. analisar primeiro o estoque disponível no grupo para transferência;
3. respeitar posição configurada, reservas, trânsito, compromissos, mínimo/máximo e capacidade da fonte;
4. respeitar concentração produto × filial;
5. permitir múltiplas fontes quando a política permitir;
6. garantir que filial concentradora só receba transferência de outra filial concentradora;
7. preservar o saldo residual seguro de cada origem;
8. encaminhar somente a parcela não coberta para o canal de compra;
9. excluir foralinhal apenas do canal de compra;
10. excluir inativol dos dois canais.

A fonte inicialmente sugerida pelo cálculo é apenas tentativa. Na revalidação, o ECC deve reler fatos vivos e escolher novamente as fontes. Não zerar o piso da concentradora nem apagar a alocação original; registrar tentativa e resultado da revalidação.

Não criar um novo mecanismo de efetivação. A confirmação deve continuar usando o serviço/núcleo existente para gerar pedidosfiliais com requisitante, requisitada, quantidade e auditoria. O canal de compra deve retornar residual estruturado para o fluxo já existente, sem gravar pedido de fornecedor nesta fatia se o contrato atual não o suportar.

## Aceite

- [ ] Transferência é sempre analisada antes da compra residual.
- [ ] A necessidade não é contada duas vezes.
- [ ] Regras de concentração e fontes concentradoras são preservadas.
- [ ] Alocação multifonte é determinística e auditável.
- [ ] Revalidação ECC escolhe novamente com fatos vivos.
- [ ] pedidosfiliais continua sendo o fluxo de transferência.
- [ ] inativol e foralinhal seguem seus canais corretos.
- [ ] Nenhum cálculo grava diretamente em tabelas legadas.
