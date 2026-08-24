# Prompt para `/speckit.specify` — correções residuais do catálogo oficial e da evidência normativa

```text
/speckit.specify

Revise o código Laravel atual após a implementação das specs 29 e 30 e produza uma especificação corretiva pronta para implementação. Não implemente código nesta execução.

O objetivo é fechar somente as lacunas residuais do catálogo oficial de Web Services e da configuração normativa já implementada. Não criar um segundo pipeline fiscal.

## Escopo que prevalece

1. Plataforma fiscal comum, primeiro aceite em NF-e modelo 55, Transferência, Filial de SC e homologação.
2. Runtime Linux.
3. NFS-e, Emissor Nacional, modelo 98, venda/devolução entre Filiais, entrada fiscal automática e produção permanecem fora.
4. Certificados continuam na tela própria, com vínculo explícito à Filial. Não criar fallback por raiz de CNPJ.
5. Não colocar tabela SC→SVRS no gateway e não descobrir endpoint pelo XSD.

## Estado confirmado a revisar

As specs 29 e 30 adicionaram/publicaram:

- configuração por UF/modelo/ambiente/vigência;
- tela `/fiscal/configuracao-normativa`;
- `FiscalCatalogoProveniencia`;
- `FiscalEndpointAmbienteGuard`;
- publicação de proveniência;
- diff administrativo;
- consulta administrativa de WSDL;
- perfil de homologação SC/NF-e 55/SVRS;
- diagnóstico sem UF obrigatória;
- cartão de configuração efetiva da Filial.

Revise especialmente:

- `backend/app/Domain/Fiscal/Config/FiscalCatalogoProveniencia.php`;
- `backend/app/Domain/Fiscal/Config/FiscalEndpointAmbienteGuard.php`;
- `backend/app/Application/Fiscal/ConsultarWsdlNormativoService.php`;
- `backend/app/Application/Fiscal/PublishFiscalConfigService.php`;
- `backend/app/Application/Fiscal/DiffConfiguracaoNormativaService.php`;
- `backend/app/Infrastructure/Fiscal/Persistence/FiscalConfigurationResolver.php`;
- `backend/app/Application/Fiscal/ListarConfiguracaoNormativaService.php`;
- `backend/app/Application/Fiscal/ProjetarConfiguracaoEfetivaFilialService.php`;
- `backend/app/Http/Controllers/Fiscal/Config/FiscalConfiguracaoNormativaController.php`;
- `backend/resources/js/Pages/Fiscal/ConfiguracaoNormativa/Index.tsx`;
- `backend/resources/js/Pages/Fiscal/ConfiguracaoNormativa/Show.tsx`;
- `backend/resources/js/Pages/Cadastros/Filiais/components/FilialEmissaoNfeCard.tsx`;
- testes da feature `385-nfe-ws-catalog` e contratos em `specs/385-nfe-ws-catalog/contracts/`.

Classifique cada achado como CONFIRMADO, PARCIAL, CORRIGIDO ou NÃO LOCALIZADO, citando arquivo, método e comportamento observado.

## Correção 1 — proveniência oficial realmente verificável

O código atual aceita `fonte_tipo` pertencente ao enum e campos não vazios, mas não garante que:

- `fonte_url` pertença ao domínio oficial compatível com `fonte_tipo`;
- a URL seja HTTPS, sem credenciais ou host privado;
- `consultado_em` seja uma data/hora válida e normalizada;
- `aprovado_por` exista ou seja preenchido de forma confiável pelo ator autenticado;
- `manifesto_hash`, quando informado, tenha formato válido;
- a proveniência não seja somente um rótulo `portal_svrs` apontando para domínio arbitrário.

Especifique uma política de fontes oficiais, sem aceitar blogs, UniNFe, hosts arbitrários ou URLs internas. O responsável pela publicação/aprovação deve vir do usuário/capability autenticado ou ser validado no servidor; não confiar cegamente em `aprovado_por` enviado no JSON.

Preservar a possibilidade de fontes oficiais do Portal Nacional, SVRS, MOC e comunicados oficiais de SEFAZ, com allowlist/política documentada e extensível. Não transformar a URL de uma fonte em regra permanente de endpoint.

## Correção 2 — host e caminho exatos do Web Service

`FiscalEndpointAmbienteGuard` atualmente verifica marcadores textuais como `homolog`, presença parcial de `svrs.rs.gov.br` e ausência de `nfce`, mas isso permite hosts/caminhos que apenas contenham esses textos.

Especificar e implementar validação que:

- exija esquema HTTPS;
- rejeite URL sem esquema, URL com credenciais, porta inesperada ou host por substring;
- compare host e caminho contra o perfil normativo/oficial aprovado;
- diferencie exatamente NF-e 55 de NFC-e 65;
- diferencie `nfe-homologacao.svrs.rs.gov.br` de `nfe.svrs.rs.gov.br`;
- rejeite `nfe-homologacao.sefazrs.rs.gov.br` quando o autorizador for SVRS;
- não reescreva host, caminho ou ambiente;
- valide a coerência da URL de WSDL com a URL do serviço (`url + ?wsdl`) quando essa relação for declarada;
- preserve a URL aprovada no snapshot sem normalização destrutiva.

Para SC/NF-e 55/homologação, o primeiro perfil deve continuar baseado na evidência oficial registrada para SVRS, incluindo:

`https://nfe-homologacao.svrs.rs.gov.br/ws/NfeStatusServico/NfeStatusServico4.asmx`

