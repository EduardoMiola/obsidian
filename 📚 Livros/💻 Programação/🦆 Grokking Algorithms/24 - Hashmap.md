## 🧠 O que é?

Um **Hashmap** (ou tabela hash) é uma estrutura de dados que associa **chaves a valores** de forma extremamente eficiente. Ele permite **buscas, inserções e deleções em tempo constante** na média O(1), usando uma função de hash para transformar a chave em um índice.

No contexto de [[00 - Algoritmos|algoritmos]], hashmaps são ideais para:
- Buscar rapidamente se um item já foi processado
- Contar ocorrências de elementos
- Criar associações entre valores

## 🧩 Funcionamento básico

1. A chave passa por uma **função de hash** que retorna um índice.
2. Esse índice é usado para acessar a posição da memória onde o valor será armazenado.
3. Se houver **colisão** (dois itens para o mesmo índice), técnicas como *encadeamento* ou *endereçamento aberto* são usadas.

---

## 💥 Exemplo

```js title="🚀 Contar frequências de palavras"
function contarPalavras(lista) {
  const hash = {};

  for (const palavra of lista) {
    hash[palavra] = (hash[palavra] || 0) + 1;
  }

  return hash;
}

console.log(contarPalavras(["banana", "maçã", "banana", "pera"]));
// { banana: 2, maçã: 1, pera: 1 }
```

---

## 🧠 Por que usar Hashmaps?

- **Rápido**: Acesso direto via chave.
    
- **Flexível**: Chaves podem ser qualquer tipo de dado (strings, números, objetos...).
    
- **Ideal para algoritmos que exigem checagens frequentes**, como detecção de duplicatas ou rastreamento de elementos.

---

## 🔗 Notas Relacionadas

- 📌 **[[10 - Arrays]]** → Estrutura linear que serve de base para hashmaps.
    
- 📌 **[[11 - Listas]]** → Em colisões por encadeamento, listas são usadas para armazenar múltiplos itens no mesmo índice.
    
- 📌 **[[21 - Recursão]]** → Algoritmos recursivos podem usar hashmaps para **memoização** (ex: Fibonacci).
    
- 📌 **[[19 - Grafos]]** → Hashmaps são usados para representar grafos como listas de adjacência.


---

> [!tip] Dica Hashmaps são ótimos para **reduzir complexidade de algoritmos**, muitas vezes substituindo `O(n)` ou `O(n²)` por `O(1)` em operações de busca.

