
All the third-party modules are at [deno.land/x](https://deno.land/x).

### MySQL
```typescript
import {Client} from "https://deno.land/x/mysql/mod.ts";

const client = await new Client().connect({
	hostname: "127.0.0.1",
	username: "root",
	db: "users",
	password: "pass",
});
```

### Postgres
```javascript
import postgres from "https://deno.land/x/postgresjs/mod.ts";

const sql = postgres("postgres://username:password@host:port/database");
```

### MongoDB
```javascript
import {MongoClient} from "https://deno.land/x/mongo@<LatestVersion>/mod.ts";

const client = new MongoClient();

await client.connect("mongodb://127.0.0.1:27017/");

await client.connect({
	db: "database_name",
	tls: true,
	servers: [
		{
			host: "db_cluster_url",
			port: ports_as_numbers,
		},
	],
	credential: {
		username: "username",
		password: "password",
		db: "db_name",
		mechanism: "SCRAM-SHA-1",
	},
});

await client.connect("mongodb+srv://<username>:<password>@<clusterURL>/<db_name>?authMechanism=SCRAM-SHA-1");
```

### Firebase
```javascript
import { initializeApp } from "https://www.gstatic.com/firebasejs/9.8.1/firebase-app.js";
import { getAuth } from "https://www.gstatic.com/firebasejs/9.8.1/firebase-auth.js";

import {
  addDoc, collection, connectFirestoreEmulator, deleteDoc, doc, Firestore,
  getDoc, getDocs, getFirestore, query, QuerySnapshot, setDoc, where,
} from "https://www.gstatic.com/firebasejs/9.8.1/firebase-firestore.js";


const app = initializeApp({
  apiKey: Deno.env.get("FIREBASE_API_KEY"),
  authDomain: Deno.env.get("FIREBASE_AUTH_DOMAIN"),
  projectId: Deno.env.get("FIREBASE_PROJECT_ID"),
  storageBucket: Deno.env.get("FIREBASE_STORAGE_BUCKET"),
  messagingSenderId: Deno.env.get("FIREBASE_MESSING_SENDER_ID"),
  appId: Deno.env.get("FIREBASE_APP_ID"),
  measurementId: Deno.env.get("FIREBASE_MEASUREMENT_ID"),
});

const db = getFirestore(app);
const auth = getAuth(app);
```

For more and different types of database connection - refer - [official docs](https://deno.land/manual@v1.36.2/basics/connecting_to_databases)

