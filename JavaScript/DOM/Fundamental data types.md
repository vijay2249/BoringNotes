_Note:_ __because the vast majority of the code that uses the DOM revolves around manipulating HTML documents, its common to refer to the nodes in the DOM as ===elements===, although strictly speaking note every node is an element__

| Data type (Interface) | Description                                                                                                                                                                                                                                              | References    |
| --------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------- |
| Document              | this object is the root document object itself.                                                                                                                                                                                                          | #document_dom |
| Node                  | every object located within a document is a node of some kind. An object can be element node but also a text node or attribute node                                                                                                                      | #node_dom     |
| Element               | the `element` type is based on #node_dom . It refers to an element or node of type #element_dom. `element` objects implement the DOM `Element` interface and also the more basic `Node` interface, both of which are included together in this reference | #element_dom  |
| NodeList              | #nodeList_dom is an array of elements, like the kind that is returned by the method `document.querySelectorAll()`                                                                                                                                        | #nodeList_dom |
| Attr                  | When an `attribute` is returned by a member, it is an object reference that exposes a special interface for attributes. Attributes are nodes in the DOM just like elements are                                                                           | #attr_dom     |
| NamedNodeMap          | It is like an array, but the items are accessed by name or index, though the latter case is merely a convenience for enumeration, as they are in no particular order in the list. This also has an `item()` method for this purpose and you can also add and remove items from a `namedNodeMap`                                                                                                                                                                                                                                                         | #namedNodeMap_dom               |

---

Now this is little confusing part to understand the interfaces of how the elements implements multiple or different interfaces, and can be helpful in understanding the datatypes of elements while writing code in [[TypeScript/Index.docs|TypeScript]] code

Consider table object, 
	1. implements a specialized `HTMLTableElement` interface, which includes such methods as `createCaption` and `insertRow`
	2. But since its also an HTML element, `table` implements the `Element` interface.
	3. Also since an HTML element is also, as far as DOM is concerned, a node in the tree of nodes, that make up the object model for an HTML or XML page, the table object also implements the more basic `Node` interface, from which the `Element` derives

Example by code
```javascript
const table = document.getElementById("table")
const tableAttrs = table.attributes; //Node/Element interface implementation

for(let i=0;i<tableAttrs.length;i++){
	if(tableAttrs[i].nodeName.toLowerCase() === "border"){ table.border = "1" }
	//HTMLTableElement interface -> border attribute
}

//HTMLTableElement interface
table.summary = "Note, increased border size";
```
---

[[JavaScript/DOM/Learn to search Methods and attributes|Learn to search methods and attributes and understand them]]

---
`querySelector` uses a CSS selector and can match ANY elements(depending on provided selector), `getElementById` looks only for the ID provided.
