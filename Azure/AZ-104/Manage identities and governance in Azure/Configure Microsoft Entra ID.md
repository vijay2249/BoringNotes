
Entra ID is a cloud based directory and identity management service that supports user access to various resources and applications.

---

Concepts
- Microsoft Entra concepts, including identities, accounts, tenants
- Microsoft Entra features to support different configurations
- Differences between Entra ID and Active Directory Domain Services
- Choose between supported editions of Microsoft Entra ID
- Microsoft Entra join
- Microsoft Entra self-service password reset


Entra ID helps to support user access to resources and applications such as:
- Internal resources and apps located on your corporate network
- external resources like MS365, Azure portal and SaaS applications
- Cloud apps developed for your organization


Microsoft Entra Features

| Feature                   | Description                                                                                                                         |
| ------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| Single Sign-on (SSO)      | Provides secure SSO to web apps on the cloud and to on-premises apps.                                                               |
| Ubiquitous device support | Entra ID works with multiple OS and offers a common experience across the devices                                                   |
| Secure Remote access      | enables secure remote access for on-premises web apps. can include MFA, conditional access policies, group-based access management. |
| Cloud Extensibility       | extend to the cloud to help you manage a consistent set of users, groups, passwords and devices across environments                 |
| Self-service support      | delegate selected admin tasks to company employees. Providing self-service app access and password management through verification steps can reduce helpdesk calls and enhance security                                                                                                                                    |

Microsoft Entra Concepts

| Concept                 | Description                                                                                                                                                                                  |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Identity                | is an Object that can be authenticated. can be a user with username and password. can also be applications or other servers that require authentication by using secret keys or certificates |
| Account                 | is an identity that has data associated with it. to have an account you must have identity first                                                                                             |
| Microsoft Entra account | is an identity thats created through Entra ID or ms cloud service. Identities are stored in Entra ID and are accessible to your organization cloud service subscriptions                     |
| Azure tenant            | single dedicated and trusted instance of Entra ID. Each tenant (aka _directory_) represents a single organization.                                                                           |
| Azure Subscription      | used to pay for azure cloud services. Each subscription is joined to a single tenant. You can have multiple subscriptions.                                                                                                                                                                                             |

Azure Directory Domain Services is primarily a directory service, while MS Entra ID is a full identity solution. It is designed for internet based applications based on HTTP and HTTPS communications.

Hence it doesn't use _kerberos_ authentication

Entra users and groups are created in a flat structure. There are no organizational units or group policy objects.

Entra ID is a managed service. You manage only users, groups and policies. If you deploy AD DS with VM by using azure, you manage many other tasks, including deployment configuration, virtual machines, patching and other backend processes

---

Entra ID comes in four editions: _Free_, _MS 365 Apps_, _Premium P1_, _Premium P2_.


Entra ID enables SSO to devices, applications and services from anywhere. To support SSO, IT admins must ensure corporate assets are protected and devices meet standards for security and compliance

Entra join feature works with SSO to provide access to organizational apps and resources and to simplify windows deployment of work-owned devices

---

Entra **self-service password reset(SSPR)** feature lets you give users the ability to bypass helpdesk and reset their own passwords.


SSPR requires a Entra account with global admin privileges to manage SSPR options. This account can always reset their own passwords, no matter what options are configured.

SSPR uses a security group to limit the users who have SSPR privileges.

all users accounts in your organization must have a valid license to use SSPR