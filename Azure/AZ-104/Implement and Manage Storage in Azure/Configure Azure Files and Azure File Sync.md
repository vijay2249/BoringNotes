
- Identify storage for file shares and blob data
- configure azure file shares and file share snapshots
- identify features and use cases for azure file sync
- identify azure file sync components and configuration steps

---

Azure files offers fully managed file share in the cloud that are accessible via industry standard protocols. 

Azure file sync is a service that allows you to cache several azure files shares on an on-premises windows server or cloud virtual machine


---

- Azure files stores data as true directory objects in file shares
- azure files provide shared access to a files across multiple VMs. Any number of azure vm or roles can mount and access an azure file share simultaneously.
- applications that run in azure VMs or cloud services can mount an azure file share to access file data. This process is similar to how a desktop application mounts a typical SMB share
- Azure files offers fully managed file shares in the cloud. Azure file shares can be mounted concurrently by cloud or on-premises deployments of windows, linux and macOS


Things to consider when using azure files
1. consider replacement and supplement options
2. consider global access
3. consider lift and shift support
4. consider using azure file sync
5. consider shared applications
6. consider diagnostic data
7. consider tools and utilities

---
### Azure file shares

There are two important settings that you need to be aware o when creating and configuring SMB azure file shares.
- **Open port 445**: Azure files uses the SMB protocol. SMB communications over TCP 445. Be sure port 445 is open. Also make sure your firewall isnt blocking TCP port 445 from the client machine.
- **Enable secure transfer**: The `Secure transfer required` setting enhances the security of your storage account by limiting requests to your storage account from secure connections only.


---

### File share snapshots

Azure files provides the capability to take share snapshots of file shares. File share snapshots capture a point-in-time, read-only copy of your data.


Characteristics of file share snapshots
- Azure files share snapshot capability is provided at the file share level.
- share snapshots are incremental in nature. Only data changed since the most recent share snapshot is saved.
- incremental snapshots minimize the time required to create share snapshot and saves on storage costs
- even though share snapshots are saved incrementally, you only need to retain the most recent share snapshot to restore the share
- you can retrieve a share snapshot for an individual file. 
- if you want to delete a share that has share snapshots, you must first delete all its snapshots.

---

### Azure File sync

Azure file sync enables you to cache several azure files shares on an on-premises windows server or cloud virtual machine. You can use azure file sync to centralize your organization file shares in azure files, while keeping the flexibility, performance and compatibility of an on-premises file server.

Azure file sync transforms windows server into a quick cache of your azure file shares

You can use any protocol thats available on windows server to access your data locally with azure file sync, including SMB, NFS, and FTPS

Azure file sync supports as many caches as you need around the world


#### Cloud tiering

optional feature of azure file sync. Frequently accessed files are cached locally on the server while all other files are tiered to azure files based on policy settings

- When a file is tiered, azure file sync replaces the file locally with a pointer. A pointer is commonly referred to as a reparse point. The reparse point represents a URL to the file in azure files.
- when a user opens a tiered file, Azure file sync seamlessly recalls the file data from the azure files without the user needing to know that the file is stored in azure.
- cloud tiering files have greyed icons with a offline "0" file attribute to let the user know when the file is only in azure.


---

### Azure file sync components

![[azure-file-sync-components.png]]

Azure file sync is composed of four main components that work together to provide caching for azure files shares on an on-premises windows server or cloud virtual machine

#### Storage Sync Service

Top-level azure resource for azure file sync. This resource is a peer of the storage account resource and can be deployed in a similar manner.

The storage sync service forms sync relationships with multiple storage accounts by using multiple sync groups.

The service requires a distinct top-level resource from the storage account resource to support the sync relationship
A subscription can have multiple storage sync service resources deployed.


#### Sync group

define the sync topology for a set of files. Endpoints within a sync groups are kept in sync with each other.


#### Registered server

The registered server object represents a trust relationship between your server and the storage sync service resource. You can register as many servers to a storage sync service resource as you want.


#### Azure file sync agent

The azure file sync agent is a downloadable package that enables windows server to be synced with an azure file share.

The azure file sync agent has three main components:
1. **FileSyncSvc.exe**: background windows service thats responsible for monitoring changes on server endpoints and for initiating sync sessions to azure.
2. **StorageSync.sys**: this is azure file sync file system filter that supports cloud tiering. The filter is responsible for tiering files to azure files when cloud tiering is enabled.
3. **PowerShell cmdlets**: These allow you to interact with the `Microsoft.StorageSync` azure resource provider. 

#### Server endpoint

Represents a specific location on a registered server such as folder on a server volume. Multiple server endpoints can exist on the same volume if their namespaces are unique.

#### Cloud endpoint

It is an azure file share thats part of a sync group. As part of sync group, the entire cloud endpoint syncs.
- azure file share can be member of one cloud endpoint only
- azure file share can be member of one sync group only


---

### Deploy Azure file sync

Before you can start synchronizing files with azure file sync, there are several high level steps that need to be completed

1. Deploy the storage sync service
	1. You can deploy the storage sync service from the azure portal
		1. deployment name for the storage sync service
		2. azure sub id to use for deployment
		3. resource group for deployment
		4. deployment location
2. Prepare each windows server to use azure file sync
	1. after deployment, you configure each windows server that you intend to use with azure file sync including server nodes in a failover cluster
3. install the azure file sync agent
	1. the agent is a downloadable package that enables windows server to be synced with an azure file share. 
4. register each windows server with the storage sync service
	1. By registering the windows server with a storage sync service, you establish a trust relationship between your server and the storage sync service.
	2. For registration you need azure sub ID and some of the deployment settings you configured in the first step. 

- Getting started [video](https://youtu.be/Zm2w8-TRn-o)

> A server (or cluster) can be registered with only one Storage Sync Service resource at a time.


Cloud tiering allows frequently accessed files to be cached on the local server. Infrequently accessed files are tiered or archived to the Azure file share according to the policy created.


