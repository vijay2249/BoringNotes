
Initially the javascript engine goes through your code completely and registers your functions first, that is the reason that you can call the function and do the declaration part at the end of the script

And also the engine registers all the variables that are declared using the `var` keyword,  and it just registers them instead of assigning the value that we assigned (if any) while declaration.

This is called __Hoisting__ in [[JavaScript/Index.docs|JavaScript]]

So now when you try to access a var declared variable before declaring it you will get `undefined`

But if you try to access it when declared with `let` or `const` you will get error

```javascript
console.log(name) //undefined

var name = 'nail'
```

```javascript
console.log(name) //error saying variable name is not initialized

let name = 'harry'
```

