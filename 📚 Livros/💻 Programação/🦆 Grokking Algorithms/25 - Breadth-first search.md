## 🧠 O que é?

**Breadth-First Search (BFS)** é um algoritmo de busca usado para percorrer ou procurar elementos em **grafos** ou **árvores**, explorando **nível por nível** (largura).

É ideal para encontrar:

- O caminho mais curto entre dois nós em grafos não ponderados.
- Elementos em árvores por profundidade crescente.

---

## 🔍 Como funciona?

1. Começa pelo nó inicial.
2. Coloca todos os vizinhos diretos numa **fila**.
3. Processa cada vizinho, adicionando seus vizinhos ainda não visitados no final da fila.
4. Repete até encontrar o alvo ou esgotar os nós.

---

## 🔧 Exemplo em JavaScript


```js
function buscaEmLargura(grafo, inicio, objetivo) {
  const fila = [inicio];
  const visitados = new Set();

  while (fila.length > 0) {
    const pessoa = fila.shift();
    
    if (!visitados.has(pessoa)) {
      if (pessoa === objetivo) return true;
      visitados.add(pessoa);
      fila.push(...grafo[pessoa]);
    }
  }

  return false;
}

// Exemplo de uso:
const grafo = {
  'voce': ['alice', 'bob', 'claire'],
  'bob': ['anuj', 'peggy'],
  'alice': ['peggy'],
  'claire': ['thom', 'jonny'],
  'anuj': [],
  'peggy': [],
  'thom': [],
  'jonny': []
};

console.log(buscaEmLargura(grafo, 'voce', 'thom')); // true

```
---

## 🔗 Notas Relacionadas

- 📌 **[[16 - Filas]]** → Estrutura essencial para implementação de BFS.
	
- 📌 **[[19 - Grafos]]**	
    
- 📌 **[[26 - Estrutura de Grafos]]** → Representação dos dados para aplicar busca.
    
- 📌 **[[02 - Complexidade de algoritmos]]** → A BFS tem complexidade O(V + E), onde V = vértices e E = arestas.
    

---

> [!tip] Dica Sempre que precisar encontrar **o menor caminho em termos de passos** (não custo) em um grafo **não ponderado**, prefira usar BFS.
