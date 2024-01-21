
Azure storage is microsoft cloud storage solution for modern data storage scenarios

- identify features and usage cases for azure storage accounts
- select between different types of azure storage and create storage accounts
- select a storage replication strategy
- configure secure network access to storage endpoints


---

### Implement Azure storage

Azure storage offers a massively scalable object store for data objects. It provides a file system service for the cloud, a messaging store for reliable messaging and a NoSQL store.

Azure storage support three categories of data:
1. Structured data
	1. stored in relational format that has a shared schema. It is often contained in a database table with rows. columns and keys.
2. Unstructured data
	1. least organized data, may not have a clear relationship.
3. Virtual Machine data
	1. includes disks and files. Disks are persistent block storage for azure IaaS VM. Files are fully managed file shared in the cloud


General purpose azure storage accounts have two tiers:
- **Standard** - backed by magnetic hard disk drives (HDD). provides the lowest cost per GB.
- **Premium** - backed by solid-state drives (SSD) and offer consistent low-latency performance. 

> You can't convert a Standard tier storage account to a Premium tier storage account or vice versa. You must create a new storage account with the desired type and copy data, if applicable, to a new storage account.


Things to consider when using azure storage
- Consider durability and availability
- consider secure access
- consider scalability
- consider manageability
- consider data accessibility

---

### Azure storage services

Azure storage offer four data services that can be accessed by using an Azure storage account
- **Azure Blob Storage(container)** - massively scalable object store for text and binary data
- **Azure Files** - Managed file shares for cloud or on-premises deployments
- **Azure Queue Storage** - messaging store for reliable messaging between application components
- **Azure Table Storage** - service that stores nonrelational structured data (aka NoSQL data)


#### Azure Blob Storage (containers)

Blob storage is microsoft object storage solution for the cloud. It is optimized for storing massive amounts of unstructured or _nonrelational_ data such as text or binary data.

It is ideal for
- Serving images or documents directly to a browser
- Storing files for distributed access
- Streaming video and audio
- Storing data for backup and restore, disaster recovery and archiving
- Storing data for analysis by an on-premises or azure hosted service.

Objects in blob storage can be accessed from anywhere in the world via HTTP(S) / via NFS protocol 


#### Azure Files

Azure Files enables you to set up highly available network file shares. Shares can be accessed by using the Server Message Block (SMB) protocol and the Network File System (NFS) protocol. 

Multiple virtual machines can share the same files with both read and write access. You can also read the files by using the REST interface or the storage client libraries.

The storage account credentials are used to provide authentication for access to the file share. All users who have the share mounted should have full read/write access to the share.


#### Azure Queue Storage

Azure Queue Storage is used to store and retrieve messages. Queue messages can be up to 64KB in size and a queue can contain millions of messages. Queues are used to store lists of messages to be processed asynchronously.


#### Azure Table Storage

Azure Table storage is a service that stores non-essential structured data in the cloud providing a key/attribute store with a schemaless design. Because Table storage is schemaless, its easy to adapt your data as the needs of your application evolve

In addition to existing azure table storage service, there is a new azure cosmos db table api offering that provides throughput optimized tables global distribution and automatic secondary indexes


---

Things to consider when choosing azure storage services
- consider storage optimization for massive data
- consider storage with high availability
- consider storage for messages
- consider storage for structured data


> All storage account types are encrypted by using Storage Service Encryption (SSE) for data at rest.


---

### Replication Strategies

The data in azure storage account is always replicated to ensure durability and high availability.
You can choose to replicate your data within the same datacenter, across zonal data centers within same region and even across regions. Replication ensures your storage account meets the Service-Level-Agreement (SLA) for azure storage even if there are failures


Replication Strategies
1. Locally Redundant Storage (LRS)
2. Zone Redundant Storage(ZRS)
3. Geo-Redundant Storage(GRS)
4. Geo-Zone-Redundant Storage(GZRS)

#### Locally Redundant Storage - LRS

Lowest-cost replication option and offers the least durability compared to other strategies. 

LRS can be appropriate in scenarios
- your application stores data that can be easily reconstructed if data loss occurs
- your data is constantly changing like in a live feed and storing the data isnt essential


#### Zone Redundant Storage

Synchronously replicates your data across three storage clusters in a single region. Each storage cluster is physically separated from the others and reside in its own availability zone.

Each availability zone and the ZRS cluster within it, is autonomous and has separate utilities and networking capabilities. ZRS provides excellent performance and low latency

Changing to ZRS from another data replication option requires the physical data movement from a single storage stamp to multiple stamps within a region.


#### Geo-Redundant Storage

Replicates your data to a secondary region - hundreds of miles away from the primary location of the source data.

GRS provides a higher level of durability even during a regional outrage.

If you implement GRS, you have two related options to choose from 
1. GRS replicates your data to another data center in secondary region. The data is available to be read only if microsoft initiates a failover from the primary region to secondary region
2. Read-access geo-redundant storage - is based on GRS.


For a storage account with GRS, or RA-GRS enabled, all data is first replicated with locally redundant storage. An update is first committed to the primary location and replicated by using LRS. The update is then replicated asynchronously to the secondary region by using GRS. Data in the secondary region uses LRS. Both primary and secondary regions manage replicas across separate fault domains and upgrade domains within a storage scale unit. The storage scale unit is the basic replication unit within the datacenter. 


#### Geo-zone Redundant Storage

Combines high availability of zone-redundant storage with protection from regional outages as provided by geo-redundant storage. Data in GZRS storage account is replicated across three azure availability zones in the primary region and also replicated to a secondary region for protection from regional disasters. 

With a GZRS storage account, you can continue to read and write data if an availability zone becomes unavailable or is unrecoverable. You can optionally enable read access to data in the secondary region with read-access geo-redundant storage.


---

### Access Storage

Every object you store in azure storage has a unique URL address. Your account name forms the subdomain portion of the URL address. The combination of the subdomain and the domain name, which is specific to each service, forms an endpoint for your storage account.

| Service | Default endpoint |
| ---- | ---- |
| Container service | \<storageAccount>.blob.core.windows.net |
| Table service | \<storageAccount>.table.core.windows.net |
| Queue service | \<storageAccount>.queue.core.windows.net |
| File service | \<storageAccount>.file.core.windows.net |

To access the _myblob_ data in _mycontainer_ location in your storage account, we use the URL
\<storageAccount>.blob.core.windows.net/mycontainer/myblob

#### Configure custom domains

> Azure Storage doesnt currently provide native support for HTTPS with custom domains. User can implement an Azure Content Delivery Network to access blobs by using custom domains over HTTPS


There are two ways to configure a custom domain
1. **Direct Mapping**
	1. user create a `CNAME` record that points from the subdomain to the Azure storage account
2. **Intermediary domain mapping**
	1. Is applied to a domain thats already in use within Azure. This approach might result in minor downtime while the domain is being mapped. 


---

### Secure Storage Endpoints

> In Azure portal, each service requires certain steps to configure the service endpoints and restrict network access.

Things to know about configuring service endpoints
1. The **Firewall and virtual network** settings restrict access to your storage account from specific subnets on virtual networks or public IPs
2. You can configure the service to allow access to one or more public IP ranges
3. Subnets and virtual networks must exist in the same Azure region or region pair as your storage account