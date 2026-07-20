# Migrar a Cotação de Frete do Orçamento

Label: wayfinder:map

## Destination

Produzir um contrato funcional e técnico baseado em evidências para implementar no Laravel a Cotação de Frete do Orçamento, com serviço e modal reutilizáveis pelo Cadastro de Contratos posteriormente, pronto para `$to-spec` sem implementar neste workspace.

## Notes

- Consultar `grilling` e `domain-modeling`; fatos devem vir do código e decisões funcionais do responsável de domínio. Classificar descobertas como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA, sempre com evidência.
- Tratar `delphi/` e `laravel/` como somente leitura. Analisar PAS e DFM conjuntamente, incluindo forms ancestrais, data modules, units compartilhadas, queries, eventos, actions, Parâmetros do Sistema e Permissões.
- Orçamentos é o primeiro consumidor. Contratos fica fora da integração desta entrega, mas deve consumir futuramente o mesmo serviço, modal e contrato por meio de contexto/adaptador.
- A URL externa vem obrigatoriamente do Parâmetro do Sistema legado `URL FRENET`; a credencial vem de `chave frenet`. Ambos são resolvidos no backend, por Filial quando aplicável, e nunca enviados ao navegador.
- Apesar dos nomes legados, a URL aponta para uma API de Cotação de Frete mantida no site de cada cliente. Ela pode orquestrar Frenet, transportadoras diretas e regras próprias.
- A API retorna o mesmo formato Frenet esperado pelo Delphi. O Laravel não conhece a estratégia interna nem mescla `fretes_isencao` para compor resultados.
- Cada opção contém códigos/nome da transportadora, códigos/descrição do serviço, valor, prazo, mensagem, originais, tempo de resposta e erro.
- Uma opção válida só pode ser aplicada se `CodigoServico + Transportador` resolver exatamente uma `tabela_frete` local.
- A cotação usa a Filial de origem como no Delphi e um único CEP de origem. O CEP de destino prioriza o endereço de entrega e recua para o CEP principal.
- Bloquear antes da API somente quando faltar URL/chave, CEP de origem, CEP de destino ou Produtos. Peso/dimensões zerados são enviados e validados pela API.
- O payload inclui valor declarado e, por Produto, SKU, quantidade, peso, altura, largura, comprimento e diâmetro.
- A assinatura de validade inclui todos os dados enviados, Filial/CEPs e contexto necessário. Mudanças invalidam a cotação.
- Se o Orçamento mudar durante a requisição/modal, a seleção é recusada e exige nova cotação.
- A modal preserva a ordem da API, não seleciona automaticamente e permite ordenar. Separa opções disponíveis de serviços indisponíveis/erros.
- Consulta exige acesso de visualização; aplicar exige Permissão de Alteração e Situação editável.
- Falhas não têm retry invisível; oferecem `Tentar novamente` e preservam a cotação anterior sem renová-la.
- A seleção atualiza o rascunho, recalcula totais/planos e persiste com a gravação do Orçamento.
- `frete_transportadora` recebe o nome do Fornecedor local resolvido; dados retornados permanecem na evidência da cotação.
- Persistir fotografia mínima da cotação: assinatura, data/hora, Usuário, códigos/nomes, valores/prazos originais e aplicados, mensagem e configuração local.
- Ao gravar uma cotação desatualizada, oferecer Prosseguir, Refazer cotação ou Cancelar.
- Nenhuma implementação ou chamada externa será feita neste workspace.

## Decisions so far

<!-- Uma linha por ticket resolvido, com link e síntese. -->

## Not yet specified

- Contrato JSON exato produzido/consumido pela biblioteca Frenet e variações reais de erro da API do cliente.
- Resolução por Filial dos parâmetros, CEP de origem e credenciais.
- Representação persistente da fotografia/assinatura sem conflitar com os campos legados do documento.
- Matriz completa de campos do Orçamento, cálculos e planos afetados pela seleção.
- Regras locais de `tabela_frete`, restrições e Fornecedor que permanecem relevantes após retirar `fretes_isencao` da lista.
- Contrato do adaptador que permitirá integrar Contratos posteriormente.
- Estratégia de testes sem depender da API externa real.

## Out of scope

- Integrar a Cotação de Frete à tela Laravel de Contratos nesta entrega.
- Implementar regras de cálculo de frete no Laravel ou consultar `fretes_isencao` para formar opções.
- Alterar a API hospedada no site dos clientes ou seus provedores internos.
- Fazer reserva, contratação, coleta, etiqueta ou rastreamento do frete.
- Alterar arquivos em `delphi/` ou `laravel/`, ou executar migrations, Composer, npm, builds, formatadores ou geradores nesses diretórios.
- Implementar qualquer código funcional neste workspace.

