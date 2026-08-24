# Decidir DANFE simplificada da Transferência

Type: grilling
Status: resolved

## Answer

### Decisão consolidada

A DANFE simplificada fica fora da especificação atual da Transferência. Não existe evidência suficiente no Delphi ou no Laravel para definir esse documento, e formatodanfe = 1/tpImp = 1 não será reinterpretado como DANFE simplificada.

O documento auxiliar fiscal desta fase será somente a DANFE padrão em PDF:

- gerada pelo renderer comum da plataforma fiscal, via adapter baseado em nfephp-org/sped-da, sem UniDANFE;
- produzida após a NF-e autorizada, a partir do nfeProc íntegro;
- arquivada como Artefato Fiscal com versão/hash e vinculada à NF-e;
- gerada em orientação retrato como preferência visual compatível com o Delphi, sem alterar o XML ou o tpImp fiscal;
- mantida como um único PDF, sem transportar NFeNVias para a geração;
- disponibilizada para visualização, download e reimpressão pelo serviço comum de Artefatos Fiscais;
- sem impressão automática, integração de impressora ou dependência de dispositivo nesta fase;
- com falha de geração tratada como pendência do artefato, sem desfazer a autorização da NF-e.

Uma eventual DANFE simplificada deverá ser objeto de uma especificação futura própria, com layout, elegibilidade, renderer, versionamento, distribuição e regra normativa explicitamente aprovados.
Blocked by: 20

## Question

Para a Transferência de Requisição, devemos incluir DANFE simplificada nesta especificação? Se sim, qual contrato operacional e normativo define conteúdo, elegibilidade, formato, renderer, versão/hash do artefato, momento de geração, reimpressão e distribuição? A decisão deve distinguir DANFE simplificada de formatodanfe = 1/tpImp = 1 e reutilizar o pipeline fiscal comum, sem criar renderer paralelo por presunção.

Recomendação inicial: não implementar ou prometer DANFE simplificada enquanto não houver layout e regra de negócio explicitamente aprovados; manter somente o DANFE padrão derivado do nfeProc autorizado.
