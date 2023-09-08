
[[JavaScript/Index.docs|JavaScript]] is like subset of [[TypeScript]] if you know it.

But to learn [[TypeScript]] you first need to learn [[JavaScript/Index.docs|JavaScript]] (Don't worry too much about #Typescript  for now :) )


#JavaScript is a #dynamic, #weakly_typed programming language which is #compiled_at_runtime

JavaScript is #Interpreted language, which means it is "on the fly" compiled language

It can be executed as part of webpage in a browser or directly on any machine("host environment")

> Javascript is totally independent from #Java and has nothing in common with #Java 

Files that have #JavaScript code written inside it, will have `.js` extension

---

### How is JavaScript Executed

First you have your code which have some effects on a webpage

Now in between these two steps there lies an engine - JavaScript engine
This is different in different browsers, like google chrome uses V8 engine and Firefox uses SpiderMonkey - these engines are built into the browser

On the fly, these engines 
	1. Parse your code
	2. Then compile to Machine code
	3. Then Execute the Machine Code
	4. Then when the code is executed we have the effect on the web page

There are lot of optimizations that these engines uses but currently they are not necessary to understand.

Now all this happens on a single [[Threads|thread]] 

---

>JavaScript is `Dynamic, interpreted, weakly typed` programming language


[[JavaScript/Basics/DataTypes_Variables|DataTypes_Variables]]
