Contents covered

1. Directory Services in Azure, including Microsoft Entra ID and Microsoft Entra Domain Services
2. Authentication methods in Azure, including SSO, MFA and passwordless
3. External Identities and guest access in Azure
4. Microsoft Entra Conditional Access
5. Azure Role Based Access Control
6. Concept of Zero Trust
7. Purpose of the defense in depth model
8. Purpose of Microsoft Defender for Cloud


---


## Azure Directory Services
_Microsoft Entra ID_ is a directory service that enables you to sign in and access both Microfost cloud applications and cloud application that you develop.<br>
_Microsoft Entra ID_ can also help you maintain your on-premise Active Directory deployment


For on-premises environments, AD running on windows server provides an identity and access management service thats managed by your organization.<br>
When you secure identities on-premises with AD, microsoft doesnt monitor sign-in attempts.


### What does _Microsoft Entra ID_ do?

- __Authentication__
    - This includes verifying identity to access applications and resources.
    - Also provides functionalities such as self-service password reset, MFA, custom list of banned passwords and smart lockout services
- __Single Sign-On__
    - SSO enables you to remember only one username and one password to access multiple applications. 
    - As users change roles or leave an organization, access modifications are tied to that identity, which greatly reduces the effort needed to change or disable accounts.
- __Application Management__
    - You can manage your cloud and on-premise apps using Microsoft Entra ID
- __Device Management__
    - Registration enables devices to be managed through tools like Microsoft Intune.
    - It also allows for device based conditional access policies to restrict access attempts to only those coming from known devices, regardless of the requesting user account


---

If you had an on-premises env running AD and cloud deployment using Microsoft Entra ID, you would need to maintain two identity sets.<br>
However, you can connect AD with Microsoft Entra ID, enabling a consistent identity experience between cloud and on-premises

One method of connecting microsoft entra ID with on-premise AD is using _mircosoft entra connect_.<br>
It synchronizes user identities between on-premise AD and microsoft entra id.

---


### What is Microsoft Entra Domain Services
Service that provides managed domain services such as domain join, group policy, lightweight directory access protocol (LDAP), and Kerberos/NTLM authentication<br>
With microsoft entra domain services, you get the benefit of domain services without the need to deploy, manage, and patch domain controllers in the cloud

You can use legacy applicationin the cloud that cant use modern authentication methods with microsoft entra domain services.



#### How does microsoft entra domain services work?
When you create a entra domain services managed domain, you define a unique namespace. This namespace is the domain name.<br>
Two windows server domain controllers are then deployed into your selected Azure region. This deployment of DCs is known as replica set.<br>
Azure platform handles the DCs as part of the managed domain, including backups and encryption at rest and updating the software.


A managed domain is configured to perform a one-way synchronization from Microsoft Entra ID to Microsoft Entra Domain Services.<br>
You can create resources directly in the managed domain, but they arent synchronized back to microsoft entra id.

[AD Info sync process](../../images/azure-active-directory-sync-topology-7359f2b8.png)




## Azure Authentication methods

[Security vs Convenience](../../images/passwordless-convenience-security-30321b4d.png)



### What is SSO?
Single Sign On (SSO) enables user to sign in one time and use that credential to access multiple resources and applications from different providers.<br>
For SSO to work, different applications and providers must trust the initial authenticator.

> SSO is only as secure as the initial authenticator because the subsequent connections are all based on the security of the initial authenticator



### What is MFA
Multi-factor Authentication (MFA) is the process of prompting user for an extra form of identitication during the sign in process.

Microsoft Entra multifactor authentication is a microsoft service that provides multifactor authentication capabilities.



### WTF is _passwordless authentication_??
Passwordless authentication needs to be set up on a device before it can work. 

For example, your computer is something you have. Once its been registered or enrolled, Azure now knows that its associated with you. Now that the computer is known, once you provide something you know or are(such as PIN or fingerprint), you can be authenticated without using a password

Microsoft Global Azure and Azure Government offer the following three passwordless authentication options
1. Windows Hello for Business
    - Ideal for information workers that have their own designated PC.
    - has PKI integration and built-in support for SSO 
2. Microsoft Authenticator App
3. FIDO2 Security keys
    - FIDO - Fast Identity Online
    - FIDO2 is the latest standard that incorporates the web authentication standard
    - Allows users and organizations to leverage the standard to sign in to their resources without username or password by using an external security key or a platform key built into a device.




## Azure External Identities

[Azure external AD](../../images/azure-active-directory-external-identities-5a892021.png)

Microsoft entra external ID refers to all the ways you can securely interact with users outside of your organization.<br>
The external users identitiy provider manages their identity and you manage the access to your apps with microsoft entra ID or Azure AD B2C to keep your resources protected.


__Busicess to Business (B2B) collaboration__
    - Collaborate with external users by letting them use their preferred identity to sign in to your microsoft applications or other enterprise applications.

__B2B direct connect__
    - Establish a mutual, two-way trust with another microsoft entra organization for seamless collaboration.
    - B2B direct connect currently supports Teams shared channels, enabling external users to access your resources from within their home instance of Teams.
    - B2B direct connect users arent represented in your directory, but they are visible from within the Teams shared channel and can be monitored in Teams admin center reports.

__Microsoft Entra Business to Customer (B2C)__
    - Publish modern SaaS apps to custom developed apps to consumers and customers, while using Azure AD B2C for identity and access management




## Azure Conditional Access
_Conditional Access_ is a tool that _microsoft entra id_ uses to allow/deny access to resources based on identity signals.<br>
These signals include who the user is, where the user is, and what device the user is requesting access from.

> Conditional Access provides a more granular multifactor authentication experience for users.

[Conditional Access flow Diagram](../../images/conditional-access-9bd268b8.png)


