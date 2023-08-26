
### Reloading Modules

By default, a module in the cache will be reused without fetching or re-compiling it

You can invalidate your local `DENO_DIR` cache using the `--reload` flag of the `deno cache` subcommand

##### Usage
```bash
# to realod all the modules
deno cache --reload modules.ts 
```

```bash
deno cache --realod=https://deno.land/std@0.199.0 module.ts

# reload all /0.199.0 standard modules

# to reload specific modules, use a comma to separate URLs or modules
```

---

### Integrity

-> Lets say your module depends on a remote module. When you compile your module for the first time , that remote module is retrieved, compiled and cached.

-> It will remain this way until you run your module on a new machine or reload the cache(through `deno cache --reload` for example)

-> Here the problem arises when this remote module code changes, #Deno solution to avoid this is to use integrity checking and lock files.

---
### Caching and Lock files

When a Deno configuration file is resolved then an additive lockfile will be automatically generated 
By default, the path of this lockfile will be `deno.lock`
You can change this path by updating your `deno.json` to specify the below code snippet
```json
{
	"lock": "./lock.file"
}
```

#### Using `--lock` and `--lock-write` flags
A typical workflow will look like this:
`src/deps.ts`
```typescript
export {xyz} from "https://unpkg.com/xyz-lib@v0.9.0/lib.ts";
```

Then
```bash
deno cache --lock=deno.lock --lock-write src/deps.ts

git add -u deno.lock
git commit -m "commit-msg"
git push
# this is to add this cache and the lock config to all your project env


# new system for project env have to run the below commands
deno cache --reload --lock=deno.lock src/deps.ts

deno test --allow-read src
```

---
### Runtime Verification

Like caching, you can also lock files during the use of the `deno run` sub command, validating the integrity of any locked modules during the run

This only validates against dependencies previously added to the lock file
```bash
deno run --lock=deno.lock --cached-only mod.ts
# this makes sure that remote dependencies are also verified.
```
The above command will fail if there are any dependencies in the dependency tree for mod.ts which are not yet cached.

---
---
---

## Proxies

-> Deno supports proxies for module downloads

-> Proxy configuration is read from environmental variables, `HTTP_PROXY`, `HTTPS_PROXY`, `NO_PROXY`

-> In case of #Windows, if environment variables are not found #Deno falls back to reading proxies from registry

---
---
---


## Private Modules

-> Deno provides a way to download private modules using what's called ===BEARER TOKENS===

===Bearer tokens=== are the predominant type of access token used with OAuth 2.0 and are broadly supported by hosting services like [[Git and Github/Github | Github]], #Gitlab 

[[DENO LAND/Module_1/Standard Library| Standard Libraries]]


