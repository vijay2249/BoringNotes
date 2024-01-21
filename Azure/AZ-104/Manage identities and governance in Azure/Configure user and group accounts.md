
- Configure users accounts and user account properties
- create new user accounts
- import bulk user accounts with a template
- configure group accounts and assignment types

---

Access to azure resources is controlled through user accounts an identities that are defined in Entra ID. It supports group accounts to hep you organize user accounts for easier admin.


#### Create User accounts

Every user who wants access to azure resources needs an azure user account. A user account has all the information required to authenticate the user during the sign-in process. Entra ID supports three types of user accounts. The types indicate where the user is defines and whether the user is internal or external to your Microsoft Entra organization

| User Account                    | Description                                                                                                                                                                                                                                                                                |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Cloud Identity                  | defined only in microsoft entra id. this type of user account includes admin accounts and users who are managed as part of your organization. Cloud identity can be for user accounts defined in your entra organization and also for user accounts defined in an external entra instance. |
| Directory-Synchronized identity | defined in an on-premises active directory. A synchronization activity occurs via entra connect to bring these user accounts in to azure. the source for these accounts in Windows Server Active Directory.                                                                                |
| Guest User                      | defined outside Azure. examples include user accounts from other cloud providers, and microsoft accounts like Xbox live account.                                                                                                                                                                                                                                                                                           |

Things to consider when choosing user accounts
- Consider where users are defined
- Consider support for external contributors
- Consider a combination of user accounts


#### Manage User accounts

There are several ways to add cloud identity user accounts in Entra ID. Common approach is by using the Azure portal. User accounts can also be added to Microsoft Entra ID through Microsoft 365 Admin center, Microsoft Intune admin console and the Azure CLI

The admin can create a user within the organization or invite a guest user to provide access to organization resources.

A user with global admin or user admin privileges can preset profile data in user accounts such as the main phone number for the company.

Non-admin users can set some of their own profile data but they cant change their display name or account name

Things to consider when managing cloud identity accounts
- Consider user profile data
- Consider restore options for deleted accounts
- Consider gathered account data.

---

#### Create bulk user accounts

Entra ID supports several bulk operations, including bulk create and delete for user accounts.

Only global admin or user admin have privileges to create and delete user accounts in the azure portal

To complete bulk create or delete operations, the admin fills out a csv template of the data for the user accounts.

Things to consider when creating user accounts
- Consider naming convention
- Consider using initial passwords
- Consider strategies for minimizing errors

---

#### Create group accounts

Entra ID allows your organization to define two different types of group accounts. **Security groups** are used to manage member and computer access to shared resources for a group of users.

You can create a security group for a specific security policy and apply the same permissions to all members of a group.

Use security groups to set permissions for all group members at the same time, rather than adding permission to each member individually


| Access Rights | Description                                                                                                                                                                                                                                                |
| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Assigned      | add specific users as members of a group, where each user can have unique permissions                                                                                                                                                                      |
| Dynamic user  | use dynamic membership rules to automatically add and remove group members. When members attributes change, azure reviews the dynamic group rules for the directory. if the member attributes meet the rule requirements, the member is added to the group |
| Dynamic device              | _(Security groups only)_ apply dynamic group rules to automatically add and remove devices in security groups.                                                                                                                                                                                                                                                           |

---

Microsoft Entra ID supports three types of user accounts: cloud identities, directory-synchronized identities and guest user identities

there are two types of group accounts: Security and Microsoft 365

Administrative units help you control administrator access to resources.