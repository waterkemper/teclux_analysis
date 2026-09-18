# Prompts 23 a 36 - Configurabilidade ECC

Os prompts 23, 25 e 26 foram substituidos depois da decisao de permitir Rotinas ECC livres. O prompt 24 continua sendo a base do editor compartilhado de filtros, exceto sua secao de overlays fixos por tipo.

Executar na ordem:

1. 27 - modelo de dominio e contrato de rotina;
2. 28 - migration e compatibilidade;
3. 29 - dispatcher, snapshot e calculo;
4. 24 - seam compartilhado dos filtros, ajustado conforme 27;
5. 30 - editor completo;
6. 31 - aceite e regressao.
7. 32 - escopo por filial e read models por rotina.
8. 33 - hardening de filtros, integridade e contratos dos read models.
9. 34 - filtros de execucoes, vinculo tardio e agregacao segura de alertas.
10. 35 - hardening final dos read models, cardinalidade e determinismo dos alertas.
11. 36 - equival�ncia SQL/PHP, tratamento de NULL e reconhecimento at�mico.

Regra central: `tipo` legado nao pode voltar a ser a fonte de comportamento. O comportamento pertence a configuracao versionada da Rotina ECC.
