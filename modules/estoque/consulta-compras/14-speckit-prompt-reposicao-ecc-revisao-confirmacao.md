# Prompt para `/speckit.specify` — Reposição ECC: revisão e confirmação

```text
/speckit.specify

Crie uma especificação funcional e técnica para a tela e o contrato de revisão da **Reposição ECC**, consumindo os prompts 12 e 13 /mnt/c/teclux_analysis/modules/estoque/consulta-compras/ em . Não implemente código. A primeira fase prepara propostas automaticamente, mas a confirmação da Requisição entre Filiais sempre depende de usuário autorizado.

## Tela própria

Defina uma tela operacional separada de Estoques → Compras → Consultas, sob uma área de Reposição ECC. Ela deve permitir consultar rotinas, execuções, lotes pendentes, itens, fontes, justificativas, exceções e histórico. A Consulta de Compras manual permanece funcionando e não deve ser transformada em fila automatizada.

Todos os itens elegíveis e restritos podem ser calculados e visualizados por qualquer usuário que tenha acesso ao módulo. O bloqueio ocorre somente na conclusão.

## Revisão por lote e item

O lote deve permitir revisar, editar quando autorizado, excluir/dispensar item com justificativa e confirmar parcialmente. Itens válidos podem gerar a solicitação; itens que perderam validade, saldo ou elegibilidade permanecem como exceção sem apagar a proposta original.

Antes da confirmação, revalide no servidor:

- estoque e reservas da fonte;
- elegibilidade do Produto e da Filial destino;
- prefixos e concentração;
- sugestão e necessidade protegida da fonte;
- mínimo, máximo e pedidos concorrentes;
- duplicidade e existência de outro pedido equivalente;
- revisão do lote e concorrência da própria tela.

Se a fonte original perder saldo, tente redistribuir somente para outra fonte elegível segundo as mesmas regras do prompt 13. O saldo não atendido vira exceção identificada.

## Autorização de gerente

Quando o grupo do Produto tiver `somente_gerentes_solicitacao_ecc = true`, a conclusão daquele subconjunto exige autenticação contextual com usuário e senha de um usuário cujo `usuarios.gerentevendas = true`. A senha não é armazenada. O gerente autorizador pode ser diferente do preparador.

Propostas mistas devem ser separadas em escopo comum e escopo restrito: itens comuns seguem a permissão normal do módulo; itens restritos aguardam gerente. A auditoria registra preparador, autorizador, data/hora, itens autorizados e decisão.

## Efeito canônico

A confirmação deve gerar o processo já existente de `pedidosfiliais` / Requisição entre Filiais. Não criar um novo documento de transferência, não escrever movimentos diretamente pelo job e não duplicar locks/transações do núcleo existente.

Delegue ao `RequisicaoFiliaisCommandService` e seus commands (`SomarRequisicaoFiliaisCommand`, ou o contrato confirmado no checkout) a transação, locks advisory, locks ordenados de estoque, revalidação, movimentos, revisão e auditoria. O vínculo da proposta deve guardar os códigos de `pedidosfiliais` resultantes.

Defina idempotência para o caso em que a confirmação grava no banco mas a resposta se perde. Retry nunca pode repetir cegamente uma requisição já confirmada.

## Aceite mínimo

- [ ] A tela é independente da Consulta manual.
- [ ] Usuário comum vê todos os itens aos quais tem acesso.
- [ ] Grupo restrito exige `gerentevendas` somente na conclusão.
- [ ] Lote misto permite confirmação parcial.
- [ ] Toda confirmação revalida fatos no servidor.
- [ ] A confirmação usa o núcleo existente de `pedidosfiliais`.
- [ ] Não há escrita direta de estoque pelo job ou controller.
- [ ] Preparador e gerente autorizador ficam auditáveis sem persistir senha.
- [ ] Perda de saldo gera redistribuição segura ou exceção explícita.
```

### Fontes obrigatórias

- `/mnt/c/teclux_analysis/.scratch/consulta-compras-automacao-wayfinder/issues/02-definir-limite-automacao-aprovacao.md`;
- `/mnt/c/teclux_analysis/.scratch/consulta-compras-automacao-wayfinder/issues/06-definir-execucao-segura-e-auditoria.md`;
- `/mnt/c/teclux_analysis/.scratch/consulta-compras-automacao-wayfinder/issues/07-definir-fila-de-excecoes-e-indicadores.md`;
- `/mnt/c/teclux_analysis/laravel/docs/architecture/requisicao-filiais-nucleo.md`;
- `/mnt/c/teclux_analysis/laravel/docs/adr/0292-requisicao-filiais-nucleo.md`;
- `/mnt/c/teclux_analysis/laravel/docs/architecture/consulta-compras-requisicao-pedido-contrato.md`;
- `/mnt/c/teclux_analysis/laravel/backend/app/Services/Estoque/ConsultaComprasRequisicaoService.php`;
- `/mnt/c/teclux_analysis/laravel/backend/app/Application/Interlojas/RequisicaoFiliais/RequisicaoFiliaisCommandService.php`, localizando o caminho efetivo por classe se necessário;
- `/mnt/c/teclux_analysis/laravel/backend/config/sensitive-operation-auth.php` e os contratos existentes de autenticação contextual.
