
Deno is a command line program 

> Deno can grab the scripts from multiple sources, a filename, a url, and '-' to read the file from stdin

```bash
deno run main.ts
deno run https://domain.com/main.ts
cat main.ts | deno run -
```



> Anything passed after the `script name` will be passed as a script argument and not consumed as a Deno `runtime flag`

-> Example
```bash
#Accepted, we grant net permission to file.ts
deno run --allow-net file.ts

#not accepted, --allow-net was passed to Deno.args, throws a net permission error
deno run file.ts --allow-net
```

Similarly for more info about permissions and cache process and performing in watch mode
	-> [Official Docs](https://deno.land/manual@v1.36.2/getting_started/command_line_interface)


Since #Deno  has support for [[TypeScript/Index.docs|TypeScript]], you can customize the built-in #Typescript compiler, formatter and linter.

The configuration file supports `.json` and `.jsonc` extensions.

Since v1.18, Deno will automatically detect a `deno.json` or `deno.jsonc` configuration file if its in your current working directory or parent directories. Else you can also use `--config` flag to specify different configuration file.

___
#### Imports and Scopes

Since v1.30, `deno.json` configuration file acts as an _[import map](https://deno.land/manual@v1.36.2/basics/import_maps)_ for resolving bare specifiers

Example: of `deno.json` config file
```json
{
	"imports":{
		"std/": "https://deno.land/std@0.199.0/"
	},
	"tasks":{
		"dev": "deno run --watch main.ts"
	}
}
```

Say `main.ts` script be
```typescript
import { assertEquals } from "std/assert/mod.ts";
assertEquals(1,2);
```

-> The top-level `deno.json` option `importMap` along with the `--importmap` flag can be used to specify the import map in other files.

---

#### Deno Native frameworks/tools/libraries

1. [Fresh](https://fresh.deno.dev/)
	1.  It uses a model where you send no JavaScript to clients by default
2. [Aleph](https://alephjs.org/docs/get-started)
3. [Ultra](https://ultrajs.dev/)
4. [Lume](https://lume.land/)
5. [Oak](https://deno.land/x/oak)

All the above mentioned frameworks have their advantages and tackle the problems that some failed to solve.

More info -> [here](https://deno.land/manual@v1.36.2/getting_started/web_frameworks)

Let's Being -> [[Basics]]
