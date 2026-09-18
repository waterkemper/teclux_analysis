# Prompt 07 — Tela de revisão, explicabilidade e aprovação

## Prompt para /speckit.specify

/speckit.specify

Crie a tela própria de Reposição Estatística, separada de Estoques → Compras → Consultas, usando a Variante A — Bancada de decisão definida no mapa.

A tela deve mostrar:

- execução, rotina, snapshot, data, filtros e estado;
- totais de candidatos, recomendados, alertas e bloqueados;
- lista com produto, descrição, filial destino, quantidade estatística, quantidade ECC, risco e estado;
- painel de evidências ao selecionar uma linha;
- previsão, intervalo/quantis, vendas observadas, estoque atual/projetado, componentes usados, cobertura, mínimo, máximo, estoque de segurança, lead time, fontes e saldo residual;
- modelo, versão, confiança, qualidade da amostra, fallback e explicação legível;
- comparação estatística × ECC sem ocultar divergência;
- origem da recomendação e resultado da revalidação.

Ações:

- visualizar histórico e cálculo;
- excluir item com justificativa;
- editar quantidade com valor original, novo valor e justificativa;
- revalidar fatos vivos;
- aprovar revisão;
- rejeitar/dispensar;
- confirmar somente depois da revalidação e das autorizações existentes.

Snapshot obsoleto, fonte insuficiente, baixa confiança, conflito estatística/ECC e falha de qualidade devem ser visíveis e impedir aprovação quando a política determinar. A tela não altera filtros ou snapshot da execução. A autorização de acesso ao módulo permanece distinta da senha/perfil gerente de vendas já existente.

## Aceite

- [ ] Tela é separada da Consulta de Compras manual.
- [ ] Variante A é implementada como lista + painel de evidências.
- [ ] Cada recomendação é explicável e rastreável.
- [ ] Edição/exclusão exige justificativa e auditoria.
- [ ] Snapshot obsoleto impede confirmação direta.
- [ ] Revalidação ECC ocorre antes da geração.
- [ ] Regras de gerente continuam no escopo correto.
- [ ] Nenhuma ação dispara efetivação sem confirmação explícita.
