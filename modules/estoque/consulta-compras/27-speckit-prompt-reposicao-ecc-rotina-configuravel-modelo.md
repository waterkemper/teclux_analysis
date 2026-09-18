# Prompt 27 - Rotina ECC nomeada e configuravel

## Objetivo

Substituir o conceito de tres tipos ECC fixos por uma Rotina ECC independente, nomeada e configuravel. A rotina deve permitir que cada cliente cadastre quantas rotinas precisar por filial, renomeie uma rotina sem perder sua identidade e escolha suas proprias regras.

## Decisao de dominio

Usar estes termos:

- **Rotina ECC**: configuracao persistida que define uma execucao de reposicao para uma Filial Requisitante.
- **Nome da Rotina**: texto editavel para identificacao operacional; nao e identidade tecnica.
- **Configuracao da Rotina**: conjunto versionado de agenda, regras temporais, filtros da Consulta, motor e politicas ECC.
- **Snapshot ECC**: fotografia imutavel da configuracao efetiva e do recorte usado numa execucao.
- **Codigo legado de rotina**: `geralzao`, `vendido_dia_anterior` ou `produtos_novos_recebidos`, mantido apenas para compatibilidade e migracao.

O UUID da rotina e estavel. Renomear altera somente o nome atual; nao altera snapshots, lotes, janelas, idempotencia ou referencias historicas.

## Contrato canonico

Definir a rotina com estes blocos, usando nomes equivalentes aos ja adotados pelo projeto quando houver convencao melhor:

- `id` UUID;
- `nome` obrigatorio, editavel e unico por filial sem diferenciar maiusculas/minusculas;
- `filial_requisitante`;
- `ativa`;
- `agenda_json` com modo permitido, intervalo, primeira execucao, horario local e timezone;
- `regras_temporais_json` com filtros relativos ao dia civil da execucao;
- `parametros_json` com os filtros da Consulta de Compras;
- `motor_json` com o motor da Consulta de Compras;
- `politicas_ecc_json` com as regras ECC configuraveis;
- `config_version`, `revision` e auditoria.

O campo `tipo` pode permanecer como `codigo_legado` ou coluna de compatibilidade durante a transicao, mas nao pode ser obrigatorio para criar uma nova rotina e nao pode controlar o comportamento do dispatcher ou do snapshot.

## Agenda e recorte temporal

Na primeira fatia, suportar uma agenda segura e expressiva:

```json
{
  modo: intervalo_dias,
  intervalo_dias: 20,
  primeira_execucao: apos_ativacao,
  horario_local: 06:30,
  timezone: America/Sao_Paulo
}
```

O operador escolhe `intervalo_dias`; 1 e diario, 20 e a cada vinte dias. Nao transformar a agenda em cron ou codigo livre nesta etapa. Caso o produto ja suporte outros modos, eles devem ser descritos por um catalogo validado, nunca interpretados diretamente do cliente.

As regras temporais devem aceitar campos permitidos como `ultima_venda` e `entrada_nf`, offsets relativos a D, intervalo inclusivo e escopo de filial/deposito. Nao existem overlays automaticos impostos por nome ou tipo.

## Politicas ECC configuraveis

Expor no contrato versionado as regras que ja fazem parte da reposicao, incluindo prefixos M/D/U/F/O/C, minimo e maximo, sugestao baseada nos filtros, concentracao Produto x Filial, alocacao multi-fonte, restricao de fontes concentradoras, urgencia, pedidos entre filiais, compra existente e senha/perfil de gerente de vendas. Embalagem permanece fora do escopo atual.

As invariantes de seguranca e integridade continuam no dominio e nao podem ser desligadas por JSON arbitrario.

## Templates e compatibilidade

Nao criar um catalogo global de tipos como novo centro do dominio. Os tres registros atuais podem ser tratados como presets de migracao ou copiados pela acao **Duplicar rotina**. O clone deve ser uma nova rotina independente, inativa e com nova identidade.

## Testes obrigatorios

- criar duas rotinas com nomes e regras diferentes para a mesma filial;
- renomear uma rotina sem alterar seu UUID nem seu historico;
- criar uma rotina sem `codigo_legado`;
- aceitar intervalo 20 sem qualquer branch especial para `geralzao`;
- rejeitar agenda, campo temporal ou politica fora do catalogo permitido;
- confirmar que a configuracao salva e versionada e que snapshots futuros a utilizam.

