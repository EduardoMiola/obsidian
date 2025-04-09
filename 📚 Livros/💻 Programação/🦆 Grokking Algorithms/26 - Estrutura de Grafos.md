## 🧠 O que é?

Um **grafo** é uma estrutura de dados usada para representar **relações** ou **conexões** entre elementos. Um grafo é composto por **vértices (nós)** e **arestas (ligações)**. Pode ser:

- **Dirigido** (arestas com direção) ou **não-dirigido**
    
- **Ponderado** (com pesos nas arestas) ou **não-ponderado**
    

Grafos são usados em modelagem de redes sociais, mapas, algoritmos de recomendação, entre outros.

---

## 🔧 Representações comuns:

1. **Lista de Adjacência** Mais eficiente em termos de memória para grafos esparsos.
    
    Exemplo em JS:
    
    ```js
    const grafo = {
      A: ['B', 'C'],
      B: ['A', 'D'],
      C: ['A', 'D'],
      D: ['B', 'C']
    };
    ```
    
2. **Matriz de Adjacência** Boa para grafos densos. Usa mais memória.
    
    ```js
    // Vértices: A, B, C, D
    const matriz = [
      [0, 1, 1, 0],
      [1, 0, 0, 1],
      [1, 0, 0, 1],
      [0, 1, 1, 0]
    ];
    ```
    

---

## 🔗 Notas Relacionadas

- 📌 [[25 - Breadth-First Search]] → Algoritmo de busca em largura para grafos.
    
- 📌 [[27 - Depth-First Search]] → Percorre os vértices por profundidade.
    
- 📌[[ 02 - Complexidade de algoritmos]] → Custo de percorrer um grafo depende do número de vértices e arestas.
    
- 📌[[ 10 - Arrays]] → Estruturas básicas usadas na construção de listas de adjacência ou matriz.
    

---