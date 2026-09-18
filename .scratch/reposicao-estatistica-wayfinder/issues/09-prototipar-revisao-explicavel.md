# Prototipar tela de revisão e explicabilidade

Type: prototype
Status: resolved
Blocked by:

## Answer

A interface escolhida é a **Variante A — Bancada de decisão**, documentada em [prototype-09-revisao-explicavel.md](../prototype-09-revisao-explicavel.md).

O operador verá uma lista de recomendações com produto, filial destino, quantidade estatística, quantidade ECC e risco. Ao selecionar uma linha, abrirá um painel de evidências com previsão, estoque atual/projetado, mínimo/máximo, cobertura, fontes candidatas, modelo, confiança, histórico e cálculo.

A aprovação será da revisão, não do snapshot. Antes de efetivar, o ECC revalidará fatos vivos e aplicará disponibilidade, concentração, alocação e demais regras existentes. Edição ou exclusão exigirá justificativa e ficará auditada. Snapshot obsoleto, falha de qualidade/infraestrutura, divergência estatística/ECC e fonte insuficiente serão exceções explícitas, com fallback para ECC/revisão manual.

O protótipo é descartável e serve à validação da estrutura; a implementação de produção será especificada posteriormente nos prompts do Speckit.

## Question

Como o operador deve revisar uma recomendação antes de gerar a requisição: previsão, histórico, estoque atual/projetado, cobertura, mínimo/máximo, estoque de segurança, lead time, incerteza, fonte, alternativas, motivo, confiança e alertas?

Prototipar uma tela própria de Reposição Inteligente, separada da Consulta de Compras, com filtros configuráveis por cliente, comparação com ECC, edição controlada, justificativa, aprovação sensível, revalidação e identificação de snapshot obsoleto.
