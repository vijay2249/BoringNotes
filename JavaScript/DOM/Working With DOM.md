
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

---

#### Element 
`Element` is the most general base class from which all element objects(i.e objects that represent elements) in a `document` inherit.
It only has methods and properties common to all kinds of elements 

_Example_: the `HTMLElement` interface is the base interface for HTML elements, while the `SVGElement` interface is the basis or all SVG elements. Most functionally is specified further down the class hierarchy.

#### Node
The [DOM](https://developer.mozilla.org/en-US/docs/Glossary/DOM) __Node__ interface is an abstract base class upon which many other DOM API objects are based, thus letting those object types to be used similarly and often interchangeably. As an abstract class, there is no such thing as plain `Node` object.

All objects that implement `Node` functionality are based on one of its subclasses. Most notable are `Document`, `Element`, `DocumentFragment`

In some cases, a particular feature of the base `Node` interface may not apply to one of its child interfaces, in that case the inheriting node may return `null` or throw an exception, depending on circumstances
_For example_: attempting to add children to a node type that cannot have children will throw an exception

```javascript
// Recurse through child nodes
function eachNode(rootNode, callback){
	if(!callback){
		const nodes = []
		eachNode(rootNode, (node)=>{
			nodes.push(node)
		})
		return nodes;
	}

	if(callback(rootNode) === false) return false;

	if(rootNode.hasChildNodes()){
		for(const node of rootNode.childNodes){
			if(eachNode(node, callback) === false) return
		}
	}
}

/*
this function recursively calls a function for each descendant node of `rootNode` including the root node


*/
```