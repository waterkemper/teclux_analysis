# Prompt para /speckit.specify — chave NF-e compartilhada

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para estabelecer no Laravel o padrão compartilhado de entrada, normalização e validação de **Chave de Acesso NF-e**, primeira de quatro fatias de **Interlojas → Confirmação por Notas**.

Não implemente durante `/speckit.specify`. Inspecione o checkout Laravel atual e cite arquivos concretos. Não investigue Delphi: este prompt e as pesquisas em `modules/interlojas/confirmacao-por-notas/` são autoritativos. A pesquisa confirmou que ainda não existe componente, Rule ou value object canônico de chave NF-e.

## Objetivo e fronteira

Entregue uma autoridade reutilizável:

- backend: value object imutável `NfeAccessKey`, regra/integração com Form Request e testes;
- frontend: utilitários puros de normalização/formatação e `NfeAccessKeyInput` compartilhado sobre o `Input` atual;
- contrato único para formulários futuros, inicialmente consumido pela spec 03.

Não altere automaticamente grids somente leitura ou consumidores existentes. Não implemente consulta de notas, menu ou confirmação nesta fatia.

## Contrato canônico

- Valor semântico e persistido: string com exatamente 44 dígitos, preservando zeros iniciais.
- Aceitar entrada digitada ou colada com/sem separadores; remover somente caracteres de apresentação.
- Rejeitar letras, valor vazio quando obrigatório, 43/45 dígitos e dígito verificador inválido.
- Validar o DV oficial por módulo 11 no backend; documentar algoritmo, pesos e exceção do resultado.
- Backend é autoridade. Frontend oferece feedback equivalente, sem permitir que sua validação substitua a Rule/value object.
- Nunca usar `number`, inteiro ou coerção numérica.
- Serialização, query e DTO usam os 44 dígitos sem máscara.

## Componente frontend

- Máscara visual em 11 grupos de quatro dígitos, sem fazer parte do valor semântico.
- `inputMode=numeric`, `autoComplete=off`, label visível e ajuda “44 dígitos”.
- Aceitar colagem formatada/crua, limitar a 44 dígitos e preservar cursor durante edição.
- Integrar `aria-invalid`, `aria-describedby` e erro textual ao contrato do `Input` existente.
- Não anunciar erro de comprimento a cada tecla; validar em blur/submit, mantendo feedback adequado.
- Expor API tipada e controlada para valor canônico, evento de mudança, erro, disabled, required, id e foco/ref.
- Utilitários `normalizeNfeAccessKey` e `formatNfeAccessKey` não dependem de React.

## Backend

- Value object constrói somente estado válido e expõe valor canônico/string.
- Rule/Form Request converte falhas em 422 com mensagens separadas para formato/comprimento e DV.
- Não registrar a chave completa em logs de erro além do que o projeto já permite; não registrar payload bruto desnecessariamente.
- Evitar segunda implementação divergente do algoritmo entre Rule e value object.
- Preparar namespaces/interfaces para uso por módulos fiscais, de estoque e Interlojas.

## Critérios de aceite

- [ ] Há uma única autoridade backend para normalização, 44 dígitos e DV.
- [ ] Valor canônico preserva zeros e nunca contém máscara.
- [ ] Componente compartilhado aceita digitação e colagem formatada/crua.
- [ ] Máscara é somente visual e acessível.
- [ ] Form Requests recebem mensagens 422 estáveis.
- [ ] A API frontend é reutilizável e tipada.
- [ ] Nenhum consumidor existente é migrado incidentalmente.

## Matriz mínima de testes

- chave válida, DV inválido, 43 e 45 dígitos;
- zeros iniciais;
- espaços, hífens e colagem formatada;
- letras e caracteres inesperados;
- vazio opcional versus obrigatório;
- normalização e formatação idempotentes;
- edição no início/meio/fim e preservação do cursor;
- blur/submit, erro textual, `aria-invalid` e `aria-describedby`;
- paridade de vetores válidos/inválidos entre PHP e TypeScript.

## Saída esperada

Produza spec e plano executáveis com árvore de arquivos, APIs PHP/TypeScript, algoritmo, mensagens, integração com Form Request, acessibilidade e testes. Não implemente durante `/speckit.specify`.

## Fora de escopo

- consulta ou confirmação de notas;
- leitura de XML, consulta SEFAZ ou geração de chave;
- migração em massa de campos existentes;
- implementação durante esta especificação.
```
