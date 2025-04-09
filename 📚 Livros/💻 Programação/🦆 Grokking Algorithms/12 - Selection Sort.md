## 🔹O que é? 

O selection sort é um [[00 - Algoritmos|Algoritmo]] de ordenação, ele basicamente recebe um [[10 - Arrays]] ou [[11 - Listas]] e cria outra, toda iteração ele passa selecionando o maior ou menor elemento e o inserindo na lista auxiliar, ao completar ele passa pela lista novamente até que ela esteja vazia.

Sua [[02 - Complexidade de algoritmos|Complexidade]] é de [[07 - Complexidade n^2|O(n^2)]].

> Você pode achar que seria O(n x 1/2 x n) já que toda vez que passa você retira um elemento da lista, tendo a média como 1/2, mas como 1/2 é uma constante ela não aparece no [[03 - Big O Notation|Big O]]

## ⚡Exemplo de código:

```javascript title="Função para achar o maior elemento"
function pegarMaiorElemento(arr){
	let maior = arr[0];
	let maiorIndex = 0;
	for (let i = 0; i < arr.length; i++){
		if (arr[i] > maior){
			maior = arr[i];
			maiorIndex = i;
		}
	}
	return maiorIndex;
}
```

```javascript title="Selection Sort"

function selectionSort(){
	let arrayOrdenado;
	let array = [10, 24, 65, 0, 2, 6];
	
	for (let i = 0; i < array.length; i++){
		let maiorIndex = pegarMaiorElemento(array);
		arrayOrdenado.push(array[maiorIndex]);
		array.splice(maiorIndex, 1);
	}
	
	return arrayOrdenado;
}

```