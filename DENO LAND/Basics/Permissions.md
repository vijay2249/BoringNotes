
===Unless you specifically enable it, a program run with Deno has no file, network, or environment access.===

```bash
deno run --allow-read mod.ts
```
The above command gives only read access to the file system. It cannot write to the file system, or perform any other security sensitive functions

There are officially lot of permissions that you can set or give. Go to [official docs](https://deno.land/manual@v1.36.2/basics/permissions) for more information about usage and more.

---
Additionally you can also restrict permissions for file system and network and environment

> Windows users: Environment variables are case insensitive on windows, so Deno also matches them case insensitively


These are the permission list that as a developer that you can control your script
1. File System Access
2. Network Access
3. Environment Variables
4. Subprocess Permissions

[[Connecting to Database|Database Connections]]
