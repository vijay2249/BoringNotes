
### Deno.env

-> Deno runtime offers built-in support for environment variables with <font color='blue'>deno.json</font>

-> `Deno.env` has getter and setter methods
```env
Deno.env.set("FIREBASE_API_KEY", "API_KEY");
Deno.env.set("DOMAIN", "DOMAIN_URL");

console.log(Deno.env.get("FIREBASE_API_KEY"));
console.log(Deno.env.has("DOMAIN"));
```

---

### .env
You can also put environment variables in `.env` file and retrieve them using `dotenv` in the standard library

`.env`
```env
PASS=howdy
```

`app.ts`
```javascript
import {load} from "https://deno.land/std/dotenv/mod.ts";

const env = await load();
const password = env['PASS'];

console.log(password);
```

---

### std/flags

Deno standard library has a `std/flags` module for parsing command line arguments

---

[[DENO LAND/Basics/Testing|Testing]]
