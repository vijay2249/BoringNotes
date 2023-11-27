> _Azure Cosmos DB_ is globally distributed database system that allows you to read and write data from the local replicas of your database and it transparently replicates the data to all the regions associated with your Cosmos Account


Contents Covered
- Key benefits provided by Azure Cosmos DB
- Elements in an Azure Cosmos DB account and how they are organized
- Different consistency levels
- APIs supported in Azure Cosmos DB
- How request units impact costs
- Create Azure Cosmos DB resources by using Azure portal


---

## Key Benefits of _Azure Cosmos DB_
It is a fully managed NoSQL database designed to provide low latency, elastic scalability of throughput, well-defined semantics for data consistency, and high availability

You can add or remove the regions associated with your account at any time, and your application doesnt need to be paused for this operation.

Azure Cosmos DB internally handles the data replication between regions with consistency level guarantees of the level you have selected.


---


## Resource Hierarchy
_Azure Cosmos DB_ account is the fundamental unit of global distribution and high availability.<br>
It contains a unique DNS name and you can manage an account by using the Azure portal or the Azure CLI or using different language specific SDKs.


### Elements in _Azure Cosmos DB account_
Az azure cosmos db _container_ is the _fundamental unit_ of scalability.<br>
You can virtually have an unlimited provisioned throughput(RU/s) and storage on a container.<br>
Azure Cosmos DB transparently partitions your container using the logical partition key that you specify in order to elastically scale your provisoned throughput and storage

[Cosmos Entities](../../images/cosmos-entities.png)



### Azure Cosmos DB databases
you can create one or multiple azure cosmos db databases under your account.<br>
A database is analogous to a namespace. A database is the unit of management for a set of azure cosmos db containers


### Azure Cosmos DB containers
Azure Cosmos DB container is the unit of scalability both for provisioned throughput and storage.<br>
A container is horizontally partitioned and then replicated across multiple regions.<br>
The item that you add to the container are automatically grouped into logical partitions, which are distributed across physical partitions based on the partition key.<br.
The throughput on a container is evenly distributed across the physical partitions.


You have an option to share the throughput across the multiple containers in your cosmos db account resource.


A container is a schema-agnostic container of items. Items in a container can have arbitary schemas.<br>
For example, an item that represents a person and an item that represents an automobile can be placed in the same contianer.<br>
By default, all items that you add to a container are automatically indexe without requiring explicit index or schema management.


### Azure cosmos db items
Depending on which API you use, azure cosmos db item can represent either a document in a collection, a row in a table or a node or edge in a graph.


---

## Consistency Levels
Azure Cosmos DB approaches data consistency as a spectrum of choices instead of two extremes. Strong consistency and eventual consistency are at the ends of spectrum, but there are many consistency choices along the spectrum.

Azure Cosmos DB offers five well-defined levels.
1. Strong
    - Offers a linearizability guarantee.
    - Refers to serving requests concurrently
    - The reads are guaranteed to return the most recent committed version of an item.
    - client nevers sees an uncommitted or partial write.
    - users are always guaranteed to read the altest committed write
2. Bounded staleness
    - the reads are guaranteed to honour the consistent-prefix guarantee.
    - the reads might lag behind writes by at most K versions of an item or by T time interval, whichever is reached first.
3. Session
    - within a single client session reads are guaranteed to honour the consistent-prefix, monotonic reads, monotonic writes, read-your-writes and write-follows-reads guarantees.
    - this assumes a single "writer" session or sharing the session token for multiple writers.
4. Consistent Prefix
    - updates are made as single document writes see eventual consistency.
    - updates made as a batch within a transaction, are returned consistent to the transaction in which they were committed.
    - write operations within a transaction of multiple documents are always visible together
5. Eventual
    - there is no ordering guarantee for reads. in the absence of any further writes, the replicas eventually converge.
    - it is the weakest form of consistency coz a client may read the values that are older than the ones it read before.
    - it is ideal when app doesnt require any ordering guarantees


[Consistency Levels](../../images/five-consistency-levels.png)


The consistency levels are region-agnostic and are guranteed for all operations regardless of the region from which the reads and writes are served, the number of regions associated with your azure cosmos db account, or whether your account is configured with a single or multiple write regions.

Read consistency applies to a single read operation scoped within a partition key range or a logical partition. The read operation can be issued by a remote client or a stored procedure


Azure Cosmos DB guarantees that 100% of read requests meet the consistency guarantee for the consistency level choosen.


## Cosmos DB Support API
Offers support for database API, includes
- Azure Cosmos DB for NoSQL - native for azure cosmos db
- MongoDB
- PostgreSQL
- Apache Cassandra
- Table
- Apache Gremlin

API for MongoDB, PostgreSQL, Cassandra, Gremlin and Table implement the wire protocol of open source database engines.


## _Request Units_
With Azure Cosmos DB, you pay for the throughput you provision and the storage you consume on the hourly basis. Throughput must be provisioned to ensure that sufficient system resources are available for your azure cosmos database always.

The cost of all database operations is normalized by azure cosmos db and is expressed by _request units or (RU)_.<br>
A _request unit_ represents the system resources such as CPU, IOPS and memory that are required to perform the database operations supported by azure cosmos db.

> To cost to do a point read, which is fetching a single item by its ID and partition key value, for a 1-KB item is 1RU

[Request Units](../../images/request-units.png)


- __Provisioned throughput mode__:
    - you provision the number of RUs for your application on a per-second basis in increments of 100 RUs per second.
    - you can make your chanes either programmatically or by using azure portal.
    - you can provision throughput at container and database granularity level
- __Serverless Mode__
    - you dont have to provision any throughput when creating resources in azure cosmos db account.
    - at the end of your billing period, you get billed for the number of request units that have been consumed by your database operations
- __Autoscale mode__
    - you can automatically and instantly scale the throughput of your database or container based on its usage.
    - it doesnt the availability, latency, throughput or performance of the workload.
