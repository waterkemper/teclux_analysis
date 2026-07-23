Type: grilling
Status: resolved

## Question

O formulário atual bloqueia o envio com dois checkboxes de consentimento (`consentimento_diagnostico` obrigatório + `consentimento_screenshot` condicional, exigido só quando o usuário ativa a captura), com linguagem formal de LGPD. A decisão de escopo já tomada (ver Decisões do mapa) é: para usuários internos das empresas-cliente operando o próprio ERP, isso é burocracia desnecessária e deve virar **um aviso único, não bloqueante**, no lugar dos dois checkboxes.

Falta fechar o desenho concreto:

- Texto exato do aviso (o que ele comunica sobre dados de diagnóstico/contexto técnico enviados).
- Onde ele aparece no formulário (posição, estilo — texto simples vs. banner).
- O que acontece com o checkbox "Incluir captura da tela atual": ele continua existindo como opt-in funcional (o usuário escolhe incluir ou não o screenshot), só deixa de ser gated por um checkbox de consentimento separado bloqueante — confirmar se isso é aceitável ou se ainda precisa de algum tipo de confirmação extra nesse caso específico.
- Impacto nos botões "Enviar pedido" hoje desabilitados por `!consentDiag` e por `(incluirShot && !consentShot)` em `laravel/backend/resources/js/Components/erp/help/HelpForm.tsx` (essas condições de disable devem sair).

Referências: `laravel/specs/161-erp-help-zendesk/spec.md` (FR-004, FR-008, seção 9 LGPD), `laravel/backend/resources/js/Components/erp/help/HelpForm.tsx`.

## Answer

Desenho fechado:

1. **Remover da UI** os dois checkboxes de consentimento (`consentDiag` — "Autorizo o envio de dados de diagnóstico..." — e `consentShot` — "Autorizo a captura automática da interface... como anexo").
2. **Adicionar um aviso único, não bloqueante**, no **rodapé do formulário** (perto dos botões Cancelar/Enviar, onde hoje fica a caixa de consentimento de diagnóstico), com o texto:
   > "Este pedido inclui dados técnicos da sua sessão (tela, navegador, ações recentes) para ajudar o suporte a diagnosticar."
3. O checkbox **"Incluir captura da tela atual"** (`incluirShot`) continua existindo como **opt-in funcional** — o usuário decide se quer anexar screenshot ou não — mas **sem** um segundo checkbox de consentimento específico bloqueando essa escolha. O aviso único do item 2 já cobre a menção a "tela".
4. O botão **"Enviar pedido"** deixa de ser desabilitado pelas condições `!consentDiag` e `(incluirShot && !consentShot)`; passa a ser desabilitado só por `loading`.
5. **Contrato com o backend não muda**: o payload enviado por `HelpForm.tsx` passa a incluir sempre `consentimento_diagnostico: true` e, quando `incluirShot` estiver marcado, `consentimento_screenshot: true` — automaticamente, sem input do usuário. `SubmitHelpRequestRequest.php` continua validando exatamente como está hoje (`Rule::in([true])`), sem risco de quebrar.

**Arquivos afetados na execução futura**: `laravel/backend/resources/js/Components/erp/help/HelpForm.tsx` (remover estado/checkboxes de consentimento, ajustar `disabled` do submit, ajustar payload, adicionar o novo texto de aviso). Nenhuma mudança de backend necessária.
