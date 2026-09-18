# Decidir o modelo do desafio e do login pendente

Type: grilling
Status: resolved
Blocked by: 01, 02

## Question

Qual máquina de estados, identidade, persistência, atomicidade e política de concorrência devem governar o login pendente e o Código de Acesso por E-mail, preservando os limites já confirmados e impedindo replay, múltiplas sessões prematuras, corrida entre reenvio/validação e bypass pela troca de senha?

## Answer

### Classificação e limite de garantia

O Código de Acesso por E-mail implementa **Verificação Adicional de Login**, não MFA/2FA forte nem autenticação resistente a phishing. O mecanismo aumenta a barreira contra posse isolada da senha do ERP, mas não cobre caixa postal comprometida ou phishing em tempo real. A política deve permanecer separada do mecanismo para permitir evolução posterior a TOTP, passkeys ou IdP.

### Agregado e fonte autoritativa

**Login Pendente** é um agregado durável próprio no banco. Nasce somente após validar usuário/senha, estado da credencial e do Usuário, senha expirada quando aplicável e acesso à Filial, mas antes de autenticar o guard.

- O banco é fonte autoritativa de identidade, estado, validade, erros, gerações e consumo.
- Redis serve apenas a rate limits/cache auxiliar; indisponibilidade ou perda de Redis nunca promove o Login Pendente.
- O browser recebe apenas identificador opaco, aleatório e impraticável de enumerar, transportado em cookie de sessão `Secure`, `HttpOnly` e `SameSite`, com POSTs protegidos por CSRF.
- Senha, código, verificador, identidade do Usuário ou Filial não trafegam em URL, localStorage ou cookie persistente.
- Tokens de ativação/reset e provas de operações sensíveis não serão reutilizados.

### Identidade e concorrência

Cada navegador/tentativa possui Login Pendente independente e código próprio. Iniciar outro login no mesmo navegador cancela o anterior. São permitidos no máximo três Logins Pendentes ativos por Usuário; atingido o limite, nova criação é rejeitada até expiração ou cancelamento, sem invalidar silenciosamente outro dispositivo.

Limites agregados por Usuário, IP confiavelmente resolvido e instalação continuam existindo além do limite por agregado. Concluir um Login Pendente não autentica nem consome os demais. Mudança de senha, e-mail de autenticação, estado do Usuário/credencial ou recuperação revoga todos os pendentes afetados.

### Gerações do Código de Acesso

O Login Pendente mantém identidade e prazo total estáveis. Cada envio cria uma geração monotônica:

- reenvio somente depois de 60 segundos;
- nova geração substitui atomicamente a anterior;
- código da geração anterior nunca volta a ser aceito;
- contador máximo de cinco erros pertence ao Login Pendente e não zera;
- validade total de dez minutos começa na criação e não é prorrogada;
- limites agregados de envios impedem flood mesmo com novas tentativas.

Persistir somente verificador derivado do código. Como seis dígitos têm espaço pequeno, hash simples é insuficiente: usar HMAC/MAC com chave dedicada e versionada fora do banco, ligada ao ID do Login Pendente e à geração, ou construção revisada equivalente. Comparação em tempo constante. Código e chave nunca aparecem em logs, filas, telemetria ou auditoria.

### Máquina de estados

Estados não terminais:

- `aguardando_envio`: agregado criado, ainda sem geração utilizável;
- `aguardando_codigo`: geração vigente enviada/aceita pelo contrato de entrega e disponível para validação.

Estados terminais:

- `consumido`: código correto venceu a disputa atômica e autorizou exatamente uma conclusão;
- `expirado`: prazo total terminou;
- `bloqueado`: cinco erros ou limite de abuso aplicável foi atingido;
- `cancelado`: usuário reiniciou/cancelou, outro login começou no mesmo navegador ou mudança de segurança revogou a tentativa;
- `falha_entrega`: o canal não tornou uma geração utilizável conforme o contrato que será fechado em “Decidir entrega, experiência e recuperação do código”.

As gerações têm metadados imutáveis de criação/substituição/resultado. Limpeza física posterior não apaga a evidência de auditoria exigida.

### Revalidação e vínculo contextual

O agregado guarda Usuário, Filial, instante, revisão de segurança da credencial, política aplicada, classificação de rede e IP observado. Deve existir uma revisão de segurança explícita que avance em alterações relevantes; usar `usuarios_auth.updated_at` é inadequado porque atualizações operacionais como último login podem gerar conflitos falsos.

Antes de consumir o código, o servidor relê e confirma:

- Usuário e credencial ainda ativos;
- Filial ainda válida e autorizada;
- revisão de segurança inalterada;
- endereço/geração ainda correspondentes;
- política ainda permite aquele caminho;
- Login Pendente e geração vigentes, não expirados, não bloqueados e não consumidos.

Mudança de IP durante o Login Pendente é auditada, mas isoladamente não invalida nem dispensa o código. Um Login Pendente externo não se torna confiável por trocar de rede; para usar o caminho de Rede Confiável, o Usuário cancela/reinicia o login.

### Consumo e criação da sessão

A validação bloqueia o agregado no banco ou usa compare-and-swap equivalente. Código correto, incremento de erro, substituição de geração, expiração e transição terminal são mutuamente exclusivos. Apenas uma requisição pode transicionar para `consumido`.

Somente a vencedora:

1. consome o Login Pendente no banco;
2. autentica o guard;
3. regenera o ID de sessão;
4. grava a Filial ativa;
5. atualiza `last_login_at`;
6. registra sucesso;
7. remove o cookie/estado pendente.

Não há transação distribuída entre banco e sessão Redis. A prioridade é fail-closed: se houver falha após o consumo e antes de entregar a sessão, o Login Pendente permanece consumido e o Usuário inicia novo login; nunca se reabre o mesmo código. Rotas do ERP não reconhecem Login Pendente como autenticação parcial.

### Senha expirada e falhas

A troca de senha expirada confirma a nova senha primeiro, avança a revisão de segurança e retorna ao mesmo orquestrador adaptativo. Em rede externa, cria um novo Login Pendente sobre a revisão nova; não chama `auth()->login()` diretamente.

Banco ou chave HMAC indisponíveis, estado desconhecido, revisão divergente e transição concorrente falham fechados. Jobs atrasados não podem reativar geração substituída, expirada ou terminal.

Esta decisão define o contrato; nomes finais de classes, tabelas e migrations serão especificados no handoff, sem implementação neste mapa.
