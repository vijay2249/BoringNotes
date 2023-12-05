[work-azure-blob-storage/](https://learn.microsoft.com/en-us/training/modules/work-azure-blob-storage/)

This demo uses .NET and REST stack.

[storage-blobs-introduction](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blobs-introduction) - for other tech stacks to create appliaction in other langauge client libraries


In this demo I try to use Python (coz i love it 😁)


---


## Create a client Object
Working with any azure resource using the SDK begins with creating a client object.

In this demo, you will learn how to create objects to interact with three types of storage services: storage accounts, containers and blobs


When your application creates a client object, you pass a URI referencing the endpoint to the client constructor. You can construct the endpoint manually or you can query for the endpoint at runtime using the azure storage management library

The complete code is inside _blob-quickstart_ folder

Before writing the program and executing, be sure to login to azure account via Azure CLI `az login` or powershell `Connect-AzAccount` command


It is recommended to use passwordless login hence azure library includes the `DefaultAzureCredential` function that does the authentication for you behind the scenes with using the default and previous authenticated session and token settings.

Create a storage account and assign roles to user account via the below steps
1. Locate __Storage Account__ resource in your azure portal
2. On the overview page, select __Access control(IAM)__ menu in nav bar
3. On the __Access control(IAM)__ page, select the __Role assignments__ tab
4. select __+Add__ button and then __Add role assignment__ from the resulting drop down menu
5. Use the search box to filter the results to the desired role. For this example, search for _Storage Blob Data Contributor_ and select the matching result and then choose Next.
6. Under __Assign access to__, select __User, group, or service principal__, and then choose __+ Select members__
7. In the dialog, search for your Microsoft Entra username (usually your user@domain email address) and then choose Select at the bottom of the dialog.
8. Select __Review + assign__ to go to the final page, and then __Review + assign__ again to complete the process.


## Account Authorization
`DefaultAzureCredential` function that does the authentication process includes obtaining an access token for authorization.<br>
This access token is passed as a credential when the client is instantiated, and the credential persists throughout the client lifetime.<br>
The microsoft entra security principal requesting the token must be assigned an appropriate azure RBAC role that grants access to blob data.



## BlobServiceClient
An authorized `BlobServiceClient` object allows your application to interact with resources at the storage account level 


Blob containers support system properties and user-defined metadata, in addition to the data they contain
- _System Properties_: exists on each blob storage account
    - under the covers, some system properties correspond to certain standard HTTP headers. The library maintains these properties without need to developer involved.
- _User-defined metadata_: consists of one or more name value pairs that you specify for a blob storage resource.


Containers and blobs support custom metadata, represented as HTTP headers. Metadata headers can be set on a request that creates a new container or blob resources or an a request that explictly creates a property on an existing resource<br>
The total size of all metadata pairs can be up to 8KB in size<br>
Metadata name/value pairs are valid HTTP headers, so they adhere to all restrictions governing HTTP headers