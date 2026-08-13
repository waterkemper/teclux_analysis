# Prompt para /speckit.specify — revisão de fechamento e prontidão fiscal após os prompts 20–22

```text
/speckit.specify

Faça uma revisão de fechamento do estado atual do Laravel após a implementação dos prompts 20, 21 e 22. Não implemente nesta execução. Produza somente uma especificação corretiva pronta para implementação, com decisão técnica, contratos, critérios de aceite, testes automatizados e roteiro de homologação.

## Evidências já localizadas

O checkout atual já contém:

- projeção da tela de certificados a partir das Filiais canônicas;
- sincronização idempotente para `cloud_fiscal_contribuintes` e `cloud_fiscal_estabelecimentos`;
- entrada de menu versionada para `fiscal.certificados.index`;
- capacidades `NFSE_ASSINATURA`, `NFSE_TRANSMISSAO` e `NFSE_ADN_CONSULTA`;
- modelo interno 98 para NFS-e;
- escopo de vínculo por autorizador e município IBGE;
- política versionada de NFS-e;
- bloqueio de ativação e seleção por CNPJ completo para emissão NFS-e;
- testes unitários e de feature para matriz/filial, ADN, ambiente e coexistência NF-e/NFS-e;
- tela `Fiscal/Certificados/Index` e `Show` com seleção de Filiais e vínculos em lote.

## Diagnóstico obrigatório antes de especificar

Inspecione o código real, testes e migrations, especialmente:

- `FiscalCertificadoController`;
- `SelectCertificateService` e `NfseCredentialGate`;
- `ManageCertificateLinkService` e `ActivateCertificateLinkService`;
- `FiscalCertificadoAdminProjector`;
- `SyncFiliaisFiscaisService`;
- `FiscalCertificatePublicMapper`;
- `Fiscal/Certificados/Index.tsx` e `Show.tsx`;
- `NfePhpFiscalGateway` e as portas de emissão fiscal;
- migrations 371001, 371002, 372001 e 372002;
- testes existentes em `tests/Feature/Fiscal/Certificate` e `tests/Unit/Fiscal/Certificate`;
- ADR-333, ADR-366, ADR-0002 e os prompts 20, 21 e 22.

Classifique cada achado como CONFIRMADO, PARCIAL, DIVERGENTE ou NÃO LOCALIZADO. Não suponha que a existência de um teste de seleção administrativa prove emissão real em homologação.

## Lacunas que a especificação deve resolver

### 1. Gate NFS-e no caminho real de emissão

Verifique e corrija a fronteira entre prontidão de certificado e emissão efetiva:

- `NfseCredentialGate` não pode existir apenas na rota de `selection-preview`;
- toda operação real de assinatura/transmissão/consulta NFS-e deve resolver a credencial pelo gate antes de gerar ou transmitir o documento;
- a emissão deve falhar antes de qualquer chamada HTTP quando não houver certificado CNPJ-exato, política vigente, município habilitado ou par de assinatura/transmissão compatível;
- o fluxo NF-e/NFC-e deve continuar usando a seleção existente, sem receber regras NFS-e por engano;
- se a emissão NFS-e ainda não fizer parte desta etapa, declarar explicitamente o limite e criar a porta, o adaptador fake e o bloqueio de produção necessários para que o sistema não apresente a prévia como homologação concluída.

Entregar um diagrama de chamadas demonstrando onde o gate é invocado e testes que provem que uma falha de credencial impede qualquer chamada ao autorizador.

### 2. Segurança dos dados exibidos

Corrigir a política de exposição de identidade do certificado:

- não enviar CNPJ completo do titular em props Inertia, DOM, JSON de prévia, logs ou auditoria quando a operação exigir apenas comparação;
- usar somente representação sanitizada para o titular e para o CNPJ esperado da Filial;
- manter o CNPJ completo exclusivamente no servidor, no material/metadado protegido e nas comparações internas autorizadas;
- não exibir senha, PFX/P12, PEM, chave privada, ciphertext ou segredo de reautenticação;
- testar inspeção de HTML, props, respostas JSON, logs e auditoria.

Caso o operador precise confirmar a identidade, exibir apenas máscara e indicador explícito `CNPJ exato`, `mesma raiz sem compatibilidade` ou `divergente`.

### 3. Validação robusta dos contratos HTTP

Revisar todas as entradas que são convertidas diretamente por `Enum::from()` ou `DateTimeImmutable`:

- capacidade;
- ambiente;
- modelo;
- autorizador;
- município IBGE;
- datas de vigência.

Valores inválidos devem retornar erro de validação sanitizado, com HTTP 422, nunca `ValueError`, stack trace ou HTTP 500. Aplicar isso às rotas de criação individual, criação em lote, ativação, prévia e publicação de política.

Definir listas permitidas por família:

- NF-e/NFC-e: modelos 55/65 e capacidades NF-e;
- NFS-e: modelo 98 e capacidades NFS-e;
- ADN: somente `NFSE_ADN_CONSULTA`, autorizador ADN e escopo aceito pela política.

### 4. Reconciliação da projeção Cloud

Especificar o tratamento dos dados antigos e divergentes:

- a sincronização não deve apenas contar divergências e deixar um estabelecimento no grupo errado sem ação operacional;
- definir como resolver contribuintes duplicados da mesma raiz;
- definir como mover ou marcar estabelecimentos Cloud associados ao contribuinte incorreto;
- preservar IDs de versões, vínculos e auditoria;
- impedir seleção/emissão enquanto a divergência não for resolvida;
- produzir relatório idempotente com criados, atualizados, órfãos, duplicados, divergentes e bloqueados;
- nunca apagar automaticamente material de certificado ou histórico fiscal.

O prompt deve decidir se a resolução será automática quando não houver dependências, manual quando houver versões/vínculos, ou uma combinação auditada dos dois caminhos.

### 5. Escalabilidade e padrão visual da tela

Revisar a conformidade com o catálogo ERP:

- a paginação deve ser realmente sustentável para grande quantidade de Filiais, evitando carregar e projetar todo o universo em memória a cada página;
- aplicar estados loading, erro, vazio, permissão e sucesso de forma consistente;
- usar os componentes compartilhados de toolbar, tabela, formulário, seção e autorização;
- evitar botões e formulários Tailwind isolados quando existir componente ERP equivalente;
- respeitar teclado, foco e feedback de validação;
- esconder ou desabilitar ações de mutação conforme as capacidades reais recebidas, sem depender somente do bloqueio posterior do backend;
- mostrar separadamente NF-e/NFC-e, NFS-e emissão e ADN.

### 6. Política NFS-e e Florianópolis

Especificar o ciclo operacional da política:

- a política inicial com convênio/habilitação `DESCONHECIDO` deve manter emissão bloqueada;
- a publicação deve exigir documentação, versão, hash, vigência, autorizador e reautenticação;
- deve existir uma forma administrativa auditável de consultar o estado vigente e publicar atualização, ainda que a tela seja separada da tela de certificados;
- não permitir que o operador altere a política por campos livres sem evidência documental;
- tratar Florianópolis/Emissor Nacional como parametrização versionada, não como regra permanente codificada;
- registrar claramente quando o ambiente está pronto apenas para diagnóstico, para prévia, para fake, para homologação real ou para produção.

### 7. Homologação real

Entregar um runbook executável no ambiente Linux/Docker contendo:

- PHP/extensões/libs e dependências NFePHP/NFS-e;
- migration/menu/política aplicada;
- Filial de teste com CNPJ completo;
- upload/validação do certificado sem expor senha;
- vínculo separado de assinatura/transmissão quando exigido;
- diagnóstico de pré-condições;
- teste positivo da Filial com certificado exato;
- teste negativo da Filial usando certificado da matriz com mesma raiz;
- evidência sanitizada de endpoint, ambiente, município, autorizador, certificado e resposta;
- critérios para declarar o teste aprovado ou bloqueado.

Não declarar “homologação concluída” apenas porque os testes unitários do gate passaram.

## Testes obrigatórios

Produza testes para:

1. gate NFS-e chamado pelo caminho real de emissão;
2. nenhuma chamada ao autorizador quando o CNPJ titular divergir;
3. matriz com mesma raiz rejeitada para emissão da Filial;
4. certificado de serviço individual aceito para a Filial correta;
5. ADN por mesma raiz aceito somente para consulta/distribuição quando a política permitir;
6. NF-e compartilhada continuar funcionando por vínculo explícito;
7. capacidades/modelos/autorizadores inválidos retornarem 422;
8. política desconhecida, município não conveniado e CNC não habilitado bloquearem emissão;
9. ambiente de homologação e produção isolados;
10. ausência de CNPJ completo, senha e material sensível em todas as superfícies públicas;
11. sincronização com duas Filiais da mesma raiz, duplicatas, órfãos e divergências;
12. paginação, filtros, permissão e estados da tela;
13. migrations aplicadas em banco limpo e banco com dados antigos;
14. diagnóstico e runbook real em Linux/Docker.

## Critérios de aceite

1. O sistema não confunde seleção administrativa com emissão NFS-e real.
2. Toda emissão NFS-e passa por uma decisão server-side de credencial, política e identidade.
3. Certificado da matriz com mesma raiz nunca é fallback para emissão de Filial.
4. Nenhum input inválido provoca erro 500.
5. Nenhum CNPJ completo do certificado é exposto desnecessariamente ao navegador ou aos logs.
6. Dados Cloud divergentes têm estado, relatório e caminho de resolução auditável.
7. A tela segue o padrão ERP em escala e diferencia as famílias fiscais.
8. O roteiro de homologação identifica objetivamente pré-condições ausentes e não promete emissão real sem gateway/adaptador configurado.

## Fora de escopo

- implementar código nesta execução;
- alterar a criptografia ou armazenar certificado em S3;
- reintroduzir venda entre Filiais, devolução entre Filiais ou regras de transferência;
- aceitar certificado por igualdade de raiz para emissão NFS-e;
- substituir evidência oficial por suposição de compatibilidade municipal.

Entregue a especificação final, a decisão/ADR necessária, contratos de integração, matriz de capacidades, plano de reconciliação, testes e runbook de homologação. Não implemente.
```
