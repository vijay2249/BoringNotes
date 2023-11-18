# Azure-storage-services

Contents covered

1. Compare Azure storage services
2. Azure Storage tiers
3. Azure Storage redundancy options
4. Storage account options and storage types
5. Identity options for moving files, including AzCopu, Azure Storage Explorer and Azure File Sync
6. Migration options, including Azure Migrate and Azure Data Box

***

### Azure Storage Accounts

Storage account provides a unique namespace for your azure storage data thats accessible from anywhere in the world over HTTP or HTTPS. Data in this account is secure, highly available, durable and massievly scalable.

When you create your storage account, you will start by picking the storage acccount type. The type of account determines the storage services and redundancy options and has an impact on the use cases.

* Locally Redundant Storage (LRS)
* Geo-Redundant Storage (GRS)
* Read-access geo-redundant storage (RA-GRS)
* Zone-redundant storage (ZRS)
* Geo-Sone-redundant storage (GZRS)
* Read-access geo-sone-redundant access (RA-GZRS)

#### Storage account endpoints

One of the benefits of using a Azure storage account is having a unique namespace in Azure for your data. In order to do this, every storaeg account in azure must have a unique-in-azure account name.\
The combination of the account named in the Azure storage service endpoint forms the endpoints for your storage account

Azure Storage account naming rules

1. must be 3 to 24 characters length
2. can contain numbers, lowercase letters only
3. your storage account name must be unique within Azure.

This uniqueness supports the ability to have a unique, accessible namespace in Azure

The endpoint format for different azure storage services

1. Blob Storage -> https://.blob.core.windows.net
2. Data Lake Storage Gen2 -> https://.dfa.core.windows.net
3. Azure Files -> https://.file.core.windows.net
4. Queue Storage -> https://.queue.core.windows.net
5. Table Storage -> https://.table.core.windows.net

### Azure Storage Redundancy

Azure storage always stores multiple copies of your data so that its protected from planned and unplanned events such as transient hardware failures, network or power outages and natual disasters.\
Redundancy ensures that you storage account meets its availability and durability targets even in the face of failures

#### Redundancy in the primary region

Data in an Azure Storage account is always replicated three times in the primary region. Azure Storage offers two options for how your data is replicated int he primary region, _Locally Redundant Storage (LRS)_ and _Zone Redundant Storage (ZRS)_

**Locally Redundant Storage**

This replicates your data three times within a single data center in the primary region\
LRS provides at least of 11 nines of durability of objects over a given year.

[LRS](../../images/locally-redundant-storage-37247957.png)

**Zone redundant Storage**

For availability zone enabled regions, zone redundant storage replicates your azure storage data synchronously across three azure availability zones in the primary region. ARS offers durability for azure storage data objects of at least 12 nines over a given year

[ZRS](../../images/zone-redundant-storage-6dd46d22.png)

With ZRS, your data is still accessible for both read and write operations even if a zone becomes unavailable. No remounting of Azure files shares from the connected clients is required.\
If a zone becomes unavailable, Azure undertakes networking updates, such as DNS repointing. These updates may affect your application if you access data before the updates have completed.

#### Redundancy in a secondary region

For applications requiring high durability, you can choose to additionally copy the data in your storage to a secondary region that is hundreds of miles away from the primary region.

When you create a storage account, you select the primary region for the account. The paried secondary region is based on Azure region pairs and cant be changed.

Azure Storage offers two options for copying your data to a secondary region:

1. Geo-redundant storage (GRS)
2. Geo-Zone-redundant storage (GZRS)

GRS is similar to running LRS in two regions and GZRS is similar to running ZRS in the primary region and LRS in the secondary region

By default, the data in the secondary region isnt available for read and write access unless there is a failover to the secondary region. If the primary region becomes unavailable, you can choose to fail over to the secondary region. After the failover has completed, the secondary region becomes the primary region and you can again read and write data.

> Data is replicated in secondary region asynchronously, hence a failure that affects the priimary region may result in data loss if the primary region cant be recovered. The interval between the most recent writes to the primary region and the last write to the secondary region is known as the recovery point objective. The recovery point objective indicates the point in time to which data can be recovered. Azure storage typically has RPO of less than 15 minutes.

**Get redundant storage**

GRS copies your data synchronoulsy three times within a single physical location in the primary region using LRS. It then copies your data asynchronously to a single physical location in the secondary region using LRS

[GRS](../../images/geo-redundant-storage-3432d558.png)

**Geo-Zone-redundant storage**

GZRS combines the high availability provided by redundancy across availability zones with protection from region outages provided by geo-replication.\
Data in a GZRS storage account is copied across three Azure availability zones in the primary region which is similar to ZRS and is also replicated to a secondary geographic region, using LRS for protection from regional disasters.

[GZRS](../../images/geo-zone-redundant-storage-138ab5af.png)

#### Read access to data in the secondary region

Geo-redundant storage replicates your data to another physical location in the secondary region to protect aganist regional outages.\
However, that data is available to be read only if hte customer or Microsoft initiates a failover from the primary to secondary region.\
However, if you enable read access to the secondary region, you data is always available, even when the primary region is running optimally.\
For read access to the secondary region, enable read-access geo-redundant storage or RA-GZRS

### Azure Storage Services

The Azure Storage platform includes the following data services

1. **Azure Blobs**: A massively scalable object store for text and binary data. Also includes support for big data analytics through Data Lake Sroage Gen2
2. **Azure Files**: Managed file shares for cloud or on-premise deployments
3. **Azure Queues**: A messaging store for reliable messaging between application components
4. **Azure Disks**: Block-level storage volume for Azure VMs
5. **Azure Tables**: NoSQL table option for structured, non-relational data

