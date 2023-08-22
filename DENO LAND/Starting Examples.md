
> Deno is a runtime for JavaScript/TypeScript which tries to be web compatible and use modern features wherever possible.


> Deno also has the ability to execute scripts from the URLs mentioned.


```typescript
console.log("hi there!");
```

Save the snippet code into a file say `first.ts` file

Execute the script using the command
```bash
deno run first.ts
```

You can see the output in the terminal

`For reference i am currently using the same deno environment in docker container..`

---
#### #Deno_Http_Requests

You can also make HTTP requests

```typescript
const res = await fetch("https://deno.com");
const body = await res.text();
console.log(body);
```

See that the top level await also implemented without using any async keyword.

When you run the above code snippet initially you get this warning message

![[Deno-network-warning.png]]
Follow the steps whatever you want to give the script access to net

---
[Deno API docs](https://deno.land/api@v1.36.2)

---
#### #Deno_File_Reading

Also #Deno_File_API 

```typescript
const filenames = Deno.args;
for (const filename of filenames) {
  const file = await Deno.open(filename);
  await file.readable.pipeTo(Deno.stdout.writable, { preventClose: true });
}
```

Now run the program with the flag `--allow-read` 
Execute the below command to run the script (I saved the file as `files.ts`)
```bash
ls > ls.txt
whoami > current_user.txt
deno run --allow-read files.ts ls.txt current_user.txt
```

The Two commands before the deno command is to make sure that there is something to work like some files that are created on the fly so that we can see the actual output from the deno file execution

---

#### #Deno_Http_Server

[[DENO LAND/http_server.ts]]

---

