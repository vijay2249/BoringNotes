
Functions themselves in JavaScript are considered as Objects 

Function in the end whist having its own type is an Object
Its basically also an object, a special type of object with special pre-configured properties 

__Functions are Objects__

---
### Spread Operator

The __spread ( ... )__ syntax allows an iterable, such as an array or string, to be expanded in places where zero or more arguments for functions calls especially or elements for array literals are expected.

In an object literal, the spread syntax enumerates the properties of an object and adds the key-value pairs to the object being created

```javascript
function sum(x,y,z){
	return x + y + z
}

const numbers = [1,2,3]

console.log(sum(...numbers)) //expected 6

console.log(sum.apply(null, numbers)) //expected 6

//some use cases

newFunction(a, ...iterableObj, b) //-> function arguments

[1, ...newObject, 4, false, "Hello there"] // -> array literals

{...prevObject, ...prevArray, key: 'value'} // -> object literals
```

Only iterable objects like `Array` can be spread in array and function parameters.
Many objects are not iterable, including all plain objects that lack a `Symbol.iterator` method

```javascript
const obj = {key1: "value"}
const array = [...obj] //TypeError: obj is not iterable
```

> When using spread syntax for function calls, be aware of the possibility of exceeding the JavaScript engine's argument length limit -> for reference call - `Function.prototype.apply()`


---
### Rest Parameters

The __Rest parameter__ syntax allows a function to accept an indefinite number of arguments as an array, providing a way to represent a function which accepts multiple number of arguments in JavaScript

```javascript
function sum(...theArgs){
	let total = 0
	for(const arg of theArgs){ total += arg }
	return total;
}

console.log(sum(1,2,3)) //expected 6
console.log(sum(1,2,3,4,5,6,6)) //expected 27
```

> A function definitions last parameter can be prefixed with `...` which will cause all remaining parameters to the placed within an array object


> Rest parameter must be last formal parameter in a function arguments


`arguments` is a keyword in javascript, you can use it inside of functions but only inside of functions that use function keyword and it gives you an array-like object, with all the arguments this function receives 

---

### Callback Function

> It is a function passed into another function as an argument, which is then invoked inside the outer function to complete some kind of routing or action


_The consumer of a callback-based API writes a function that passes into the API. The provider of the API(called the caller) takes the function and calls back the function at some point inside the callers body. The caller is responsible for passing the right parameters into the callback function. The caller may also expect a particular return value from the callback function, which is used to instruct further behavior of the caller_

-> Examples of synchronous callbacks include the callbacks passed to `Array.prototype.map()`, `Array.prototype.forEach()`
-> Examples of asynchronous callbacks include the callbacks passed to `setTimeout()`, `Promise.prototype.item()`([[JavaScript/Promises|Promises]])

---
### Function.bind()


The `bind()` function creates a new bound function. Calling the bound function generally results in execution of the function it wraps, which is also called the _target_ function.

The bound function will store the parameters passed -- which include the value of `this` and the first few arguments -- as its internal state. These values are stored in advance, instead of being passed at call time.

You can generally see `fn.bind(this, arg1, arg2)` as being equivalent to `const bnFn = (...restArgs) => fn.call(this, arg1, arg2, ...restArgs)` for the effect when its called (but now when bnFn is constructed)

```javascript
function log(...args){
	console.log(this, ...args)
}

const boungLog = log.bind("this value: ", 1,2)
const boundLog2 = boundLog.bind("new this value: ", 3, 4);

boundLog2(5,6)) //"this value", 1, 2, 3, 4, 5, 6
```

---

Let the fun begin

_Starting with_ [[What is DOM|What is DOM]]

[[JavaScript/DOM/Working With DOM|Working With DOM]]
