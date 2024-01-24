
- Identify the features of shares access signatures for azure storage
- identify the features of stored access policies
- programmatically generate and use a SAS to access storage


---

Every request to access files stored in azure requires authorization. A Shared access signatures(SAS) provides secure, delegated access to resources in your storage account.


### Auth options for Azure Storage

Clients access files stored in azure storage over HTTP(S). Azure checks each client request for authorization to access the stored data. 

Four options are available for access blob storage

#### Public access

Also known as anonymous public read access for containers and blobs

Both storage account and container settings are required to enable anonymous public access.

#### Entra ID

AD authorization takes a two-step approach. First, you authenticate a security principal that returns a OAuth 2.0 token if successful. This token is then passed to azure storage to enable authorization to the requested resource.


#### Shared Key

Azure storage creates two 512-bit access keys for every storage account thats created. You share these keys to grant clients access to the storage account. These keys grant anyone with access the equivalent of root access to your storage. 


#### Shared access signature

SAS lets you grant granular access to files in azure storage such as read-only or read-write access, expiration time, after which the SAS no longer enables the client to access the chosen resources.

Azure storage supports three types of SAS:
1. User delegation SAS - only for Blob storage and is secured with entra credentials
2. Service SAS - secured using storage account key. delegates access to a resource in any one of four azure storage services.
3. Account SAS - secured with a storage account key. has same controls as a service SAS but can also control access to service level operations such as Get Service Stats

---

SAS is a secure way to give access to clients without having to share your azure credentials. This ease of use comes with a downside. Anyone with the correct SAS can access the file while its still valid.

The only way you can revoke access to the storage is to regenerate access keys. Regeneration requires you to update all apps that are using the old shared key to use the new one. Another option is to associate the SASs with a stored access policy.


### What are stored access policies?

These polices are like rules - expiration time, start time, permissions to files/containers etc...

```bash
az storage container policy create 
	--name <stored access policy identifier> 
	--container-name <container name> 
	--start <start time UTC datetime> 
	--expiry <expiry time UTC datetime> 
	--permissions <(a)dd, (c)reate, (d)elete, (l)ist, (r)ead, or (w)rite> 
	--account-key <storage account key> 
	--account-name <storage account name> 
```

Sample azure policy CLI command to create azure container policy

