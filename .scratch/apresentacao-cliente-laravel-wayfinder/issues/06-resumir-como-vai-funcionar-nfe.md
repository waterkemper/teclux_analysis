# Resumir "como vai funcionar" NFe/NFC-e

Type: task
Status: resolved
Blocked by:

## Question

A partir da especificação já fechada e consolidada em `.scratch/emissao-fiscal-eletronica-laravel-wayfinder/map.md` (emissão fiscal eletrônica NF-e/NFC-e diretamente pelo Laravel, sem UniNFe/UniDANFE, ainda não implementada), como descrever em linguagem operacional — sem termos internos (SEFAZ, contingência, MOC, certificado A1, outbox, etc. tratados como jargão) e sem prazos — o que muda para quem emite nota hoje: emissão, contingência quando a internet cai, DANFE, e o que continua igual do ponto de vista do operador?

## Answer

**Hoje (Delphi).** O ERP monta o XML da nota e o deposita numa pasta; um programa externo separado (UniNFe) fica de olho nessa pasta, assina e transmite para a SEFAZ, e devolve o resultado por outros arquivos na pasta de retorno. É uma ponte por arquivos entre dois programas — quando o UniNFe trava ou não está rodando, a emissão trava junto.

**Como vai funcionar no Laravel.** O próprio sistema assina e transmite a nota diretamente para a SEFAZ — sem depender de nenhum programa externo instalado à parte. Isso remove um elo frágil da corrente: menos uma coisa que pode "estar off" no computador do caixa.

1. **Emissão direta, sem programa externo.** O sistema assina e envia a nota fiscal sozinho. Menos dependência de instalação/configuração extra na loja.
2. **Nota Fiscal (NF-e) de venda/contrato.** O vendedor confirma a venda normalmente; a emissão fiscal acontece nos bastidores — o operador não fica com a tela travada esperando a SEFAZ responder. Se a SEFAZ rejeitar algo corrigível, o sistema avisa e permite corrigir; se a resposta ficar ambígua, o sistema reconcilia sozinho antes de tentar de novo, sem risco de duplicar nota.
3. **Cupom (NFC-e) no caixa é o cenário mais sensível — e o mais protegido.** A prioridade é não travar a fila. A nota do cupom é tratada com prioridade máxima; se a autorização não chegar rápido o bastante e a legislação do estado permitir, o sistema entra sozinho em modo de contingência, de forma registrada e auditável: emite mesmo assim, entrega o comprovante ao cliente, e transmite para a SEFAZ depois, automaticamente, assim que possível. **A venda nunca fica travada esperando internet ou SEFAZ.**
4. **O comprovante (DANFE/cupom) continua sendo entregue normalmente** — impresso ou em PDF — inclusive nos casos de contingência.
5. **O que muda por trás, mas o operador nem percebe:** cada nota fica com um histórico completo e rastreável (quem emitiu, quando, se houve problema, como foi resolvido) guardado com segurança por 6 anos — hoje esse rastro fica espalhado em arquivos de pasta compartilhada, mais frágil.
6. **O que continua igual:** o fluxo de vender e emitir nota continua simples do ponto de vista de quem opera. Cancelamento, carta de correção e os prazos legais para cada ação continuam existindo como hoje — só o "motor" por trás muda.
7. **Convivência segura na transição:** enquanto os dois sistemas rodam lado a lado, Delphi e Laravel emitem sem conflito de numeração de nota — não há risco de duas notas com o mesmo número.

Fonte: `.scratch/emissao-fiscal-eletronica-laravel-wayfinder/map.md` (mapa concluído, 14 decisões), especialmente as tickets 01 (fluxo legado/UniNFe), 07 (artefatos/DANFE/S3) e 09 (operação NF-e/NFC-e/contingência no caixa).

> **Adendo (2026-07-30, refinamento pós-publicação) — Integrações diretas via API, sem programa externo instalado:**
>
> - **DANFE sem UniDANFE.** Confirmado em `.scratch/emissao-fiscal-eletronica-laravel-wayfinder/issues/01-inventariar-fluxo-fiscal-legado.md`: hoje o DANFE é gerado/impresso pelo ACBr/UniDANFE a partir do XML. No Laravel, o próprio sistema forma, assina, transmite e gera o comprovante — elimina UniNFe (transmissão) **e** UniDANFE (impressão do comprovante), não só um dos dois.
> - **Gerenciamento centralizado de certificados digitais.** Certificado por Filial, com histórico de versões, validação e ativação administrativa, alertas de vencimento e uso protegido pelos processos automáticos — sem depender de instalação manual do certificado em cada estação (`.scratch/emissao-fiscal-eletronica-laravel-wayfinder/issues/06-definir-seguranca-certificados-a1.md`).
> - **Nexxera e PayGo — mesma lógica, ainda não migrado.** Confirmado com o usuário: hoje essas integrações (conciliação bancária via Nexxera, pagamento via PayGo) funcionam no Delphi por troca de arquivo e aplicativo local instalado — igual ao antigo UniNFe. A direção é a mesma da fiscal: migrar para integração direta via API, sem programa local. **Não há evidência disso no código Laravel ainda** — é direção futura confirmada pelo usuário, não algo já especificado ou implementado. Apresentar como roadmap, não como pronto.
> - **Templates de e-mail.** Já existe spec real (`laravel/specs/225-documento-envio-email/`, Status: Draft) para envio de documentos por e-mail com template HTML responsivo, começando por Orçamentos e preparando terreno para Contratos — upgrade sobre o CSS inline legado do Delphi. Identidade visual de marca por cliente **não** está especificada em lugar nenhum do repo; apresentar personalização visual como direção futura, não como recurso pronto.
