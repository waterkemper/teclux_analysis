# Prompt 03 — Motor estatístico, modelos e incerteza

## Prompt para /speckit.specify

/speckit.specify

Especifique e implemente o motor estatístico Laravel da Reposição, recebendo somente o dataset canônico do prompt 02. A primeira entrega é Laravel-only; não crie worker Python, serviço externo ou persistência de modelo treinado.

O motor deve comparar por segmento e canal, usando seleção por backtest:

- baseline ingênuo, média móvel e suavização exponencial;
- ETS para séries regulares e sazonais quando houver evidência;
- SBA/TSB para demanda intermitente;
- regressão linear como candidato explicável, somente se as features forem confiáveis;
- KNN apenas para analogia/cold start, nunca como padrão universal;
- boosting inicialmente apenas em sombra/piloto;
- previsões quantílicas quando houver dados suficientes;
- Monte Carlo para incerteza, lead time e cenários, nunca como previsão isolada.

O cliente configura modelos permitidos por política/segmento. O backtest seleciona o vencedor; a fixação manual exige justificativa. Registre algoritmo, versão, parâmetros, features, fallback, métricas e confiança. Na primeira entrega, versionar a definição e os parâmetros é suficiente; não armazenar artefatos de treinamento.

O resultado deve conter previsão pontual, intervalo/quantis quando disponíveis, confiança, qualidade da amostra, motivo do fallback e explicação legível. Baixa amostra, série censurada, qualidade insuficiente ou instabilidade devem degradar para baseline/ECC, nunca produzir falsa precisão.

O motor calcula recomendação, mas não decide fonte, autorização, concentração ou geração de pedidosfiliais. Não aplicar regras M/D/U/F/O/C como responsabilidade do algoritmo.

## Aceite

- [ ] Há baseline obrigatório para comparação.
- [ ] A escolha é por segmento e canal, via backtest temporal.
- [ ] KNN e Monte Carlo não são usados como padrão implícito.
- [ ] Confiança e incerteza aparecem no resultado.
- [ ] Fallback é determinístico e auditável.
- [ ] Cliente escolhe modelos permitidos sem defaults de base.
- [ ] Nenhum algoritmo grava diretamente em estoque ou pedidosfiliais.
- [ ] A primeira entrega roda somente no Laravel.
