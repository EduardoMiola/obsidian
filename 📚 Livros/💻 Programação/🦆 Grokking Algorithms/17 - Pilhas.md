## 🧠 O que são?

**Pilhas (Stacks)** são estruturas de dados lineares que seguem a ordem **LIFO** (_Last In, First Out_), ou seja, o último elemento que entra é o primeiro a sair.

São usadas em:

- **Desfazer ações** (undo)
- **Navegação de páginas** (histórico do navegador)
- **Avaliação de expressões matemáticas**
- **Gerenciamento de chamadas de função** (call stack)

---

## 🔧 Como implementar uma pilha

### ✅ Versão em JavaScript

```js
class Pilha {
  constructor() {
    this.items = [];
  }

  push(elemento) {
    this.items.push(elemento);
  }

  pop() {
    if (this.estaVazia()) return null;
    return this.items.pop();
  }

  topo() {
    return this.items[this.items.length - 1];
  }

  estaVazia() {
    return this.items.length === 0;
  }

  tamanho() {
    return this.items.length;
  }

  limpar() {
    this.items = [];
  }
}
```

---

## 🔗 Notas Relacionadas

- 📌 **[[20 - A Call Stack]]** → Pilhas são a base da pilha de chamadas de funções.
    
- 📌 **[[21 - Recursão]]** → Toda chamada recursiva depende do comportamento de uma pilha.
    
- 📌 **[[16 - Filas]]** → Estrutura semelhante, mas com ordem FIFO.
    
- 📌 **[[10 - Arrays]]** → Pilhas geralmente são implementadas com arrays.
    
- 📌 **[[08 - Complexidade n!]]** → Algoritmos com uso intenso de recursão, impactando o tamanho da pilha.
    

---

> [!tip] Dica Sempre que uma função precisa “lembrar” do estado anterior para continuar depois, provavelmente uma pilha está sendo usada por trás dos panos.