4.1 - 
```javascript
function somaRecursiva(arr) {
	if (arr.length == 0) return 0;
	
	return arr[0] + somaRecursiva(arr.slice(1))
}
```
4.2 - 
```js
function contaRecursiva(list){
	if (list.next == null) return 1;
	
	return 1 + contaRecursiva(list.next);
}
```
4.3 -
```js
function numeroMax(list) {
	if (list.next == null) return list.value;
	
	let max = numeroMax(list.next);
	max = (list.value > max) ? list.value : max;  
	
	return max;
}
```
4.4 - Para a [[01 - Busca binária]] o caso base do divide and conquer vai ser quando o elemento da lista ordenada for igual ao elemento buscado, e o recursivo vai depender se o elemento é maior ou menor que o buscado, se for maior ele vai chamar a função com o array cortado do high - 1, se for menor vai cortar o array por baixo + 1.