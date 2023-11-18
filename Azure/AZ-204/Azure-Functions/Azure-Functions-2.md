Developing Azure Functions

Contents covered
1. Explain the key components of a function and how they are structured
2. Creating triggers and bindings to control when a function runs and where the output is directed
3. Connect a function to services in Azure
4. Create a function by using Azure Functions core tools



## Explore Azure Functions Developemnt

A __Function__ contains two important pieces - your code, which can be written in various languages, and some config, the _function.json_ file.<br>
For compiled languages, ths config file is generated automatically from annotations in your code. For scripting languages, you must provide the config file yourself.

The _function.json_ file defines the functions trigger, bindings and other configuration settings. Every function has one and only trigger. The runtime uses this config file to determine the events to monitor and how to pass data into and return data from the function execution.


Example file
```json
{
    "disabled" : false,
    "bindings" :[
        {
            "type": "bindingType",
            "direction": "in",
            "name": "parameterName",
            "moreConfigs" : "theirValues"
        }
    ]
}
```

the `bindings` property is where you configure both triggers and bindings. Each binding shares a few common settings and some settings that are specific to a particular type of binding. 

Every binding requires the following settings
1. `type` -> String data type -> Name of the binding
2. `direction` -> String data type -> Indicates whether the binding is for receiving data into the function or sending data from the function
3. `name` -> String data type -> the name that is used for the bound data in the function.


### Function app
A function app provides an execution context in Azure in which your function run. As such, its the unit of deployment and management for your functions.

a function app is a way to organize and collectively manage your functions.



### Folder Structure
The code for all the functions in a specific function app is located in a root project folder that contains a host configuration<br>
The _host.json_ file contains the runtime specific configurations and is in the root folder of the function app.



### Local Development environments
Your local functions can connect to live Azure services and you can debug them on your local computer using the full functions runtime.

> _Do not mix local development with portal development in the same function app. When you create an publish functions from a local project, you should not try to maintain or modify project code in the portal._




## Create Triggers and Bindings
_Triggers_ cause a function to run. A trigger defines how a function is invoked and a function must have exactly one trigger. Triggers have associated data, which is often provided as the payload to the function.

_Binding_ to a function is a way of declaratively connecting another resource to the function. Bindings amy be connected as _input bindings_, _output bindings_ or botn. Data from bindings is provided to the function as parameters.

Bindings are optional and a function might have one or multiple input or output bindings.

> Triggers and bindings let you avoid hardcoding access to other services.

### Bindings and Triggers definitions
Triggers and bindings are defined differently depending on the development language
- C# -> by decorating methods and parameters with C# attributes
- Java -> by decorating methods and parameters with Java annotations
- JS/PowerShell/Python/TypeScript -> updating _function.json schema_


For languages that rely on _function.json_, the portal provides a UI for adding bindings in the __Integration__ tab. You can also edit the file directly in the portal in the __Code + test__ tab of your function.



### Binding direction
All triggers and bindings have a direction property in the _function.json_ file

- for triggers, the direction is always `in`
- Input and output bindings use `in` and `out`
- Some bindings support a special direction `inout`. If you use `inout`, only the __Advanced editor__ is svailable via the __Integrate__ tab in the portal

When you use attributes in a class library to configure triggers and bindings, the direction is provided in an attribute constructor or inferref from the parameter type.



### Azure Functions trigger and binding example
Consider the example _function.json_ file
```json
{
    "bindings" :[
        {
            "type": "queueTrigger",
            "direction": "in",
            "name": "order",
            "queueName": "myqueue-items",
            "connection": "MY_STORAGE_ACCT_APP_SETTING"
        },
        {
            "type": "table",
            "direction": "out",
            "name": "$return",
            "tableName": "outTable",
            "connection": "MY_TABLE_STORAGE_ACCT_APP_SETTING"
        }
    ]
}
```

Now lets go through this configuration file<br>

The first element in the `bindings` array is the Queu storage trigger. The `type` and `direction` properties identify the trigger. The `name` property identifies the function parameter that receives the queue message content. The name of the queue to monitor is in `queueName`, and the connection string is in the app setting identified by `connection`

The second element in the array is the Aaure table storage output binding. The `type` and `direction` properties identify the binding. The `name` property specifies how the function provides the new table row, in this case by using the function return value. The name of the table is in `tableName` and the connection string is in the app setting identified by `connection`

Example usage in Javascript
```JavaScript
//from an incoming queue message that is a JSON object, add fields and write to Table Storage.
module.exports = async function(context, order){
    order.PartitionKey = "Orders"
    order.RowKey = generateRandomId();
    context.bindings.order = order
};

function generateRandomId(){
    return Math.random().toString(36).substring(2,15) + Math.random().toString(36).substring(2,15);
}
```
 

Resources to explore more

[Azure Blob storage bindings for Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-bindings-storage-blob?tabs=isolated-process%2Cextensionv5%2Cextensionv3&pivots=programming-language-csharp)
[Azure Cosmos DB bindings for Azure Functions 2.x](https://learn.microsoft.com/en-us/azure/azure-functions/functions-bindings-cosmosdb-v2?tabs=isolated-process%2Cextensionv4&pivots=programming-language-csharp)
[Timer trigger for Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-bindings-timer?tabs=python-v2%2Cisolated-process%2Cnodejs-v4&pivots=programming-language-csharp)
[Azure Functions HTTP triggers and bindings](https://learn.microsoft.com/en-us/azure/azure-functions/functions-bindings-http-webhook?tabs=isolated-process%2Cfunctionsv2&pivots=programming-language-csharp)



## Connect functions to Azure Services
Your function project references connection information by name from its configuration provider. It doesnt directly apply the connection details, allowing them to the changed accross environments. <br>
For example, a trigger definition might include a `connection` property, but you cant set the connection string directly in a `function.json`. Instead you would `connection` to the name of an environment variable that contains the connection string.


### Configure an Identity based connection
Some connections in azure functions are configured to use an identity instead of a secret. Support depends on the extensions using the connection. In some cases, a connection string may still be required in function even though the service to which you are connecting supports identity based connections.

> Identity based connections are not supported with _Durable Functions_


When hosted in the Azure Functions service, identity-based connections use a _managed identity_. The system assigned identity is used by default, although a user assigned identity can be specified with the `credential` and `clientID` properties.


### Grant permission to the identity
Whatever identity is being used must have permissions to perform the intended actions. This is typically done by assigning a role in Azure RBAC or specifying the identity in an access policy, depending on the service to which you are connecting.

> some permissions might be exposed by the target service that are not necessary for all contexts. Where possible, adhere to the __principle of least privilege__, granting the identity only required privileges.



> Create and deploy _Azure Function_ via VSCode -> [reference](https://learn.microsoft.com/en-us/training/modules/develop-azure-functions/5-create-function-visual-studio-code)