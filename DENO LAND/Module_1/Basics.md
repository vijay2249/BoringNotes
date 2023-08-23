
___
### Modules

#### Imports and Exports
-> Basic definitions

-> #Deno adopts browser-like module resolution, meaning that the file names must be specified in full
-> You may not omit the file extension and there is no special handling of `index.js`
```typescript
import {add, multiply} from "./arithmetic.ts";
```

-> Local modules are imported in exactly the same way as remote modules


##### Example
 ===Local Import=== 
 `local.ts`
 ```typescript
 import {add, multiply} from "./arithmetic.ts";

 function totalCost(outbound: number, inbound: number, tax: number): number{
	 return multiply(add(outbound, inbound), tax);
 }

 console.log(totalCost(19, 31, 1.2));
```

===Remote Import===
`remote.ts`
```typescript
import {add, multiply} from "https://x.nest.land/ramda@0.27.0/source/index.js";

function totalCost(outbound: number, inbound: number, tax: number): number{
	return multiply(add(inbound, outbound), tax);
}

console.log(totalCost(19, 11, 2.1));
```

===Local Export===
`arithmetic.ts`
```typescript
export function add(a: number, b: number): number{
	return a+b;
}

export function multiply(a: number, b:number): number{
	return a*b;
}
```

> All functions, classes, constants and variables which need to be accessible inside external modules must be exported 

> Either by prepending them with the `export` keyword or including them in an export statement at the bottom of the file.


<font color="blue">Now instead of importing same functions from either local or remote modules in each file separately, you can import them all in a single file say `deps.ts` and then import the necessary functions in you necessary file by referencing the `deps.ts` file</font>

`deps.ts`
```typescript
export {
	assert, assertEquals, assertStringIncludes
} from "https://deno.land/std@0.199.0/assert/mod.ts";
```

`example.ts`
```typescript
import {assertEquals, runTests, test} from "./deps.ts";
```


---
**By using a lock file( with the `--lock` command line flag ), you can ensure that the code pulled from a URL is the same as it was during initial development.**
--> [Resource](https://deno.land/manual@v1.36.2/basics/modules/integrity_checking) - Official Deno Docs

---

[[DENO LAND/Module_1/Modules]]

