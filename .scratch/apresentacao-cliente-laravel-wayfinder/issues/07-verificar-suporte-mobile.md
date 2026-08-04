# Verificar suporte a uso mobile/responsivo no código

Type: task
Status: resolved
Blocked by:

## Question

O frontend Laravel (React) tem de fato suporte responsivo/mobile — breakpoints, componentes que se adaptam a telas pequenas, viewport configurado — ou isso ainda não existe? Inspecionar o código (framework CSS, layout, componentes-chave como grids e formulários) e produzir uma resposta factual: o que já funciona bem no celular/tablet hoje, o que é limitado, para calibrar com honestidade a afirmação "acesse de qualquer lugar, inclusive do celular" na apresentação.

## Answer

Evidência factual (código):

- Viewport configurado corretamente (`laravel/backend/resources/views/app.blade.php`).
- Tailwind CSS v4 em uso em todo o frontend, com 1.261 ocorrências de breakpoints (`sm:`/`md:`/`lg:`/`xl:`) — concentradas nas telas de cadastro/formulário (ex.: Cadastro de Produtos, Cadastro de Clientes), que de fato se adaptam a telas menores.
- O layout principal (`AppLayout.tsx`) trata a navegação lateral como oculta apenas em telas ≥ `md`; abaixo disso o comportamento não foi pensado especificamente para mobile.
- O corpo da aplicação usa altura fixa com scroll interno controlado por componente — é um padrão de "aplicativo desktop no navegador", não de página que rola livremente como um site mobile comum.
- As grids/tabelas ddensas — o coração operacional do ERP — **não colapsam nem viram cards em tela pequena**: ficam com largura mínima fixa e acessíveis por scroll horizontal (`DataGrid.tsx`, `ErpDataGridScrollShell.tsx`).
- Nenhum teste ou documentação dedicados a comportamento mobile.

**Conclusão honesta para o slide:** "O sistema abre no navegador de qualquer aparelho, sem instalar nada — os cadastros e formulários se adaptam bem a telas menores. As telas de grade mais densas continuam melhores em tablet/desktop, mas funcionam por scroll no celular quando precisar." Não afirmar "totalmente otimizado para celular" — é acesso universal via navegador com boa responsividade em formulários, não um app mobile-first.
