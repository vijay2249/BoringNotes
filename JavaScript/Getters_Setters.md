
For validating the user input, we can do what is known as #getters and #setters 

These are for validating the user input and then storing it in a variable ( #setter ) and how to retrieve the value ( #getters )

```javascript
const movie = {
	info: {
		set title(value){
			if(value.trim() === ""){
				this._title="DEFAULT_VALUE";
				return;
			}
			this._title = value
		},
		get title(){
			return this._title
		}
	}
}

movie.info.title = "Gran Turismo"
```

---

[[JavaScript/OOP/OOP in JS|OOP in JS]]