Benefits include _Durable and highly available_, _secure_, _scalable_, _managed_, _accessible_

#### Azure Blobs

Azure Blob storage is unstructured, meaning that there are no restrictions on the kinds of data it can hold. Blob storage can manage thousands of simultenous uploads, massive amounts of video data, constantly growing log files and can be reached from anywhere with an internet connection

> Blobs arent limited to common file formats.

One advantage of blob storage over disk storage is that it doesnt require developers to think abou or manage disks. Data is uploaded as blobs and Azure takes care of the physical storage needs

Blob storage is ideal for

* Serving images or documents directly to a browser
* Storing files for distributed access
* Streaming video and audio
* Storing data for backup and restore
* Storing data for analysis by an on-premises or Azure-hosted service

**Acccessing blob storage**

Users can access blobs via URLs, the Azure Storage REST API, Azure PowerShell, Azure CLI, or Azure Storage client library

#### Azure Files

Azure Fule storage offers fully manages file shares in the cloud that are accessible via the industry standard Server Message Block(SMB) or Network File System(NFS) protocols.\
Azure Files file shares can be mounted concurrently by cloud or on-premise deployments.

SMB Azure files shares can be cached on Windows servers with Azure File Sync for fast access near where the data is being used.

Benefits include

* Shared Access
* Fully managed
* Scripting and tooling
* Resiliency
* Familiar programmability

#### Azure Queues

Is a service for storing large number of messages. Once stored, you can access the messages from anywhere in the world via authenticated calls using HTTp or HTTPS.\
A queue can contians as many messages as your storage account has room for.\
Queues are commonly used to create a backlog of work to process asynchronously

Queue storage can be combined with compute functions like Azure Functions to take an action when a message is received.

#### Azure Disks

Conceptually they are same as physical disk, but they are virtualized offering greater resiliency and availability than a physical disk.

#### Azure Tables

stores large amounts of unstructured data.These are a NoSQL datastore that accepts authenticated calls from inside and outside the Azure cloud.\
This enables you to use Azure tables to build your hybrid or multi-cloud solution and have your data always available.

### Identity Azure data migration options

#### Azure Migrate

Azure Migrate is a service that helps you migrate from an on-premise environment to the cloud. Azure Migrate functions as a hub to help you manage the assessment and migration of your on-premises datacenter to Azure.

It provides

1. Unified migration platform
   * a single portal to start, run, and track your migration to Azure
2. Range to tools
   * azure migrate tools include _Azure Migrate:Discovery and assessment_ and _Azure Migrate: Server Migration_ also integrates with other Azure services.
3. Assessment and migration
   * in the azure migrate hub you can assess and migrate you on-premise infrastructure to Azure.

**Integrate Tools**

The Azure Migrate hub includes the following tools to help with migration

1. Azure Migrate: Discovery and assessment
   * Discover and assess on-premise servers running on VMware, Hyper-V and physically servers in preperation for migration to Azure
2. azure Migrate: Server Migration
   * Migrate VMware VMs, Hyper-V VMs, physical servers and other virtualized servers and public cloud VMs to Azure
3. Data Migration Assistant
   * is a standalone tool to assess SQL servers. It helps pinpoint potential problem blocking migration.
   * It identifies unsupported features, new features that can benefit you after migration and the right path for database migration
4. Azure Database Migration Service
   * Migrate on-premise databases to Azure VMs running SQL Server, Azure SQL Database, or SQL Managed Instances
5. Azure App Service migration assistane
   * is a standalone tool to assess on-premise websites for migration to Azure App Service.
6. Azure Data box
   * use this tool to move large amounts to offline data to Azure

**Azure Data box**

Azure data box is a physical migration service that helps transfer large amounts of offline data in a quick, inexpensive and reliable way.\


Once the data from your import order is uploaded to Azure, the disks on the device are wiped clean in accordance with NIST 800-88r1 standards.\
For an export order, the disks are earsed once the device reaches the Azure datacenter

### Identify Azure file movement options

In addition to large scale migration using services like Azure Migrate, Azure also tools designed to help you move or interact with individual files or small file groups.

#### AzCopy

_AzCopy_ is a command0line utility that you can use to copy blobs or files to or from your storage account.\
With AzCopy, you can upload, download, copy file in between storage accounts and even synchronize files. AzCopy can even be configured to work with other cloud providers to help move files back and forth between clouds.

> Synchronizing blobs or files with AzCopy is one-direction synchronization. When you synchronize, you designated the source and destination and AzCopy will copy files or blobs in that direction. It doesnt synchronize bi-directionally based on timestamps or other metadata.

#### Azure Storage Explorer

It is a standalone application that provides GUI to manage files and blobs in you Azure Storage Account.\
BTS it uses AzCopy to perform actions

#### Azure File Sync

Azure file sync is a tool that lets you centralize your file shares in Azure Files and keep the flexibility, performance and compatability of a Windows file server.\
Once you install Azure File sync on your local windows server, it will automatically stay bi-directionally synced with your files in Azure.

With Azure File Sync you can

1. Use any protocol thats available on windows server to access your data locally, including SMB, NFS, FTPS
2. Have as many caches as you need across the world
3. Replace a failed local server by installing Azure File Sync on a new server in the same datacenter
4. Configure cloud tiering so that most frequently accessed files are replicated locally, while infrequently access files are key in the cloud until requested.
