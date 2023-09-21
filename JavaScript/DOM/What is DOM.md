## What is the DOM?

-> The __Document Object Model__ ( #DOM ) is an #API that represents and interacts with any HTML or XML-based markup language document. 

-> The DOM is a document model loaded in the browser and representing the document as a [[Working With DOM#Node|node]] tree, or #DOM_tree, where each node represents part of the document.

-> The #DOM connects web pages to scripts or programming languages by representing the structure of a document - such as HTML representing a web page - in memory

-> The DOM represents a document with a logical tree. Each branch of the tree ends in a node, and each node contains objects. DOM methods allow programmatic access to the tree.

Simple Example
```javascript
const para = document.querySelectorAll('p')
//para[0] is the first <p> element
//para[1] is the second <p> element
alert(para[0].nodeName)
```

-> The core #DOM defines the entities describing any document and the objects within it. This is expanded upon as needed by other APIs that add new features and capabilities to the DOM


---

## HTML DOM

A document containing HTML is described using the `document` interface, which is extended by the HTML specification to include various HTML-specific features. In particular, the `Element` interface is enhanced to become `HTMLElement` and various subclasses, each representing one of elements

---

## DOM and [[JavaScript/index.docs|JavaScript]] 

=> The document as a whole, the head, tables within the document, table headers, text within the table cells and all other elements in a document are parts of the document object model for that object.

=> They can all be accessed and manipulated using the DOM and a scripting language like Javascript

>DOM was designed to be independent of any particular programming language, making the structural representation of the document available from a single, consistent API

> Even if most web developers will only use the DOM through JavaScript, implementations of the DOM can be built for any language, 

```python
import xml.dom.minidom as dom

doc = dom.parse(r"C:\Projects\Py\chap1.xml")
doc.nodeName #DOM property of document object

p_list = doc.getElementsByTagName("para")
```

---

## Accessing the #DOM 

When you create a script, whether inline in a `<script>` element or included in the web page, you can immediately begin using the API for the `document` or `window` objects to manipulate the document itself, or any of the various elements in the web page(the descendant elements of the document).

__It is generally not recommended to mix the structure of the page( written in HTML) and manipulation of the DOM (written in JavaScript)__

---

[[JavaScript/DOM/Fundamental data types|Fundamental data types - DOM]]
