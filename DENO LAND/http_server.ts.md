```typescript
import { serve } from "https://deno.land/std@0.199.0/http/server.ts"; 
//import server function from deno standard library

const handler = async (_request: Request): Promise<Response> => {
  const resp = await fetch("https://api.github.com/users/denoland", {
    headers: {
      accept: "application/json",
    },
  });

  return new Response(resp.body, {
    status: resp.status,
    headers: {
      "content-type": "application/json",
    },
  });
};

serve(handler); //listen to all incoming requests
```

Just like in [[NodeJS]] , where you listen to every incoming request by the code line `app.listen($PORT)`

Here in #Deno you listen to every incoming connection via the `serve` function which is provided by deno library mentioned in the code snippet.

Now execute the command
```bash
deno run --allow-net http_server.ts &
```

The "&" symbol at the end it to make the process run in background in linux
Here in this I am using Deno in docker container running on linux base image, hence i have a single terminal and need to make this process to run in background so that i can make curl requests

Once the process is running in the background, now install the curl tool in the docker running container using the command `apt-get install curl -y`

Now run the command
```bash
curl http://localhost:8000
```

Now this returns #JSON data which is a response from the DENO [[Github]] page

---
#### Side notes
-> The Deno docker image do not contain any tools that we are using like `curl` and also for file editing and all I installed `vim` editor again which does not come by default by Deno docker image.

[[DENO - CLI]]
