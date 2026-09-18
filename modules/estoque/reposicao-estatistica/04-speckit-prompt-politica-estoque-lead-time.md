# Prompt 04 — Política de estoque, proteção e lead time

## Prompt para /speckit.specify

/speckit.specify

Especifique e implemente a camada de política de inventário entre a previsão do prompt 03 e a alocação do prompt 05. Separe previsão de demanda, política de estoque, otimização de rede e workflow operacional.

Permita configuração por cliente, rotina, segmento e canal de:

- horizonte de proteção e período de revisão;
- nível de serviço ou quantil alvo;
- componentes de posição de estoque;
- estoque de segurança;
- ponto de pedido;
- nível alvo e guardrails de mínimo/máximo;
- limites de quantidade e valor;
- tratamento de baixa confiança e dados censurados.

Use a incerteza da previsão e a variabilidade observada de demanda/lead time para formar proteção. Mínimo e máximo são limites de política, não substitutos silenciosos da previsão. A fórmula efetiva, arredondamento e precisão devem respeitar a base e o contrato atual; embalagens e múltiplos ficam fora desta entrega.

Modele lead time separando criação, trânsito e recebimento para transferência e compra. Use apenas marcos confiáveis; marcos ausentes são censura e reduzem a confiança. Não invente lead time padrão de cliente. Quando não houver evidência, aplicar fallback configurado e sinalizar exceção.

Calcule a necessidade única do destino. O resultado deve informar demanda protegida, posição de estoque, mínimo, máximo, estoque de segurança, cobertura, lead time, quantidade sugerida e motivo. Ainda não escolher fonte nem gerar pedidosfiliais.

## Aceite

- [ ] A camada de política é separada do modelo estatístico.
- [ ] Mínimo/máximo funcionam como guardrails configuráveis.
- [ ] Componentes de estoque e parâmetros são fotografados.
- [ ] Lead time de transferência e compra é separado.
- [ ] Falta de evidência reduz confiança e não recebe default oculto.
- [ ] Embalagens e múltiplos não são introduzidos.
- [ ] A necessidade não é duplicada entre transferência e compra.