O valor não deve virar constante escondida no gateway. A validação deve usar o perfil/proposta/fonte do catálogo e a publicação versionada.

## Correção 3 — mesma política na publicação, resolução e diagnóstico

Definir a autoridade de cada validação:

- publicação/dry-run recusam perfil incompleto, fonte inválida, autorizador incompatível, serviço ausente e endpoint incompatível;
- resolução nunca preenche endpoint por fallback;
- resolução não deve considerar um snapshot claramente inválido como efetivo apenas porque existe uma linha `PUBLICADA` legada;
- pelo menos `status_servico` deve estar presente e válido antes da etapa de rede do diagnóstico;
- o diagnóstico deve usar o endpoint do snapshot e registrar o endpoint efetivo aplicado ao NFePHP;
- falha de URL não pode escolher outro autorizador, UF, modelo ou endpoint.

Se a decisão for manter seis serviços obrigatórios somente na publicação, documentar como snapshots legados são classificados na resolução/UI e garantir que o diagnóstico não tente rede com `status_servico` ausente ou vazio.

## Correção 4 — consulta WSDL administrativa segura

`ConsultarWsdlNormativoService` faz GET administrativo da URL recebida. Especificar proteção contra SSRF e respostas enganosas:

- aceitar somente HTTPS;
- aceitar somente hosts oficiais permitidos pelo perfil/fonte;
- bloquear IP literal, localhost, loopback, redes privadas, link-local, metadata endpoints e DNS que resolva para rede privada;
- impedir redirecionamento para host não autorizado ou validar cada salto;
- limitar porta, timeout, tamanho de resposta e número de redirecionamentos;
- não enviar certificado, segredo, cookie ou credencial;
- parsear XML com external entities desabilitadas;
- verificar que a resposta é realmente WSDL, serviço e versão compatíveis, sem confiar apenas na presença textual da palavra `wsdl`;
- não devolver trecho arbitrário do corpo externo na resposta administrativa;
- preservar a distinção: consulta WSDL não é status SEFAZ, não é autorização e não deve ser precondição do diagnóstico.

Criar testes negativos para URL interna, HTTP, redirect externo, conteúdo que apenas contém `wsdl`, XML malformado e WSDL incompatível.

## Correção 5 — evidência completa na tela

A tela de detalhe deve mostrar, de forma sanitizada:

- todos os seis serviços obrigatórios do perfil NF-e 55, inclusive os ausentes como falha explícita;
- URL, serviço oficial, versão e WSDL quando aplicável;
- fonte oficial, tipo, data/hora de consulta, documento/referência;
- responsável pela aprovação;
- hash do manifesto normativo quando informado;
- pacote XSD e hash do pacote XSD;
- autorizador, vigência, ambiente e estado calculado.

