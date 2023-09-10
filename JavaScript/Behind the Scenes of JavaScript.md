
How it works?

The weird part of ES5 vs ES6+?

---

`var` allows variables to be used in functional and global scopes

`let` and `const` uses a concept called block scope 

Using the `let` keyword, javascript simply shadows the global variables if the global variable and the local variable have the same variable name

```javascript
let name = "dummy"

function hi(){ 
	let age = 90;
	let name = "Harry"
	console.log(name, age) //prints Harry, 90
}

console.log(name) //prints dummy
```

```javascript
let name = "nail"
let name = "zyan"

console.log(name) //this thowrs error saying same variable name declared again
```

But by using var javascript wont throw this error
```javascript
let name = "harry"
let name = "liam"
console.log(name) //prints liam
```

Consider this example for strange behavior of `var`
```javascript
var name = "louis"
if(name === 'louis'){
	var hobbies = ['football']
	console.log(hobbies) //prints the array ['football']
}

function greet(){
	var age = 24;
	var name = "zyan"
	console.log(name, age) //prints zyan 24
}

console.log(name, hobbies) //prints louis, ['football']

greet()
```
This means that other than function declared variables, if the variable is declared with `var` keyword, then it will be considered as a global variable

But in the above code snippet, if you try to create the hobbies variable with `let` keyword, and execute the script, you will get an error on at `console.log(name, hobbies)` this line, saying hobbies variable is not defined

---

[[JavaScript/Hoisting|Hoisting]]
