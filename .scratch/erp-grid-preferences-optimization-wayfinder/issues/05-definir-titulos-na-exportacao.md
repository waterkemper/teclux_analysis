# Definir o contrato de títulos personalizados na exportação Excel

Type: grilling
Status: resolved
Blocked by: 02

## Question

Como as exportações local, síncrona e assíncrona/token devem obter e validar os títulos personalizados do usuário autenticado para usá-los apenas como cabeçalhos XLSX, sem aceitar identidade de coluna arbitrária, alterar autorização/ordem/dataset ou permitir fórmulas e conteúdo inseguro?

## Answer

Os títulos personalizados alteram exclusivamente o texto dos cabeçalhos XLSX. A exportação mantém as colunas exportáveis e autorizadas, a ordem definida pelo catálogo e pelo fluxo de exportação, o dataset, os filtros, a formatação e todas as demais regras atuais. Visibilidade e ordem escolhidas no layout visual não passam a controlar a planilha. Títulos duplicados são permitidos.

A fonte de verdade é sempre a preferência persistida do usuário autenticado, resolvida pelo backend para a combinação efetiva de tela, grid e variante. O navegador não envia títulos nem identidades de coluna para compor o cabeçalho; portanto, um rascunho ainda aberto em Campos da Grade não participa da exportação. O backend cruza os overrides persistidos e já normalizados com o catálogo correto e com as colunas autorizadas antes de produzir qualquer cabeçalho.

O seam deve ser um módulo profundo compartilhado de apresentação da exportação, com uma interface pequena: receber o catálogo efetivo, as colunas exportáveis já autorizadas e, quando aplicável, a fotografia interna dos overrides; devolver os cabeçalhos finais alinhados às colunas. Esse módulo concentra fallback, associação por columnId e descarte de IDs desconhecidos ou não autorizados. Os serviços de dataset não devem repetir o merge catálogo mais preferência.

Para permitir essa centralização, o contrato interno dos datasets deve expor columnIds estáveis e alinhados às linhas, além do nome do arquivo. A composição final de headers ocorre depois da seleção e autorização das colunas. Durante uma migração interna, headers antigos podem existir apenas como compatibilidade transitória, mas a especificação deve convergir para uma única composição centralizada.

Na exportação local e na síncrona, a fotografia dos títulos é obtida no backend no início da requisição. Na exportação assíncrona ou por token, o início da exportação captura no backend os overrides efetivos, já autenticados, autorizados e sanitizados, e grava essa fotografia como dado interno do job. O worker usa a fotografia capturada, de modo que alterações posteriores não mudem uma exportação já iniciada. O token ou payload do cliente nunca pode substituir essa fotografia.

Se a preferência não existir, estiver corrompida ou não puder ser carregada, a exportação continua com os títulos padrão do catálogo e registra aviso observável, sem expor dados sensíveis. Uma falha de preferência não pode interromper a geração da planilha.

A neutralização de fórmulas pertence ao adapter de escrita XLSX. Cabeçalhos devem ser emitidos como células de texto literal. O writer atual já usa células string tanto no XLSX nativo quanto no fallback XML; isso deve ser preservado e coberto por testes com títulos iniciados por =, +, -, @ e caracteres de controle. Se um writer futuro não puder garantir tipo textual, ele deve prefixar apóstrofo somente no arquivo, sem alterar o título salvo nem o exibido no grid.

O aceite deve cobrir exportação local, síncrona e assíncrona; variante de catálogo; título padrão e personalizado; título duplicado; coluna desconhecida ou não autorizada; preferência ausente, corrompida ou indisponível; fotografia imutável durante job; tentativa de títulos arbitrários pelo cliente; e conteúdo com aparência de fórmula comprovadamente literal na planilha.