Conditional Access is useful when you need to
- Require MFA to access an application
- Require access to services only through approved client applications.
- Require users to access your application only from a managed devices.
- Block access from untrusted sources such as access from unknown or unexpected locations.



## Azure _Role-Based Access Control (RBAC)_

> The _principle of least privilege_ says you should only grant access up to the level needed to complete a task

If you only need read access to storage blob, then you should only be granted read access to that storage blob. Write access to that blob shouldnt be granted nor should read access to other storage blobs.


Instead of defining the detailed access requirements for each indivirual, and then updating access requirements when new resources are created or new people join the team, Azure enables you to control access through azure role-based access control


Azure provides built-in roles that describe common access rules for cloud resources. You can also define your own rules. Each role has an associated set of access permissions that relate to that role. When you assign individuals or groups to one or more roles, they receive all the associate access permissions.


### How RBAC applied to resources
[Azure RBAC](../../images/role-based-access-scope-4b12a8f3.png)

RBAC is applied to a scope, which is a resource or set of resources that this access applies to. For reference on how these roles have relationships see above picture


A management group, subscription or resource group might be given the rolw of owner, so they have increased control and authority.<br>
An observer, who isnt expected to make any updates, might be given a role of Reader for the same scope, enabling them to review or observe the management group, subscription or resource group

Azure RBAC is hierarchical, in that when you grant access at a parent scope, those permissions are inherited by all child scopes.

### how is azure RBAC is enforced
Azure RBAC is enforced on any action thats initiated aganist an azure resource that passes through azure resource manager.<br>
Resource manager is a management service that provides a way to organize and secure your cloud resources.

Azure RBAC doesnt enforce access permissions at the application or data level. Application security must be handled by your application.



## _Zero Trust Model_
_Zero Trust_ is a security model that assumes the worst case scenario and protects resources with that expectation.<br>
Zero trust assumes breach at the outset and then verifies each request as through it originated from an uncontrolled network

_Zero Trust security model_ is based on
- Verify Explcitly
    - always authenticate and authorize based on all available data points
- Use least privilege access
    - limit user access with just-in-time and just-enough-access, risk based adaptive policies, and data protection
- Assume breach
    - Minimize blast radius and segment access. Verify end-to-end enryption. Use analytics to get visibility, drive threat detection, and improve defenses


### Adjusting to Zero trust
Traditionally, networks are restricted, protected and generally assumed safe. Only managed computers could join the network, VPN access was tightly controlled, and personal devices were frequently restricted or blocked.

The zero trust model flip that scenario. Instead of assuming that a device is safe because its within the corporate network, it requires everyone to authenticate. Then grant access based on authentication rather than location or entity devices.

[Zero Trust Security](../../images/zero-trust-cf9202be.png)




## Defense-in-Depth
A defense in depth as strategy uses a series of mechanisms to slow the advance of an attack that aims at acquiring unauthorized access to data.

You can visualize defense-in-depth as a set of layers, with the data to be secured at the center and all the other layers functioning to protect that central data layer.

Each layer provides protection so that if one layer is breached, a subsequnet layer is already in place to precent further exposure.

[Defense-in-depth](../../images/defense-depth-486afc12.png)

Breif description of role of each layer
1. Physical Security
    - This is the first line of defense to protect computing hardware in the datacenter
2. Identity & Access layer
    - It is all about ensuring that identities are secure, that access is granted to only to whats needed and that sign in events and changes are logged.
    - controls access to infrastructure and change control
3. Perimeter layer
    - protects from network based attacks aganist your resources
    - uses DDoS protection to filter large scale attacks before they can cause a denial of service for users
    - use perimeter firewalls to identify and alert on malicious attacks aganist your network
4. Network layer
    - in here the focus is limiting the network connectivity across all your resources to allow only whats required.
    - limits communication between resources through segmentation and access controls
5. Compute layer
    - implement endpoint protection on devices and keep systems patched and updated with latest softwares
    - secures access to VMs
6. Application Layer
    - helps ensure that applications are secure and free of security vulnerability
7. Data layer
    - controls access to business and customer data that you need to protect



## Microsoft Defender for Cloud
Defender for cloud is a monitoring tool for security posture management and threat protection. It monitors your cloud, on-premises, hybrid and multi-cloud environments to provide guidance and notifications aimed at strengthening your security posture.


Because defender for cloud is an azure-native service, many services are monitored and protected without needing any deployment.<br>
When necessary, defender for cloud can automatically deploy log analytics agent to gather security related data. For azure machines, deployment is handled directly.


### Azure-native protections
- Azure PaaS services
    - detects threats targeting azure services including app service, azure SQL, azure storage etcc.
    - you can also perform anomaly detection on your azure activity logs using native integration
- Azure data services
    - automatically classify your data in azure SQL
    - you can also get assessments for potential vulnerabilitites across the azure sql and storage services and recommendation for how to mitigate them.
- Networks
    - Helps you limit exposure to brute force attacks
    - by reducing access to CM ports, using the just-in-time VM access, you can hardern your network by preventing unnecessary access

> To extend protection to on-premises machines, deploy azure arc and enable defender for clouds enhanced security features.

For multi-cloud architecture, you can still use azure defender to secure your application in other cloud providers too.<br>
The implementations and moficiation and configurations are dependent on types and entities that you are deploying and using from other cloud providers. For more reference refer official docs.


Defenders for cloud fill three vital needs as you manage the security of your resources and workloads in the cloud and on-premises
1. Continuously assess - Know your security posture. Identity and tract vulnerabilities
2. Secure - Harden resourced and services with azure security benchmark
3. Defent - detect and resolve threats to resources, workloads, and services


Defender for clouds threat protection includes fusion kill-chain analysis, which automatically correlates alerts in your environment based on cyber kill-chain analysis