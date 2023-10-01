

#### Feature Highlights

- Provides web platform functionality and adopts web platform standards
- Secure by default
	- No file, network or environment access unless explicitly specified.
- Supports [[TypeScript/Index.docs | Typescript]]
- Ships a single executable ( #deno )
- Supports the use of existing #npm_modules 

---

#Deno explicitly takes on the role of both runtime and package manager
 It uses a standard browser-compatible protocol for loading modules: URLs.

---

Fetch and cache remote code upon first execution, and never update it until the code is run with the `--reload` flag.

Modules/files loaded from remote URLs are intended to be immutable and cacheable.

---

#### Installation Procedure

Follow the instructions [here](https://deno.land/manual@v1.36.2/getting_started/installation) - official deno website docs

---


#### Setup the environment

Most editors integrate directly into Deno using the **<font color='green'>Language Server Protocol</font>** and the _language server_ that is integrated into the Deno CLI.

**Any errors while using Deno extension in VSCode** -> follow these [instructions](https://deno.land/manual@v1.36.2/references/vscode_deno) - official deno website docs

---

[[DENO LAND/Starting Examples]]

[[Working with Deno]]

[[DENO LAND/Examples]]

