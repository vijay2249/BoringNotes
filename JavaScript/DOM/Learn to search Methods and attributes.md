

Now there are more than you may need to know or even to work with, methods and functions available in `window` and `document` objects and even for all the known objects

Lets go through some common examples to understand some points
1. How to search for particular property or any method in an object
2. what might be common functionalities the object key might represent
3. What might the after effects of the api we can expect just from the name of the method of that element or node

* document.querySelector()
	* we are trying to select something from the HTML web page
	* obviously we have to provide some information for that method to return something
	* Now we pass some data and based on that data it will search for it and returns it.
	* Now the method is written in singular manner, so in general these methods return only one thing or in this case it will return only the first match with that of your input given the method as argument
* document.querySelectorAll()
	* Same context as document.querySelector()
	* Except that this is plural hence it will return multiple things say elements that match user input to that method, as the method says it will return all elements that match the user input
* Element.innerHTML
	* we are entering the element world, now we have to consider a single html element like \<p> or \<title> something like that
	* now innerHTML might represent the HTML data written inside that particular HTML element we are applying this method on
	* Example
	    ```html
	    <div>
		    <ul>
			    <li>One></li>
			    <li>Two</li>
			</ul>
		</div>
		```
	* In the above example applying that `innerHTML` method on _div_ return the below snippet
		```html
		<ul>
			<li>One</li>
			<li>Two</li>
		<ul>
		```
	* In the same manner if you apply same method on _li_ element (say first one) you will get
		```html
			One
		```
		Thats it, just the string between those html tags
		Technically the second snippet should not be HTML lang, it is returned as JavaScript string data type.

-> Say you want to add new html tag inside a particular tag, that then becomes the child of the selected HTML tag, now search in google for ===add/append/new child tag creation to element/node/html tag via javascript===

This is also a necessary Skill to learn => How to google Stuff.😜