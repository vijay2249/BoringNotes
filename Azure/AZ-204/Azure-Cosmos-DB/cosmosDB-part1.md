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



## _Object Model_ in _Azure Cosmos DB_
Azure Cosmos DB has a specific object model used to create and access resources. The azure cosmos db creates resoruces in a hierarchy that consists of accounts, databases, containers, and items.

[Resource Hierarchy](../../images/resource-hierarchy.svg)


Azure Cosmos DB provides language-integrated, transactional execution of JS that lets you write __stored procedures, triggers, user-defined function__.


### Stored Procedures
Stored procedures can create, update, read, query and delete items inside an azure cosmos container.<br>
Stored procedures are registered per collection, and can operate on any document or an attachment present in that collection.

```js
var hiMOMStoredProc = {
    id: "Hi MOM",
    serverScript: function(){
        var context = getContext()
        var response = context.getResponse()
        response.setBody("Hi MOM")
    }
}
```

The context onject provides access to all operations that can be performed in _azure cosmos db_, and access to the request and response objects.


When you create an item by using stored procedures, its inserted into the _azure cosmos container_ and an ID for the newly created item is returned.<br>
Creating an item is an asynchronous operation and depends on the JavaScript vall functions.

The callback function has two parameter
- The error object in case the operation fails
- A return value

The stored prodecure takes an input `documentToCreate`, the body of a document to be created in the current collection. In case a callback isnt provided and theres an error, the DocumentDB runtime throws an error

```js
var createDocumentStoredProc = {
    id: "Hello MOM",
    body: function createMyDocument(documentToCreate){
        var context = getContext()
        var collection = context.getCollection()
        var accepted = collection.createDocument(collection.getSelfLink(), documentToCreate, function(err, documentCreated){
            if(err) throw new Error(err.message)
            context.getResponse().setBody(documentCreated.id)
        })
        if(!accepted) return;
    }
}
```

When defining a stored procedure in the azure portal, input parameters are always sent as a _string_ to the stored procedure. Even if you pass an array of strings as an input, the array is converted to string and sent to the stored procedure.<br>

To work around this, you can define a function within your stored procedure to parse the string as an array.

> All Azure Cosmos DB operations must complete within a limited amount of time. Stored procedures have a limited amount of time to run on the server. All collection functions return a Boolean value that represents whether that operation completes or not.


### Transactions within Stored Procedures
JS functions can implement a continuation-based model to batch or resume execution. The continuation value can be any value of your choice and your applications can then use this value to resume a transaction from a new starting point.

[Transactions process](../../images/transaction-continuation-model.png)


### User defined functions && Triggers
Azure Cosmos DB supports pretriggers and post-triggers. Pretriggers are executed before modifying a database item and post-triggers are executed after modifying a database item.<br>
Triggers arent automatically exeucte, they must be specified for each database operation where you wnat them to execute. After you define a trigger, you should register it by using the azure cosmos db sdk

Pre-trigger example
```js
const validateTodoItemTimestamp = () =>{
    var context = getContext()
    var request = context.getRequest()

    var itemToCreate = request.getBody()
    if(!("timestamp" in itemToCreate)){
        var ts = new Date()
        itemToCreate['timestamp'] = ts.getTime();
    }

    request.setBody(itemToCreate);
} 
```

> Pre-triggers cant have any input parameters.

When triggers are registered, you can specify the operations that it can run with. This trigger should be created with a `TriggerOperation` value of `TriggerOperation.Create`, which means using the trigger in a replace operation isnt permitted.


Post-trigger example
```js
const updateMetadata = () =>{
    var context = getContext()
    var container = context.getCollection()
    var response = context.getResponse()

    var createdItem = response.getBody()

    var filterQuery = `select * from root r where r.id = '_metadata'`
    var accept = container.queryDocuments(container.getSelfLink(), filterQuery, updateMetadataCallback);
    if(!accept) throw "Unable to update metadata, abort the operation";

    function updateMetadataCallback(err, items, responseOptions){
        if(err) throw new Error(err.message)
        var metadataItem = items[0];
        metadataItem.createdItems += 1
        metadataItem.createdName += " " + createdItem.id;

        var accept = container.replaceDocument(metadataItem._self, metadataItem, function(err, itemReplaced){
            if(err) throw new Error("Unable to update metadata, abort operation");
        })
        if(!accept) throw "Unable to update metadata, abort operation"
        return;
    }
}
```

> The transactional execution of triggers in Azure Cosmos DB, the post-trigger runs as part of the same transaction for the underlying item itself. An exception during the post-trigger execution fails the whole transaction. Anything committed is rolled back and an exception returned



### Change feed in azure cosmos db
It is a persistent record of changes to a container in the order they occur.<br>
Change feed support in azure cosmos db works by listening to an azure cosmos db container for anu changes. It then outputs the sorted list of documetns that were changes in the order in which they were modified.<br>
The persisted changes can be processed asynchronously and incrementally, and the output can be distributed across one or more consumers for parallel processing.

