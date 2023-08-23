
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
