
- decide how many storage accounts you need for your project
- determine the appropriate settings for each storage account
- create a storage account using the azure portal


---

### What is Azure Storage?

Azure provides many ways to store your data, including multiple database options like Azure SQL database, Azure Cosmos DB and Azure Table Storage.
Azure offers multiple ways to store and send messages, such as Azure Queues and Event Hubs. You can even store loose files using services like Azure Files and Azure Blobs.

Azure Storage consists of Azure blobs, Azure Files, Azure Queues, Azure Tables


### What is Storage account?

A container that groups a set of azure storage services together. Only data services from azure storage can be included in a storage account.

The settings you specify when you create the account, or any changes that you make after creating, apply to all services in the storage account.

Other azure data services, such as Azure SQL, Azure Cosmos DB are managed as independent azure resources and cant be included in a storage account. 

#### Storage Account settings

A storage account defines the following settings
- Subscription - sub thats billed for the services in the account
- Location - datacenter that stores the services in the account
- Performance - determines the data services you can have in your storage and the type of hardware disks used to store the data.
- Replication
- Access tier
- Secure transfer required
- Virtual networks - security feature that allows an inbound access requests only from the virtual networks you specify.

---

### Storage account settings

The three settings that apply to the account itself
- Name
- Deployment model
	- is the system azure use to organize your resources. The model defines the API that you use to create, configure, manage those resources.
	- Two deployment models 
		- Resource Manager - current model that uses the azure resource manager API
		- Classic - legacy offering that uses the classic deployment model
	- The key feature difference between the two models is their support for grouping. The resource manager model adds the concept of a resource group, which is not available in the classic model. Resource group lets you deploy and manage a collection of resources as a single unit.
- Account kind
- 