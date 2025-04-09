### 🤔 O que é?

Um jeito de achar **o caminho mais curto** entre dois pontos em um mapa (ou [[19 - Grafos|Grafo]]), quando as distâncias entre os pontos são **todas positivas**.

> Ex: Qual o caminho mais rápido da casa pra escola, passando por ruas com diferentes distâncias?

---

### 🧱 Como funciona?

1. Começa no ponto de origem.
    
2. Vai marcando a **menor distância conhecida** pra cada ponto vizinho.
    
3. Sempre escolhe o **vizinho com menor distância** pra explorar primeiro.
    
4. Repete até chegar ao destino (ou visitar todos os pontos).
    

---

### 💻 Código bem simples (pseudo-JS)

```js
function dijkstra(grafo, inicio) {
  const dist = {};
  const visitado = {};

  for (let no in grafo) {
    dist[no] = Infinity;
  }
  dist[inicio] = 0;

  while (true) {
    let noAtual = menorDistNaoVisitado(dist, visitado);
    if (!noAtual) break;

    for (let vizinho in grafo[noAtual]) {
      let novaDist = dist[noAtual] + grafo[noAtual][vizinho];
      if (novaDist < dist[vizinho]) {
        dist[vizinho] = novaDist;
      }
    }

    visitado[noAtual] = true;
  }

  return dist;
}
```

---

### 🔗 Conecta com:

- [[25 - Breadth-first search]] → Caminhos curtos quando todas as distâncias são 1.
    
- [[26 - Estrutura de grafos]] → Representação dos caminhos.
    
- [[28 - Fila de prioridade]] → Torna o Dijkstra mais rápido.
    

---

### ⚠️ Lembrete

> Não funciona bem com distâncias **negativas**.  
> Use [[Bellman-Ford]] nesses casos.
