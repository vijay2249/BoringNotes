-> In order for #Deno to resolve a bare specifier like `react` or `"lodash"` , it needs to be told where to look for it, like its an internal module or a remote url module

[[NodeJS/Index.docs |NodeJS]] and [[NodeJS/NPM_Modules|npm]] use `package.json` and the `node_modules` folder to do this resolution.

[[DENO LAND/Index.docs|Deno]] on the other hand, uses the [import map](https://github.com/WICG/import-maps) standard

##### Example
To make an the "lodash" import , we need to configure the `deno.json` file like
```json
{
	"imports": {
		"lodash": "https://esm.sh/lodash@4.17.21",
		"lodash_npm": "npm:lodash@4.17",
	}
}
```

-> The `deno.json` file is auto-discovered and acts as an import map in your deno projects.
Now in you project files you can import in this manner
```typescript
import {lodash} from "lodash";
import _ from "lodash_npm"
```
( In the above code snippet both are same modules, this is to show how you can import npm modules and remote modules from deno.json config file )

---

#### Overriding Imports
-> The situation where import maps can be very useful is to override imports in specific modules

-> Lets say you want to override the deno_std import from 0.177.0 to the latest in all of your imported modules, but for the `https://deno.land/x/example/` module you want to use files in a local `patched` directory
-> You can do this by using a scope in the import map that looks something like this:
```json
{
	"imports":{
		"https://deno.land/std@0.177.0/": "https://deno.land/std@0.199.0/"
	},
	"scopes":{
		"https://deno.land/x/example/":{
			"https://deno.land/std@0.177.0/": "./patched/"
		}
	}
}
```


> *Important* => The import map configuration files are only applied for Deno applications, not in the various libraries that your application code may import.

---
[[DENO LAND/Module_1/Permissions |Permissions]]

