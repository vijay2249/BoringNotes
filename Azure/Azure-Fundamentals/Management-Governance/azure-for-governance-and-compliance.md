Contents covered
1. Microsoft Purview
2. Azure policy
3. Resource locks
4. Service Trust portal



## Microsoft Purview
It is a family of data governance, risk, and compliance solutions that helps user get a single, unified view into your data.<br>
Microsoft purview brings insights about your on-premises, multicloud and SaaS data together.

Two main solution areas comprise _Microsoft Purview_: __Risk and Compliance__ and __Unified data governance__

[Purview](../../images/purview-solution-areas-ceb1bedf.png)

_Purview_ by managing and monitoring your data, is able to help your organization
- Protect sensitive data across clouds, apps, and devices
- Identify data risks and manage regulatory compliance requirements
- Get started with regulatory compliance


unified data governance can help with
1. Create an up-to date map of entire data estate that includes data classification and end to end lineage
2. Identify where sensitive data is stored in your estate
3. Create a secure environment for data consumers to find valuable data
4. Generate insights about how your data is stored and used
5. Manage access to the data in your estate securely and at scale.



## Azure Policy
_Azure Policy_ is a service is azure that enables user to create, assign and maanage policies that control or audit user resources.<br>
These policies enforce different rules across your resource configurations so that those configurations stay compliant with corporate standards


_Azure policy_ enables user to define both individual policies and group of related policies, known as initiatives.<br>
Azure policy evaluates your resources and highlights resources that arent compliant with the policies user created.<br>
Policy can also prevent non-compliant resources from being created

Azure policies can be set at each level, enabling user to set policies on a specific resource, resource group, subscription and so on.<br>
Additionally, azure policies are inherited, so if user set a policy at a high level, it will automatically be applied to all the groupings that fall within the parent.

_Azure Policy_ comes with built-in policy and initiative definitions for storage, networking, compute, security center and monitoring.<br>


In some cases, azure policy can automatically remediate non-compliant resources and configurations to ensure the integrity of the state of resources.<br>
For example, If all resources in a certain resource group should be tagged with appName tag and a specific value, _azure policy_ will automatically apply that tag if it is missing.<br>
However user still retain full control of your environment. If user have a specific resource that user dont want azure policy to automatically fix, user can flag that resuorce as an exception - and the policy wont automatically fix that resource

### Azure policy initiatives
Azure policy initiative is a way of grouping related policies together. The initiative definition contains all of the policy definitions to help track your compliance state gor larger goal

Under this policy, the following policy definitions are included
1. Monitor unencrypted SQL database in security center
2. Monitor OS vulnerabilities in security center
3. Monitor missing endpoint protection in security center



## Resoure Locks
_Resource lock_ prevents resources from being accidentally deleted or changed.<br>
_Resource Locks_ can be applied to individual resources, resource groups, or even an entire subscription.<br>
Resource locks are inherited, meaning that if user place a resource lock on a resource group, all of the resources within the resource group will also have the resource lock applied.


Types of _Resource Locks_
- One that prevents users from deleting 
    - means authorized users can still read and modify a resource, but they cant delete the resource
- One that prevents users from changing/deleting a resource
    - means authorized users can read a resource, but they cant delete or update the resource.
    - applying thos lock is similar to restricting all authorized users to the permissions granted by the reader role.


### How to delete or change a locked resource?
To modify a locked resource, you must first remove the lock. After you remove the lock, you can apply any action you have permissions to perform.<br>
Resource locks apply regardless of RBAC permissions. Even if you are an owner of the resource, you must still remove the lock before you can perfom the blocked activity




## Service Trust portal
This provides access to various content, tools and other resources about Microsoft security, privacy, and compliance practices.<br>
It contains details about the microsoft implementation of controls and processes that protect cloud services and customer data.

> _Service Trust Portal_ reports and documents are available to download for at least 12 months after publishing or untill a new version of document becomes available

