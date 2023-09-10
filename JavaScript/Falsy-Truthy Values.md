
Its just how javascript evaluates the true and false values under-the-hood

[[JavaScript/Index.docs|JavaScript]] tries to convert a value to a boolean if it doesn't get a boolean comparison and also not a boolean itself

---

Input value of "0" is considered as False/Falsy
Any other number is considered as True/Truthy
Empty String is considered as False/Falsy
Any other strings are considered True/Truthy
All objects and arrays even they are empty are considered True/Truthy
Null, Undefined, NaN are considered as False/Falsy

---

```javascript
let userInput = "Harry"
if(userInput){
	//this code will execute because 'Max' is truthy value
}
```

JavaScript tries to coerce(`convert without really converting`) the value you pass to it(or other places where conditions are required) to boolean values.

That means that it tires to interpret `Max` as boolean - ad there it follows the rules outlined as mentioned above.

-> JavaScript doesn't really convert the value of the variable though

```javascript
if(userInput){}
```
the above snippet basically transformed to (bts)
```javascript
if(userInput === true){}
```