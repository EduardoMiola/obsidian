## 🧠 O que são?

**Algoritmos de ordenação** organizam os dados em uma determinada ordem (crescente ou decrescente). São fundamentais para otimizar buscas, facilitar visualizações e preparar dados para processamento.

O *Grokking Algorithms* apresenta dois principais:

- **Selection Sort**
- **Quicksort**

Cada um tem características, complexidades e aplicações diferentes.

---

## 📊 Comparação entre algoritmos

| Algoritmo        | Complexidade | Abordagem         | Estável? | Divide & Conquer? |
|------------------|--------------|-------------------|----------|-------------------|
| Selection Sort   | O(n²)        | Iterativa simples | ❌        | ❌                 |
| Quicksort        | O(n log n)   | Recursiva         | ❌        | ✅                 |
| Merge Sort       | O(n log n)   | Recursiva         | ✅        | ✅                 |

---

## 🔥 Exemplo: Selection Sort

```js
function selectionSort(arr) {
  const n = arr.length;

  for (let i = 0; i < n; i++) {
    let menorIndex = i;
    for (let j = i + 1; j < n; j++) {
      if (arr[j] < arr[menorIndex]) {
        menorIndex = j;
      }
    }

    if (menorIndex !== i) {
      [arr[i], arr[menorIndex]] = [arr[menorIndex], arr[i]];
    }
  }

  return arr;
}
```

---

## 🔗 Notas Relacionadas

- 📌 **[[12 - Selection Sort]]** → Algoritmo simples, porém ineficiente para listas grandes.
    
- 📌 **[[23 - Quicksort]]** → Algoritmo eficiente e amplamente utilizado, usa recursão.
    
- 📌 **[[22 - Divide and Conquer]]** → Técnica utilizada por algoritmos como Quicksort e Mergesort.
    
- 📌 **[[02 - Complexidade de algoritmos]]** → Entenda como medir a eficiência de cada algoritmo.
    
- 📌 **[[04 - Complexidade linear]]**, **[[06 - Complexidade n log n]]**, **[[07 - Complexidade n^2]]** → Categorias de performance dos algoritmos de ordenação.
    

---

> [!tip] Dica Se você estiver lidando com grandes volumes de dados e precisa de performance, evite algoritmos com complexidade `O(n²)` como o Selection Sort. Prefira alternativas com `O(n log n)`.

