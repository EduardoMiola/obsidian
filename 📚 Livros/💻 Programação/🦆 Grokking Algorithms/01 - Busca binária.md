- A busca binária divide uma lista ordenada pela metade repetidamente até encontrar o elemento desejado.
- [[02 - Complexidade de algoritmos|Complexidade]]: O(log N).
- Melhor quando aplicado a listas ordenadas.
- Recebe uma lista ordenada e o item a ser buscado.


## Links 

- [[02 - Complexidade de algoritmos]]
- [[05 - Complexidade log (n)]]

## Implementação 
```javascript title="Busca Binária"
function busca_binaria(listaOrdenada, item){
	let low = 0;
	let high = listaOrdenada.length - 1;

	while (low <= high){
		let mid = Math.floor((low + high) / 2);
		
		if ( listaOrdenada[mid] === item){
			return mid;
		} else if ( listaOrdenada[mid]  > item){
			high = mid - 1;
		} else {
			low = mid + 1;
		}
	}
	
	return null;
}


```