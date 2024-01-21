
- Configure a shared access signature, including the uniform resource identifier and SAS parameters
- configure azure storage encryption
- implement customer-managed keys
- recommend opportunities to improve azure storage security

---

Administrators use different strategies to ensure their data is secure. Common approaches includes encryption, authentication, authorization, and user access control with credentials, file permissions and private signatures

Characteristics of Azure storage security
1. **Encryption**
	1. all data written to azure storage is automatically encrypted by azure storage encryption
2. **Authentication**
	1. entra ID and RBAC are supported for azure storage for both resource management operations and data operations
3. **Data in transit**
	1. data can be secured in transit between an application and azure by client side encryption, HTTPS or SMB 3.0
4. **Disk encryption**
	1. OS disks and data disks used by azure virtual machines can be encrypted by using azure disk encryption
5. **Shared access signatures**
	1. delegated access to the data objects in azure storage can be granted by using a shared access signatures (SAS)
6. **Authorization**
	1. every request made against a secure resource in blob storage, azure files, queue storage or azure cosmos db, must be authorized.

---

### Shared Access Signatures (SAS)

SAS is a URL that grants restricted access rights to azure storage resources. It is a secure way to share your storage resources without compromising your account keys.

Characteristics of SAS
- SAS gives you granular control over the type of access you grant to clients who have SAS
- an account level SAS can delegate access to multiple azure storage services
- you can specify the time interval for which a SAS is valid, including the start and expiration time.
- you specify the permissions granted by the SAS
- SAS provides account level and service level control
	- Account level SAS delegates access to resources in one or more azure storage services
	- Service level SAS delegates access to a resource in only one azure storage service.

>A **stored access policy** can provide another level of control when you use a service-level SAS on the server side. You can group SASs and provide other restrictions by using a stored access policy.



When you create your shared access signatures, a URI is created by using parameters and tokens. The URI consists of your azure storage resource URI and the SAS tokens

> Azure storage encryption is enabled for all new and existing storage accounts and cant be disabled


---

### Customer Managed Keys

For azure storage security solution, you can use azure key vault to manage your encryption keys. The azure key value APIs can be used to generate encryption keys. You can also create your own encryption keys and store them in a key vault

Characteristics of customer-managed keys
- by creating your own keys, you have more flexibility and greater control
- you can create, disable, audit, rotate and define access controls for your encryption keys
- customer managed keys can be used with azure storage encryption. you can use a new key or an existing key vault and key. 
- azure storage account and key vault must be in the same region, but they can be in different subscriptions.