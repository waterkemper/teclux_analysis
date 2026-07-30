# 04 — Contrair o controlador operacional legado

**What to build:** remover a forma antiga depois que leituras e mutações estiverem migradas, deixando a Console composta por controladores coesos, Form Requests e serviços injetados sem alterar a experiência do Administrador.

**Blocked by:** 02 — Migrar consultas para controladores por recurso; 03 — Migrar comandos para controladores por recurso.

**Status:** done

- [x] Nenhuma rota da Console aponta para o controlador legado.
- [x] O controlador legado e validações inline sem consumidores são removidos.
- [x] Não há consultas diretas a modelos nem resolução dinâmica de serviços nos controladores remanescentes.
- [x] A suíte de contratos HTTP/Inertia confirma compatibilidade das rotas e respostas existentes.
- [x] As regras arquiteturais falham caso qualquer padrão removido seja reintroduzido.
- [x] Não são alterados módulos fora da Console de Operações.
