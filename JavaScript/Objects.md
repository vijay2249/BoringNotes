
---

#### Basics

----

#### Checking for property Existance

We can check whether a property exists by verifying the value of that particular property aganist `undefined` datatype
```javascript
obj = {
	name: "harry",
	age: 33
}

if(obj.hobbies === undefined){
	console.log("There is no hobbies property on object obj")
}
```

Or use the `in` keyword to check it.
```javascript
for(key in obj){
	console.log(key, obj[key])
}

if('hobbies' in obj){
	console.log(obj[hobbies])
}else{
	console.log("there is no hobbies property on object obj")
}
```

---

Lets learn about _[[this in javascript|this in javascript]]_ 