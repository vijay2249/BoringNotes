_Azure Blob Storage_ is microsoft object storage solution for cloud.<br>
Blob storage is optimized for storing massive amounts of unstructured data.

Contents covered
1. Identify different types of storage accounts
2. Resource hierarchy for blob storage
3. Explain how data is securely stored
4. Enable a storage account in static website hosting

---


## Blob Storage

Blob storage is designed for
- Serving images or documents directly to a browser
- Storing files for distributed access
- Streaming video and audio
- Writing to log files
- Storing data for backup and restor, disaster recovery, archiving
- Storing data fro analysis by an on-premises or Azure hosted service


> Users/Client applications can access objects in blob storage via HTTP/HTTPS

> Objects in blob storage are accessible via the azure storage REST API, azure powershell, Azure CLI, or an azure storage client library

An _Azure storage account_ is the top level container for all of your azure blob storage. The storage account provides a unique namespace for your azure storage data that is accessible from anywhere over HTTP/HTTPS


### Blob storage resource types
Blob storage offers three types of resources
1. Storage account
    - provides a unique namespace in azure for user data.
    - Every object that you store in azure storage has an address that includes your unique account name.
    - If your storage account is named "coachBeard", the default endpoint for blob storage is `http://coachbeard.blob.core.windows.net`
2. Container in the storage account
    - organizes a set of blobs, similar to directory in a file system.
    - a storage account can include an unlimited number of containers and a container can store an unlimited number of blobs
    - Container name must be a valid DNS name, as it forms a part of the unique URL used to address the container or its blobs.
    - Naming convention for containers
        - can be in b/w 3-63 characters long
        - must start with a letter or number and can contain only lowercase letters and numbers and dash character
        - two or more consective dash characters arent permitted
3. Blob in a container


Azure Storage supports three types of blobs
- Block blobs
    - store text and binary data.
    - made up of blocks of data that can be managed individually
- Append blobs
    - made up of blocks like block blobs, but are optimized for append operations.
    - ideal for scenarios such as logging data
- Page blob
    - store random access files up to 8TB in size
    - store virtual hard drive files and serve as disk for azure virtual machines



## Azure storage security features
Provides a comprehensive set of security capabilities that together enable developers to build secure applications
- all data written to azure storage is automatically encrypted using storage service encryption
- entra ID and RBAC are supported for azure storage for both resource management operations and data operations
    - you can assign RBAC roles scoped to the storage account to security principals and use entra ID to authorize resource management operations such as key management
    - entra integration is supported for blob and queue data operations.
- data can be secured in transit between an application and azure by using client side encryption, HTTPS and SMB 3.0
- OS and data disks used by azure vm can be encrypted using azure disk encryption
- delegated access to data objects in azure storage can be granted using a shared access signature


Data in azure storage is encrypted and decrypted transparently using 256-bit AES encryption.

> Azure storage encryption is enabled for all new and existing storage accounts and cant be disabled.


### Encryption key management
User can rely on microsoft-managed keys for the encryption of user storage account, or user can manage encryption with user own keys


The following table compares key managemnt options for azure storage encryption

|   | Microsoft managed keys | Customer managed keys | customer provided keys |
| - | - | - | - |
| Encryption/decryption operations | Azure | Azure | Azure |
| Azure storage services supported | All | Blob storage, azure files | blob storage |
| Key storage | microsoft key store | Azure key vault | azure key vault or any other key store |
| Key rotation responsibility | microsoft | customer | customer |
| Key usage | microsoft | azure portal, storage resource provider REST API, azure storage management libraries, powershell, CLI | Azure storages REST API, azure storage client libraries |
| Key access | microsoft only | customer, microsoft | customer only |



## Static website hosting in azure storage
User can serve static content directly from a storage container named $web<br>
Hosting your content in azure storage enables you to use serverless architecture that include azure functions and other PaaS services.


### Impact of setting the access level on the web container
User can modify the public access level of the $web container, but making this mondification has no impact on the primary static website endpoint because these files are served through anonymous access requests. That means public access to all files.

Disabling public access on a storage account by using the public access setting of the storage account doesnt affect static websites that are hosted in that storage account.

User can make your static website available via a custom domain<br>
Its easier to enable HTTP access for your custom domain, because azure storage natively supports it.