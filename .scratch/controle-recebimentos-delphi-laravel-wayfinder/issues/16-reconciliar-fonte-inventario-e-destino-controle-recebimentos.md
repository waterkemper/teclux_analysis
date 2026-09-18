# Reconciliar fonte de Inventário e destino Controle de Recebimentos

Type: grilling
Status: resolved
Blocked by:

## Question

Esta solicitação deve continuar o mapa existente de `Caixa → Controle de Recebimentos`, reutilizando os dossiês e prompts já gerados em `modules/caixa/controle-recebimentos/`, ou deve abrir um novo mapa para o Cadastro de Inventário, usando `apps/estoque/dmcadastroinventario.pas/.dfm` e `fmcadastroinventario.pas/.dfm` como fonte?

O texto informado mistura os dois contextos: os arquivos de Inventário existem e contêm filtros, SQLs, grids, operações, relatório e autorização próprios; o menu explicitamente indicado é `Caixa → Controle de Recebimentos`, para o qual já existem artefatos concluídos e tickets abertos. Confirmar a unidade funcional e o diretório canônico de saída antes de extrair evidências ou gerar novos prompts, para não misturar contratos de Inventário com os de Recebimentos.

A decisão deve também fixar se `c:\prjetos.vcl` é apenas o typo de `c:\projetos.vcl` e se os nomes duplicados `.pas.pas` devem ser normalizados para os arquivos existentes sem alterar as fontes Delphi.

## Answer

O alvo confirmado pelo usuário é o **Cadastro de Inventário**, não o mapa de `Caixa → Controle de Recebimentos`. A fonte canônica é `delphi/apps/estoque/dmcadastroinventario.pas/.dfm` e `fmcadastroinventario.pas/.dfm`; os nomes informados como `c:\prjetos.vcl` e `.pas.pas` são tratados como typo/duplicação de caminho, sem alterar os fontes Delphi. O trabalho deve seguir em um mapa próprio e produzir os prompts em `modules/estoque/cadastro-inventario/`.
