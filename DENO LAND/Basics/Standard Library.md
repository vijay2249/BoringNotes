Standard library is available at: [https://deno.land/std@0.199.0](https://deno.land/std@0.199.0)

---
### Versioning and stability

Since the standard library version changes, it is preferred to use the version number in the remote import libraries in the scripts

```typescript
//should avoid this
import {copy} from "https://deno.land/std/fs/copy.ts";
```

```typescript
//follow this instead
import {copy} from "https://deno.land/std@0.199.0/fs/copy.ts";
```

---

[[Imports]]
