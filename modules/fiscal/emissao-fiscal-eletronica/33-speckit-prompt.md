# Prompt para `/speckit.specify` — estado visual da proveniência inválida

```text
/speckit.specify

Revise o código Laravel atual após a implementação da spec 32 e produza uma especificação corretiva pronta para implementação. Não implemente código nesta execução.

## Escopo

Fechar somente a inconsistência residual de classificação visual encontrada na revisão da spec 32. Preservar as correções já entregues para proveniência em três estados, resolução, diagnóstico, diff, WSDL, auditoria e modelo obrigatório.

Continuam fora de escopo: NFS-e, Emissor Nacional, NFC-e 65, produção, venda/devolução entre Filiais, entrada fiscal automática, fallback de certificado por raiz de CNPJ, mapa SC→SVRS no gateway e descoberta de endpoint pelo XSD.

## Achado confirmado

Em `backend/app/Application/Fiscal/ListarConfiguracaoNormativaService.php`, método `estadoUi`, a verificação da proveniência presente inválida ocorre depois de `endpointGuard->evaluateForPublish()`.

Consequentemente, uma linha `PUBLICADO`, modelo 55, cobrindo hoje, com `metadados` presentes e inválidos e também com endpoints/perfil incompleto pode retornar `INCOMPLETA` antes de chegar ao ramo:

```php
if ($modelo === 55 && $leitura !== null && $leitura->isInvalida()) {
    return 'INELEGÍVEL';
}
```

Isso contraria `specs/389-fix-catalog-residuals/contracts/proveniencia-tres-estados.md` e `spec.md`: proveniência presente inválida deve ser sempre `INELEGÍVEL`; `INCOMPLETA` fica reservado à ausência de perfil/serviços ou outras lacunas de configuração. A ordem da decisão não pode deixar uma proveniência ilegal parecer apenas incompleta.

Classifique o achado como CONFIRMADO, PARCIAL, CORRIGIDO ou NÃO LOCALIZADO, citando método, teste e comportamento observado. Não reimplementar o que já está corrigido na spec 32.

## Correção obrigatória

1. Em `ListarConfiguracaoNormativaService::estadoUi`, para modelo 55 e leitura `invalida`, retornar `INELEGÍVEL` antes das validações de endpoint, hash ou demais classificações de incompletude.
2. Manter a regra de legado: `metadados` ausentes não são automaticamente inválidos; podem seguir para a regra de legado 388 e só devem ser `PUBLICADA` se o restante for efetivo.
3. Manter `projectRow` sem projetar o JSON ilegal (`metadados = null`) e sem expor motivo interno, URL maliciosa ou segredo.
4. Não alterar o resolvedor: a resolução já retorna `INCOMPATIBILIDADE` sem snapshot quando somente há proveniência inválida; uma linha válida continua podendo ser efetiva quando há uma inválida sobreposta.
5. Não alterar o diff: linha inválida não pode ser vigente efetivo.

## Testes de aceite

- Linha 55 cobrindo hoje com proveniência inválida e endpoints válidos → `estado_ui = INELEGÍVEL`.
- Linha 55 cobrindo hoje com proveniência inválida e endpoints incompletos → também `estado_ui = INELEGÍVEL`, nunca `INCOMPLETA`.
- Linha 55 legada sem metadados e com `status_servico` válido continua seguindo a regra de legado 388.
- Listagem e detalhe mantêm `metadados = null` para JSON inválido e não exibem o JSON cru, motivo interno, senha, PFX, chave privada, token ou corpo WSDL.
- Regressão das suítes 385, 388 e 389 permanece verde.

## Higiene da entrega

Remover whitespace residual apontado por `git diff --check` nos arquivos adicionados da spec 389, especialmente os contratos Markdown, sem modificar conteúdo funcional.

Executar `php -l` nos PHP alterados, `git diff --check`, testes Unit/Feature fiscais e Vitest do detalhe. Se Docker/serviços externos não estiverem disponíveis, registrar a limitação e não declarar prontidão real de homologação.

Entregar `spec.md`, contratos, tarefas, matriz de falhas e testes de aceite. Não alterar código nesta chamada.
```
