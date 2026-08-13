# Definir a custódia e a operação dos Certificados A1

Type: grilling
Status: resolved
Blocked by: 02

## Question

Como criptografar, acessar, versionar, validar, ativar, substituir e auditar Certificados A1 e senhas por Contribuinte Fiscal, com vínculos compartilhados ou exclusivos por Filial, incluindo workers, rotação de chaves, alertas e recuperação sem exposição?

## Answer

> **Amendment:** a decisão desta ticket foi refinada por [Definir a associação de Certificados A1 a grupos de CNPJ e Filiais](15-definir-associacao-certificado-grupo-cnpj.md). A custódia passa a ser do Contribuinte Fiscal; a associação à Filial é explícita, pode ser compartilhada ou exclusiva, e o titular do certificado não precisa ser exatamente o CNPJ da Filial emitente quando a relação oficial e o contexto da UF permitirem. Os detalhes vigentes estão na ticket de associação.

### Custódia local

Cada Certificado A1 é uma **Versão de Certificado Fiscal** custodiada para um Contribuinte Fiscal. PFX e senha ficam em tabela própria no PostgreSQL, nunca em filiais, cifrados pelo Laravel com AEAD AES-256-GCM. Vínculos temporais e auditáveis associam a versão a uma ou mais Filiais, sem copiar o PFX. O registro guarda separadamente ciphertext, nonce/tag, versão da chave mestra e metadados seguros. A nova solução não grava PFX, caminho ou senha nos campos legados em texto.

A chave mestra de certificados é exclusiva, diferente da APP_KEY, e permanece nos secrets/variáveis protegidas da infraestrutura, fora do banco e do repositório. Um chaveiro versionado define a chave corrente e conserva temporariamente as anteriores. Cada registro informa sua versão; uma rotina administrativa recifra os registros e uma chave antiga somente é retirada depois de comprovado que nenhum registro depende dela.

### Validação e ciclo de vida

Os estados são RECEBIDO, VALIDADO, ATIVO, SUBSTITUIDO, REVOGADO e INVALIDO. Há uma versão preferencial ATIVA por vínculo e contexto; uma mesma versão pode estar ATIVA em vários vínculos. A ativação manual é transacional: ativa a nova versão ou vínculo validado e substitui a preferência anterior no mesmo commit, preservando a referência histórica.

Antes da ativação, o Laravel exige:

- abertura íntegra do PFX com a senha;
- cadeia ICP-Brasil válida;
- período de validade vigente;
- usos criptográficos compatíveis com assinatura e autenticação;
- CNPJ do titular correspondente a um estabelecimento do mesmo Contribuinte Fiscal da Filial associada;
- vínculo explícito e elegibilidade/credenciamento para a UF, ambiente, modelo e capacidade da operação;
- assinatura e verificação local de conteúdo de teste.

Falha criptográfica, senha incorreta, CNPJ sem vínculo com o Contribuinte Fiscal, vínculo incompatível ou recusa inequívoca do certificado bloqueia a ativação. O sistema também tenta comunicação autenticada com o serviço de status da SEFAZ da Filial/ambiente. Timeout ou indisponibilidade da SEFAZ gera aviso e permite ativação administrativa consciente e auditada; não invalida as verificações locais.

### Administração e Auditoria

Qualquer Usuário com o perfil existente Administrador pode enviar, validar, ativar, substituir e revogar versões; não haverá permissão fiscal adicional inicialmente. Envio e ativação exigem reautenticação por senha.

A Auditoria registra Contribuinte Fiscal, Filial afetada, vínculo, Administrador, IP, instante, ação, versão anterior/nova e resultado. Nunca registra ou devolve PFX, senha, chave mestra ou conteúdo descriptografado. Usuários comuns veem apenas titular, CNPJ, número de série, fingerprint, validade, estado, vínculos e alertas; a senha nunca retorna pela API. Correção exige novo envio do PFX e da senha.

### Uso pelos workers

Cada Tentativa Fiscal fixa a versão e o Vínculo de Certificado Fiscal selecionados no início e registra seu identificador e motivo. O worker busca e descriptografa PFX e senha somente em memória, usa-os até o fim do job e elimina as referências em seguida, sem cache de plaintext entre jobs. Uma troca afeta apenas novas tentativas; se a versão for compartilhada, todas as Filiais vinculadas recebem alerta e bloqueio quando aplicável. XML já assinado não é reassinado por troca de certificado; nova revisão corrigida usa o vínculo elegível naquele momento.

Se uma dependência exigir arquivo, o worker usa arquivo temporário privado, com acesso restrito e exclusão garantida inclusive após erro. Uma versão marcada como revogada antes da comunicação não pode prosseguir; a operação entra em reconciliação ou nova tentativa segura.

### Validade, alertas e bloqueios

Administradores recebem alertas no painel e por e-mail aos 60, 30, 15, 7 e 1 dias do vencimento, diariamente nos últimos sete dias. Certificado ausente, ainda não válido, vencido, revogado ou inválido bloqueia novas assinaturas e transmissões de cada Filial cujo vínculo dependa dele, com mensagem clara. Consultas sem certificado e leitura de documentos permanecem disponíveis.

### Backup, recuperação e descarte

O backup criptografado do PostgreSQL é acompanhado por cópia separada e protegida do chaveiro, acessível somente à infraestrutura. A restauração é testada trimestralmente em ambiente isolado por descriptografia e assinatura local, sem transmissão de produção em homologação.

Versões históricas preservam certificado público, número de série, fingerprint, validade, estado e referências de auditoria. PFX e senha cifrados são eliminados definitivamente 90 dias após substituição ou vencimento, desde que não haja tentativa em curso ou pendência que ainda dependa da versão. Comprometimento permite expurgo antecipado depois de bloquear jobs e reconciliar operações em curso.

### Convivência e entrada em operação

Não haverá importação automática de certificados do UniNFe, de caminhos locais ou dos campos legados. Cada Contribuinte Fiscal passa por onboarding manual: um Administrador envia PFX e senha, valida a versão e cria os vínculos elegíveis para cada Filial. Uma Filial sem vínculo ativo não emite pelo Laravel e o Delphi continua operando.

Enquanto o Delphi/UniNFe ainda puder transmitir, a renovação também deve ser feita manualmente no legado. Ao ativar uma nova versão, o Laravel cria aviso e pendência operacional até o Administrador confirmar a atualização do ambiente Delphi; essa confirmação é informativa e auditada, sem copiar o segredo para o legado.
