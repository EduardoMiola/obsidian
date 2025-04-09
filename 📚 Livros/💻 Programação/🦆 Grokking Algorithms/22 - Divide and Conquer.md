## O que é?

Divide and Conquer é uma técnica de resolução de problemas que consiste em dividir um problema em partes menores, resolvê-las separadamente e então combinar as soluções. Essa abordagem é eficiente para diversos algoritmos, como a **busca binária**, **quicksort** e **multiplicação rápida de matrizes**.


> [!tip] Dica
> Quando você estiver escrevendo uma função recursiva envolvendo um array, o caso base é quase sempre um array vazio ou um array com um elemento. Se você está preso tente isso primeiro.


## 🔗 Notas Relacionadas

- 📌 **[[01 - Busca binária]]** → Aplicação de _Divide and Conquer_ para pesquisa eficiente.
    
- 📌 **[[21 - Recursão]]** → A maioria dos algoritmos _Divide and Conquer_ usam recursão.
    
- 📌 **[[20 - A Call Stack]]** → Como a recursão afeta a pilha de chamadas ao dividir problemas.
    
- 📌 **[[15 - Algoritmos de Ordenação]]** → Exemplos como _quicksort_ e _mergesort_, que usam essa técnica.

## 🔥 Exemplo de Aplicação

#### 🚀 **Busca Binária**

Caso Base: Elemento encontrado ou array vazio.  
Caso Recursivo: Verificar se o valor está na metade superior ou inferior.

```js
function buscaBinaria(arr, item, low = 0, high = arr.length - 1) { 	
	if (low > high) return -1;  	
	
	const mid = Math.floor((low + high) / 2); 	
	const chute = arr[mid];  	
	
	if (chute === item) return mid; 	
	
	return (item < chute) ? buscaBinaria(arr, item, low, mid - 1) : buscaBinaria(arr, item, mid + 1, high); 
	
}
```
