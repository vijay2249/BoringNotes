
Technically we can write our [[JavaScript/Index.docs|JavaScript]] code in the [[HTML]] file itself under #script_tag 

But as our #JavaScript code gets big, it becomes hard for debug issues and all
Hence it is preferred to keep javascript code completely separate to that of HTML

---
But how can we let our HTML file know that it needs to load our JS file also.

For that we need to add #script_tag in html file, (where to add and all more info, for now refer online docs) in addition to the JS file path in the "src" attribute to the #script_tag 

---

## Variables and Constants

```javascript
let variable = value;
//let<keyword> <variableName> = <valueOfVariable>
```

For creating a variable, the keyword that you can use to create this variable are `let`, `const`, `var`

If you use `const` the value of that variable is constant, and cannot be changed in your code at all cost, else it will throw you error

`let` variables and `var` variables can be changed in your code

> It is preferred to use `camelCase` while naming a variable in JavaScript, and it is case sensitive language

### Variable Naming conventions and rules

1. Best practice is to use `camelCasing` while assigning the names to the variables
2. Only allowed are alpha-numeric characters
3. Also variables can start with `$` sign and `_` (underscore)

### Bad Practices
1. using snake casing while naming variables
2. starting with digits is not allowed
3. there should not be any special characters in the variable names
4. keywords that are predefined are not allowed to use them as variables

To specify the end of line in javascript you just add a semicolon (;) at the end of statement, but in javascript this semicolon is somewhat optional, you will code that sometimes have this semicolon to end the statements and sometimes you wont find it.

---
In JavaScript, you can actually use single quotes or double quotes for specifying strings and characters.

---

- In JavaScript if you are referring a variable then the variable should be declared first even before referencing it.
- But the condition doesn't hold the same for functions, you can reference a function at the top of your code and declare the function body at the bottom of your code, that still works fine.


---
[[JavaScript/Basics/Null-Undefined-NaN|Null-Undefined-NaN]]