Não omitir silenciosamente serviço ausente apenas porque ele não existe no JSON.

O cartão na tela da Filial deve:

- manter-se somente leitura;
- exibir a configuração efetiva e o `configuracao_id`/link direto para o detalhe normativo;
- mostrar autorizador, pacote, leiaute, vigência e status;
- indicar claramente configuração ausente, inválida, expirada ou sobreposta;
- não permitir edição de UF, endpoint, XSD ou hash;
- não afirmar prontidão apenas porque a configuração normativa foi encontrada.

## Correção 6 — diff e imutabilidade

Revise o diff administrativo para confirmar que a proposta é comparada contra a configuração efetiva correta do escopo/data, não simplesmente contra o primeiro registro publicado retornado pelo histórico.

O diff deve comparar, conforme o contrato:

- autorizador;
- URL, versão, WSDL e serviço oficial de cada serviço;
- fonte, tipo, data, documento, responsável e hash normativo;
- pacote/hash XSD quando fizer parte da proposta;
- sem persistir e sem chamar SEFAZ.

Alteração de endpoint, autorizador, fonte ou proveniência exige nova publicação versionada, motivo, vigência não sobreposta e preservação do snapshot anterior.

## Testes obrigatórios

Adicionar ou corrigir testes para:

1. fonte `portal_svrs` com domínio arbitrário recusada;
2. fonte HTTP, host privado, credenciais na URL e data inválida recusados;
3. `aprovado_por` ausente ou adulterado tratado pelo servidor;
4. host SVRS parecido, subdomínio não aprovado ou caminho incorreto recusado;
5. endpoint sem esquema HTTPS recusado;
6. URL de produção em homologação e URL NFC-e em NF-e recusadas;
7. snapshot legado sem `status_servico` bloqueado antes da rede;
8. WSDL não autorizado, redirect para rede privada e conteúdo falso recusados;
9. WSDL válido não chama status nem autorização;
10. detalhe mostra todos os seis serviços, inclusive ausentes;
11. detalhe mostra toda a proveniência sanitizada;
12. cartão da Filial aponta para o detalhe do snapshot efetivo;
13. diff usa o registro vigente correto e não persiste;
14. duas Filiais SC compartilham snapshot e continuam usando certificados distintos;
15. diagnóstico sem `--uf` deriva SC e usa o endpoint do snapshot;
16. nenhuma resposta contém senha, PFX, chave privada, token ou corpo externo arbitrário;
17. nenhum fluxo NFS-e, venda/devolução ou produção é criado ou reativado.

## Verificação da entrega

Executar:

- `php -l` nos arquivos PHP alterados;
- `git diff --check` sem whitespace residual nos arquivos da entrega;
- suíte Unit/Feature fiscal em PHP suportado pelo projeto;
- testes PostgreSQL previstos pelos contratos;
- revisão do runbook SC/55/homologação.

Se Docker/serviços externos não estiverem disponíveis, registrar isso como limitação de validação e não declarar prontidão real.

## Critérios de aceite

- Somente fontes oficiais compatíveis com o tipo são publicáveis.
- Host e caminho dos endpoints são validados sem substring permissiva.
- Consulta WSDL não abre SSRF nem valida qualquer XML arbitrário como WSDL.
- Snapshot inválido não chega à rede de homologação.
- Tela administrativa exibe evidência completa e a tela da Filial apenas consulta a configuração efetiva.
- Alterações normativas preservam histórico e exigem nova publicação.
- Diagnóstico SC/55/homologação continua usando SVRS somente porque o snapshot publicado o declara com fonte oficial.
- XSD não descobre URL e gateway não contém mapa SC→SVRS.
- Escopo permanece NF-e modelo 55/Transferência/homologação Linux, sem NFS-e.

Não alterar código nesta chamada. Entregar `spec.md`, contratos atualizados, tarefas, matriz de falhas, testes de aceite e runbook revisado.
```
