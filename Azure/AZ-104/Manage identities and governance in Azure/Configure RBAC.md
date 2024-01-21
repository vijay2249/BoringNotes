
- identify features and use cases for RBAC
- list and create role definitions
- create role assignments
- identity differences between azure RBAC and microsoft entra roles
- manage access to subscriptions with RBAC
- review built-in azure RBAC roles

---


RBAC is a mechanism that can help you manage who can access your azure resources. RBAC lets you determine what operations specific users can do on specific resources and control what areas of a resource each user can access.


Things to know about azure rbac
- allow an application to access all resources in a resource group
- allow one user to manage VMs in a subscription and allow another user to manage virtual networks
- allow a database administrator group to manage SQL dbs in a subscription
- allow a user to manage all resources in a resource group such as VMs , websites etc..

| Concept | Description | Examples |
| ---- | ---- | ---- |
| **Security principal** | An object that represents something that requests access to resources. | User, group, service principal, managed identity |
| **Role definition** | A set of permissions that lists the allowed operations. Azure RBAC comes with built-in role definitions, but you can also create your own custom role definitions. | Some built-in role definitions: _Reader_, _Contributor_, _Owner_, _User Access Administrator_ |
| **Scope** | The boundary for the requested _level_ of access, or "how much" access is granted. | Management group, subscription, resource group, resource |
| **Assignment** | An **assignment** attaches a **role definition** to a **security principal** at a particular **scope**. Users can grant the access described in a role definition by creating (attaching) an assignment for the role. | - Assign the _User Access Administrator_ role to an admin group scoped to a management group  <br>- Assign the _Contributor_ role to a user scoped to a subscription |


---

### Role definition

Role definition consists of sets of permissions that are defined in a JSON file, Each permission set has a name such as _Actions_ or _NotActions_ that describe the permissions.

- Azure RBAC provides built-in roles and permissions sets. You can also create custom roles and permissions
- The _Owner_ built-in role has the highest level of access privilege in Azure
- The system subtracts _NotActions_ permissions from _Actions_ permissions to determine the _effective permissions_ for a role
- The _AssignableScopes_ permissions for a role can be management groups, subscriptions, resource groups or resources.


---

### Role Assignment

A role assignment is the process of scoping a role definition to limit permissions for a requestor, such as group, user, service principal or managed identity

- The purpose of a role assignment is to control access
- The scope limits which permissions defined for a role are available for the assigned requestor
- Access is revoked by removing a role assignment
- a resource inherits role assignments from its parent resource
- The effective permissions for a requestor are a combination of the permissions for the requestors assigned roles and the permissions for the roles assigned to the requested resources.

---

### Azure Roles vs Microsoft Entra roles

Three types of roles are available for access management in Azure
1. Class subscription administrator roles
2. Azure RBAC roles
3. Microsoft Entra administrator roles

Azure RBAC is authorization  system that provides fine-grained access management to Azure resources.

**Microsoft Entra admin roles**: are used to manage resources in entra ID, such as users, groups, and domains. These roles are defined for Entra tenant at the root level of the configuration

**Azure RBAC roles** provide more granular access management for azure resources. These roles are defined for a requestor or resource and can be applied at multiple levels, the root, management groups subscriptions, resource groups, or resources


---

Azure RBAC fundamental roles

- Owner => has full access to all resources, including right to delegate access to others
- Contributor => can create and manage all types of azure resources. This role cant grant access to others
- Reader => can view existing azure resources
- User Access Administrator=> can manage user access to azure resources

