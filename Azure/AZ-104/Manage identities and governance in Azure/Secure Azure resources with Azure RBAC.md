
- verify access to resources for yourself and others
- Grant access to resources
- View activity logs of Azure RBAC changes

---

### Azure Subscriptions

Each azure subscription is associated with a singe microsoft entra directory. Users, groups and applications in that directory can manage resources in the azure subscription.

![[azure-RBAC.png]]

Azure RBAC in azure portal - in several areas in the azure portal, you will see a pane named **Access Control (IAM)**, also known as _identity and access management_

---

### How does RBAC work

You can control access to resources using Azure RBAC by creating role assignments, which control how permissions are enforced.

To create a role assignment, you need three elements
1. Security principal( who )
	1. aka user, group, or application to which you want to grant access
2. Role definition( what )
	1. collection of permissions. It lists the permissions the role can perform such as read, write, and delete. Roles can be high like Owner or specific like Virtual Machine contributor
3. Scope( where )
	1. the level where the access applies. This is helpful if you want to make someone a website contributor but only for one resource group.


In azure you can specify a scope at multiple levels, Scopes are structured in a parent-child relationship. When you grant access at a parent scope, those permissions are inherited by the child scopes.

---

### Azure RBAC is an allow model

Azure RBAC is and _allow_ model, which means that when you are assigned a role, Azure RBAC allows you to perform certain actions, such as read, write, or delete. So if one role assignment grants you read permissions to a resource group and a different role assignment grants you write permissions to the same resource group, you will have read and write permissions on that resource groups

Azure RBAC has something called `NotActions` permissions. You can use `NotActions` to create a set of not allowed permissions. The access a role grants—the _effective permissions_—is computed by subtracting the `NotActions` operations from the `Actions` operations.

The inheritance order for scope is Management group, Subscription, Resource group, Resource. For example, if you assigned a Contributor role to a group at the Subscription scope level, it will be inherited by all Resource groups and Resources.

First up consultants reviews azure rbac changes quarterly for auditing and troubleshooting purposes.

