Type: grilling
Status: resolved
Blocked by: 01, 03

## Question

Qual deve ser o contrato exato do Documento Semântico do Produto — fontes, normalização de HTML, precedência, tamanho, versão, hash, produtos elegíveis, conteúdo proibido, evidências exibíveis, aprovação e comportamento diante de cadastro pobre ou contraditório?

## Answer

### Unidade e elegibilidade

O Produto é a unidade recuperada e selecionada. É elegível quando está ativo e em linha, mesmo que possua somente descrição curta. Falta de conteúdo rico reduz a evidência e a confiança, mas não impede indexação.

- Produto inativo ou fora de linha fica inelegível e deixa de ser retornado.
- Saldo zero não remove o Produto do índice; disponibilidade é filtro dinâmico.
- Produto sem evidência suficiente pode permanecer indexado, mas a consulta deve se abster quando a relação for fraca.
- Exclusão administrativa individual da Busca Assistida prevalece sobre a elegibilidade automática.

### Composição e precedência

O Documento Semântico é montado em seções identificadas pela origem, nesta ordem:

1. Produto: descrição, código visual, referência, grade e palavras-chave.
2. Conteúdo comercial do Produto: `descricao_complementar_text` e `caracteristicas_text`.
3. Característica de Produto: descrição e observações de venda.
4. Modelos vinculados: descrição, especificação e observação comercial.
5. Marca, Grupo e Classe: descrição e observações de venda.

Em contradição, prevalece a fonte mais específica: Produto, Característica de Produto, Modelo e, por último, Marca/Grupo/Classe. A origem permanece registrada para auditoria e evidência; informação genérica nunca sobrescreve silenciosamente a específica.

### Conteúdo excluído

Não integram o documento:

- HTML bruto;
- `script`, `style`, comentários e markup;
- observações gerais/internas sem finalidade comercial;
- dados fiscais, financeiros, preço, saldo e Filial;
- conteúdo vazio ou repetido literalmente;
- códigos técnicos sem significado comercial;
- conteúdo marcado como não publicável;
- texto inventado, completado, resumido ou reescrito por IA.

Os campos `*_text` existentes são preferidos, mas a aplicação aplica seu próprio normalizador determinístico para não depender exclusivamente da trigger do banco.

### Normalização e identidade

O normalizador:

- remove HTML residual e blocos executáveis;
- decodifica entidades HTML;
- normaliza Unicode, quebras e espaços;
- preserva acentos e texto original utilizável como evidência;
- remove seções vazias e repetições idênticas;
- ordena seções e listas deterministicamente;
- possui `normalizer_version` explícita.

Não existe limite global em caracteres. A medição inicial em `puxare` encontrou 3.131 Produtos ativos e máximo parcial de 3.422 caracteres, mas a base piloto informou 12.859 Produtos, 22.606.000 caracteres, média 1.758, p50 1.006, p90 4.709, p99 8.889 e máximo 16.044. A especificação não pode dimensionar todas as instalações pela primeira base.

O tamanho é avaliado em tokens conforme provider/modelo:

- se couber com margem no limite configurado, gera um embedding para o Produto;
- se exceder, divide deterministicamente por seções de origem, sem cortar frases;
- cada parte mantém `chunk_index`, fontes e hash;
- alteração reprocessa somente partes cujo hash mudou;
- a recuperação agrega partes em um único resultado de Produto;
- toda instalação mede a distribuição antes do backfill.

O documento completo possui `document_hash = SHA-256(documento_normalizado + normalizer_version)`. Cada vetor é identificado por instalação/empresa, Produto, hash da parte, versão do normalizador, provider, modelo e dimensão. Preço, saldo ou Filial não invalidam embeddings.

### Aprovação e bloqueio

O piloto não exige revisão manual prévia de todo o catálogo. O Cadastro atual é a fonte comercial inicial. Deve existir bloqueio administrativo individual por Produto, com efeito no índice e nos resultados. Alteração do conteúdo gera nova versão; feedback negativo sinaliza conteúdo para revisão, mas não o reescreve automaticamente.

Não há geração automática de conteúdo comercial nem fluxo editorial obrigatório no MVP. Uma futura aprovação editorial pode ser acrescentada sem mudar a identidade do Produto ou a origem das evidências.

### Evidência e associação indireta

Cada resultado apresenta no máximo dois trechos literais, escapados e identificados pela origem. O caminho comum não chama modelo de chat para explicar resultados.

A associação semântica indireta é permitida. Um Produto descrito como “palmilha com apoio de calcanhar e amortecimento” pode aparecer para “esporão”, mesmo sem a palavra literal. A UI informa somente a propriedade encontrada, por exemplo “Relacionado por: apoio de calcanhar e amortecimento”. Não pode converter similaridade em “indicado para”, “trata”, “resolve” ou promessa equivalente sem afirmação explícita e aprovada na fonte.

Correspondência literal e fonte específica podem receber maior confiança. Associação indireta ou fonte genérica recebe menor confiança. Propriedades genéricas demais não sustentam resultado e levam à abstenção.

### Cadastro pobre ou contraditório

- Documento curto: participa, com menor capacidade de justificar.
- Nenhuma relação suficiente: resposta sem resultados assistidos e acesso preservado à lupa.
- Fontes contraditórias: mostrar fontes relevantes, reduzir confiança e não emitir conclusão.
- Fonte genérica versus específica: prevalece a específica.
- HTML cujo texto limpo fica vazio: seção descartada, sem erro de indexação.
- Parte acima do limite do modelo: divisão determinística, nunca truncamento arbitrário.

### Consequências verificáveis

Testes devem cobrir elegibilidade, bloqueio individual, precedência, normalização, estabilidade de hashes, mudança de versão, divisão por tokens/seções, reaproveitamento de partes, escaping, rastreabilidade da evidência, associação indireta neutra, contradição, documento pobre e abstenção. Nenhum teste deve depender dos tamanhos observados em uma única instalação.
