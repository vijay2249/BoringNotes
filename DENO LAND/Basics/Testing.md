
>Deno has a built-in test runner that you can use for testing JavaScript or TypeScript code.

Lets start with an example
`all_tests.js`
```javascript
import {assertEquals} from "https://deno.land/std@0.199.0/assert/mod.ts";

Deno.test("url test", ()=>{
	const url = new URL("./foo.js", "https://deno.land")
	assertEquals(url.href, "htts://deno.land/foo.js");
})
```

```bash
deno test all_tests.js
```

---

"Deno.test" function takes two parameters, 
	1. Test name
	2.  Callback function to execute

We can specify extra configurations as a new parameter in json format
`deno.json`
```json
{
	"imports":{
		"assertTest" : "https://deno.land/std@0.199.0/assert/mod.ts",
		"asyncTest" : "https://deno.land/std@0.199.0/async/delay.ts",
		"Postgres" : "https://deno.land/x/postgres@v0.15.0/mod.ts",
	}
}
```
`tests.js`
```javascript
import {assertEquals} from "assertTest";

Deno.test("hi there #1", ()=>{
	const s = 1+2;
	assertEquals(x, 3);
});

// Compact form: named function.
Deno.test(function helloWorld3() {
  const x = 1 + 2;
  assertEquals(x, 3);
});

// Longer form: test definition.
Deno.test({
  name: "hello world #2",
  fn: () => {
    const x = 1 + 2;
    assertEquals(x, 3);
  },
});

// Similar to compact form, with additional configuration as a second argument.
Deno.test("hello world #4", { permissions: { read: true } }, () => {
  const x = 1 + 2;
  assertEquals(x, 3);
});

// Similar to longer form, with test function as a second argument.
Deno.test(
  { name: "hello world #5", permissions: { read: true } },
  () => {
    const x = 1 + 2;
    assertEquals(x, 3);
  },
);

// Similar to longer form, with a named test function as a second argument.
Deno.test({ permissions: { read: true } }, function helloWorld6() {
  const x = 1 + 2;
  assertEquals(x, 3);
});
```

---
#### Async Testing
```javascript
import {delay} from "asyncTest";

Deno.test("async test", async () =>{
	const x = 1+2;
	await deplay(100);
	if(x !== 3) throw Error("X should be 3");
});
```

---
### Test Example

```typescript
import { assertEquals } from "assertTest";
import { Client } from "Postgres";

interface User {
  id: number;
  name: string;
}

interface Book {
  id: number;
  title: string;
}

Deno.test("database", async (t) => {
  const client = new Client({
    user: "user",
    database: "test",
    hostname: "localhost",
    port: 5432,
  });
  await client.connect();

  // provide a step name and function
  await t.step("insert user", async () => {
    const users = await client.queryObject<User>(
      "INSERT INTO users (name) VALUES ('Deno') RETURNING *",
    );
    assertEquals(users.rows.length, 1);
    assertEquals(users.rows[0].name, "Deno");
  });

  // or provide a test definition
  await t.step({
    name: "insert book",
    fn: async () => {
      const books = await client.queryObject<Book>(
        "INSERT INTO books (name) VALUES ('The Deno Manual') RETURNING *",
      );
      assertEquals(books.rows.length, 1);
      assertEquals(books.rows[0].title, "The Deno Manual");
    },
    ignore: false,
    // these default to the parent test or step's value
    sanitizeOps: true,
    sanitizeResources: true,
    sanitizeExit: true,
  });

  // nested steps are also supported
  await t.step("update and delete", async (t) => {
    await t.step("update", () => {
      // even though this test throws, the outer promise does not reject
      // and the next test step will run
      throw new Error("Fail.");
    });

    await t.step("delete", () => {
      // ...etc...
    });
  });

  // steps return a value saying if they ran or not
  const testRan = await t.step({
    name: "copy books",
    fn: () => {
      // ...etc...
    },
    ignore: true, // was ignored, so will return `false`
  });

  // steps can be run concurrently if sanitizers are disabled on sibling steps
  const testCases = [1, 2, 3];
  await Promise.all(testCases.map((testCase) =>
    t.step({
      name: `case ${testCase}`,
      fn: async () => {
        // ...etc...
      },
      sanitizeOps: false,
      sanitizeResources: false,
      sanitizeExit: false,
    })
  ));

  client.end();
});
```

Example output:
```
test database ...
  test insert user ... ok (2ms)
  test insert book ... ok (14ms)
  test update and delete ...
    test update ... FAILED (17ms)
      Error: Fail.
          at <stack trace omitted>
    test delete ... ok (19ms)
  FAILED (46ms)
  test copy books ... ignored (0ms)
  test case 1 ... ok (14ms)
  test case 2 ... ok (14ms)
  test case 3 ... ok (14ms)
FAILED (111ms)
```

>Test steps must be awaited before the parent test/step function resolves or you will get a runtime error
>Test steps cannot be run concurrently unless sanitizers on a sibling step or parent test are disabled
>If nesting steps, ensure you specify a parameter for the parent step

```typescript
Deno.test("test1", async ()=>{
	await t.step("s1", async () =>{
		await t.step("sub-step", ()=>{});
	});
});
```