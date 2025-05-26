## Como funciona o fluxo do contexto, modal e seleção de modo de visualização

### 1. **Contexto**
- O contexto (`TarefasContext`) centraliza todos os estados e funções que a página de tarefas precisa.
- Ele é criado no arquivo `Tarefas.context.tsx` e expõe, entre outras coisas, a referência do modal (`viewModeBottomSheetModalRef`) e a função `handlePresentViewModeSheet`.
- Qualquer componente dentro do Provider pode acessar essas funções e estados usando o hook `useTarefasContext()`.

### 2. **Header e Botão**
- O componente `TarefasHeader` consome o contexto.
- O botão no header chama `handlePresentViewModeSheet` ao ser pressionado.
- Essa função, por sua vez, executa `viewModeBottomSheetModalRef.current?.present()`, abrindo o modal de seleção de modo de visualização.

### 3. **Modal de Seleção (ViewModeSheet)**
- O `ViewModeSheet` é um modal que recebe:
  - A referência (`ref`) para ser controlado externamente.
  - O modo de visualização atual (`viewMode`).
  - Todos os modos disponíveis (`viewModes`).
  - Funções de callback para mudança de valor e posição do modal.
- Dentro dele, um `RadioGroup` exibe as opções de visualização usando a função `renderRadioGroupItem`.

### 4. **Renderização dos Itens**
- `renderRadioGroupItem` monta cada item do grupo de rádio, mostrando ícone, label e estado selecionado.
- Se for o terceiro item (índice 2) e o usuário não tiver permissão, o clique mostra um toast de "Sem permissão".
- Caso contrário, o item é renderizado normalmente.

### 5. **RadioGroupItemWithLabel**
- Componente reutilizável para exibir cada opção do radio.
- Mostra o label (texto ou função), ícone e o radio button.
- Usa o estado `isSelected` para estilizar e mostrar o check.

---

## Resumindo o fluxo

1. **Usuário clica no botão do header**  
   ⬇️  
2. **Chama handlePresentViewModeSheet do contexto**  
   ⬇️  
3. **Abre o modal ViewModeSheet via ref**  
   ⬇️  
4. **Usuário escolhe um modo**  
   ⬇️  
5. **onValueChange dispara a função do contexto para atualizar o modo**  
   ⬇️  
6. **A tela se atualiza conforme o modo selecionado**

---

## Dicas para estudar Context no React

- Contexto no React é para compartilhar dados/funções entre componentes sem precisar passar props manualmente.
- O Provider monta o "pacote" de dados/funções usando hooks e passa para os filhos.
- O hook `useContext` (ou um custom, como `useTarefasContext`) serve para acessar esse pacote em qualquer componente filho.

---

Se quiser um exemplo mais simples ou quiser ver como criar um contexto do zero, só pedir! Você está no caminho certo!