
### What is DOM?

>DOM - Document Object Model

![[JavaScript/Images/Browser_Redering_and_DOM.png|]]

How the browser loads the code(html) and exposes API for usage

`DOM is not strictly tied to browsers! There are other tools that can parse HTML code`

Once the HTML code is loaded into the browser, the browser provides two global javascript objects for developer (in some cases user) for usage and manipulating the code on the fly and to react to changes via JavaScript

1. _document_
	1. This is the top most entry point to get access to all the rendered HTML code in the browser
	2. provides access to element querying, DOM content etc..
2. _window_
	1. This contains `document` as one of the property
	2. This is top of the `document` object
	3. This reflects the active browser window/tab
	4. Acts as a global storage for script, also provides access to window-specific properties and methods

When you are writing your JavaScript code you by default have the access to this _window_ object

Example:
```javascript
alert("This is a pop-up") //the default function to alert the user written in js

//but the actual call that is happening behind the scenes is
window.alert("This is a pop-up") 

//this gives access to the developer the methods and properties of window object automatically without any necessity of calling them using `window` keyword
```