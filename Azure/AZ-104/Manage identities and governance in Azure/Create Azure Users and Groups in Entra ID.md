
- Add users to Entra ID
- Manage app and resource access by using Entra groups
- Give guest users access in Entra business to business (B2B)

---

In microsoft entra ID all user accounts are granted a set of default permissions. A users account access consists of the type of user, their role assignments, and their ownership of individual objects

Administrators have the highest level of access, followed by the member user accounts in entra organization. Guest users have the most restricted level of access.


### Permissions and roles

Entra ID uses permissions to help you control the access rights a user or group is granted. This is done through roles. Entra ID has many roles with different permissions attached to them. When a user is assigned a specific role, they inherit permissions from that role.


You can also delete user accounts, when you delete a user the account remains in a suspended state for 30 days. During that 30-day window the user account can be restored.

---

**Microsoft Entra roles**: use microsoft entra roles to manage entra id-related resources like users, groups, billing, licensing, application registration and more

**RBAC for azure resources**: use RBAC roles to manage to azure resources like virtual machines, etc..

---

In any scenario where external users need temporary or restricted access to your organization resources, give them guest user access.

By default, users and administrators in entra ID can invite guest users, but the global administrator can limit or disable this ability