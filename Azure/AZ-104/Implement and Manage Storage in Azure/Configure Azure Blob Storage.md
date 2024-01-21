
- Understand the purpose and benefits of Azure Blob Storage
- Create and configure Azure Blob storage accounts
- Manage containers and blob within azure blob storage
- optimize blob storage performance and scalability
- implement lifecycle management policies to automate data movement and deletion
- Determine the best pricing plans for your azure blob storage

---

Azure Blob storage is a service for storing large amounts of unstructured object data.

Blob - Binary Large Object 
Blob Storage is also referred to as _object storage_ or _container storage_

1. Blob storage can store any type of text or binary data. 
2. Blob storage uses three resources to store and manage your data
	1. Azure storage account
	2. containers in azure storage accounts
	3. blobs in a container
3. To implement blob storage, you configure several settings
	1. blob container options
	2. blob types and upload options
	3. blob storage access tiers
	4. blob lifecycle rules
	5. blob object replication options

![[blob-storage-diagram.png]]

Things to consider when implementing Azure Blob storage
1. Consider browser uploads
2. consider distributed access
3. consider streaming data
4. consider archiving and recovery
5. consider application access

---

### Blob Containers

Azure blob storage uses a container resource to group a set of blobs. A blob cant exist by itself in Blob storage. A blob must be stored in a container resource.

- All blobs must be in a container
- A container can store an unlimited number of blobs
- An azure storage account can contain an unlimited number of containers

While configuring a container you have an option called **Public access level**,
	The access level specifies whether the container and its blobs can be accessed publicly
	There are three access level choices
	- **Private**: prohibit anonymous access to the container and blobs
	- **Blob**: allow anonymous public read access for the blobs only
	- **Container**: allow anonymous public read and list access to the entire container, including the blobs.

---

### Blob access tiers

#### Hot tier

Optimized for frequent reads and write of objects in azure storage account. 
By default, new storage accounts are created in the Hot tier.
This tier has the lowest access costs, but higher storage costs than the Cool and Archive tiers

#### Cool tier

Optimized for storing large amounts of data thats infrequently accessed. 
This tier is intended for data that remains in the cool tier for at least 30 days.
This content shouldnt be viewed frequently but it needs to be immediately available.
Storing data in the cool tier is more cost effective. Accessing data in the cool tier can be more expensive than accessing data in the Hot tier.

#### Cold tier

Also optimized for storing large amounts of data thats infrequently accessed. This tier is intended for data that can remain in the tier for at least 90 days.

#### Archive tier

Is an offline tier thats optimized for data that can tolerate several hours of retrieval latency. Data must remain in the archive tier for at least 180 days or be subject to an early deletion charge.
This tier is the most cost effective option for storing data. Accessing data is more expensive in the Archive tier than accessing data in the other tiers.

---

### Blob lifecycle management rules

Azure blob storage lifecycle management policy rules to accomplish several tasks
1. Transition blobs to a cooler storage tier to optimize for performance and cost
2. delete blobs at the end of their lifecycles
3. define rule based conditions to run once per day at the azure storage account level
4. apply rule based conditions to container or a subset of blobs

---

### Blob object replication

Object replication copes of blobs in a container asynchronously according to policy rules that you configure.

During the replication process, the following contents are copies from the source container to the destination container
1. Blob contents
2. blob metadata and properties
3. any versions of data associated with the blob


- Object replication requires that blob versioning is enabled on both the source and destination accounts
- object replication doesnt support snapshots. Any snapshots on a blob in the source account arent replicated to the destination account
- object replication is supported when the source and destination accounts are in the Hot, Coo, Cold tier. The source and destination accounts can be in different tiers.
- When you configure object replication, you create a replication policy that specifies the source azure account and the destination storage account
- replication policy includes one or more rules that specify a source container and a destination container. The policy identifies the blobs in the source container to replicate.

Things to consider when configuring blob object replication
- consider latency reductions
- consider efficiency for compute workloads
- consider data distribution
- consider costs benefits


---

### Upload blobs

A blob can be any type of data and any size file.

Azure storage offers three types of blobs
1. **Block blobs**: consists of blocks of data that are assembled to make a blob.  Ideal for storing text and binary data in the cloud like files, images and videos
2. **Append blobs**: similar to block blob because the append blob also consists of blocks of data. The blocks of data in the append blob are optimized for append operations.
3. **Page blobs**: can be up to 8TB in size. Are more efficient for frequent read/write operations. Azure Virtual Machines uses page blobs for operating system disk and data disks.


> Once you create a blob - you cant change its type.
