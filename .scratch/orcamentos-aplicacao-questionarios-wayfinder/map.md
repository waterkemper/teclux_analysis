# Aplicação de Questionários no Orçamento

Label: wayfinder:map

## Destination

Produzir uma análise Delphi–Laravel baseada em evidências e pronta para `$to-spec` para implementar no Cadastro de Orçamentos a Aplicação de Questionário obrigatória após a gravação, usando um aplicador reutilizável por Contratos e frente de caixa no futuro, sem implementar neste workspace.

## Notes

- Consultar `grilling` e `domain-modeling`. Distinguir Cadastro de Questionários, Questionário como modelo e Aplicação de Questionário como ocorrência respondida.
- `delphi/` e `laravel/` são somente leitura. Analisar PAS e DFM conjuntamente, incluindo formulário, data module, queries, parâmetros, permissões, eventos, validações e tabelas de respostas.
- Classificar cada descoberta como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA, sempre com evidência concreta.
- O Orçamento é o primeiro consumidor. Contratos e frente de caixa ficam fora da integração inicial, mas devem consumir futuramente o mesmo aplicador por contexto/adaptador.
- O Orçamento é gravado primeiro. Depois, se houver Questionário elegível, o aplicador obrigatório é aberto; falha ou interrupção do Questionário não desfaz a gravação do Orçamento.
- Não existe “Responder depois”. A modal e a navegação normal ficam bloqueadas enquanto faltarem respostas. Interrupção forçada mantém aplicação pendente e provoca reabertura no próximo acesso ao Orçamento.
- Sem Cliente identificado ou com “Não responder questionários”, não abrir aplicação e não registrar motivo de não aplicação.
- `respondermaisdeumavez = false`: uma resposta daquele Questionário por Cliente, independentemente do documento. Quando verdadeiro: permite nova aplicação em outro documento, mas não repete no mesmo Orçamento/Contrato, reconhecendo a derivação entre ambos.
- Toda Aplicação de Questionário preserva fotografia do modelo: descrição, sequência, perguntas e opções, além das respostas.
- O aplicador possui modo pendente para responder e modo histórico para visualizar. Edição exige Permissão específica, documento em Situação editável e Auditoria.
- Todas as perguntas são obrigatórias. Texto exige conteúdo; escolha única exige exatamente uma opção; múltipla exige ao menos uma; `justificativa` marcada exige texto.
- O Questionário automático Delphi é selecionado pelo Parâmetro do Sistema `QUESTIONARIO ATUAL`, por Filial, e precisa estar disponível, vigente e não inativo; confirmar toda a precedência no ticket próprio.
- Nenhuma implementação será feita neste workspace.

## Decisions so far

<!-- Uma linha por ticket resolvido, com link e síntese. -->

## Not yet specified

- Estrutura exata das respostas atuais e necessidade de novas tabelas/colunas para fotografia, aplicação e revisão.
- Semântica de múltiplos Questionários simultaneamente elegíveis e troca de `QUESTIONARIO ATUAL` entre gravação e resposta.
- Relação entre o botão manual de Enquete, histórico por Cliente e histórico por documento.
- Política de versão quando o Cadastro de Questionários muda durante uma aplicação pendente.
- Recuperação após expiração, inativação ou exclusão lógica do modelo enquanto a aplicação está pendente.
- Contrato exato de contexto para Contratos e frente de caixa, especialmente venda sem Cliente.
- Limites de tamanho, acessibilidade e experiência para questionários longos.

## Out of scope

- Implementar o aplicador ou alterar Delphi/Laravel neste workspace.
- Integrar agora a Contratos ou frente de caixa.
- Redesenhar o Cadastro de Questionários já implementado, salvo correção mínima exigida pelo contrato do aplicador.
- Migrar checklists de Equipamentos/Ordem de Serviço nesta entrega.
- Registrar motivo quando o Questionário não é aplicável.
- Executar migrations, Composer, npm, builds, formatadores ou geradores nas junctions.

