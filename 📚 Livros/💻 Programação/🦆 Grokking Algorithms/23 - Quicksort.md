## O que é?

Quicksort é um [[15 - Algoritmos de Ordenação|Algoritmo de Ordenação]], ele é muito mais rápido que o selection sort e é usado frequentemente na vida real. 

- Ele usa [[22 - Divide and Conquer|Divide and Conquer]].

## Caso base:

O caso base de quase todos algoritmos de ordenação são arrays vazios ou arrays com um elemento só, ou seja, [[10 - Arrays|Arrays]] que não precisam ser ordenados.

```js
function quickSort(array) {
	if (arr.length < 2) return array;
}
```

## Caso recursivo:

- **Escolher um pivô** (geralmente o primeiro, último ou um aleatório).
    
- **Dividir o array** em dois subarrays:
    
    - 🔹 Um com os elementos **menores ou iguais** ao pivô.
        
    - 🔹 Outro com os elementos **maiores** que o pivô.
    
- **Chamar [[21 - Recursão|recursivamente]] o _Quicksort_** nesses dois subarrays.
    
- **Juntar os resultados** (menores ordenados + pivô + maiores ordenados).

## Código do quicksort:

```js
function quickSort(array){
	if (array.length < 2) return array;
	const pivot = array[0];
	
	arrayMenores = array.slice(1).filter((elemento) => elemento <= pivot);
	arrayMaiores = array.slice(1).filter((elemento) => elemento > pivot);
	
	return [...quickSort(arrayMenores) + pivot + ...quickSort(arrayMaiores)]
}
```