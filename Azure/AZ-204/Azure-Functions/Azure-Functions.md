# Azure-Functions

Contents covered

1. Explain functional difference between _Azure Functions_, _Azure Logic Apps_, and _WebJobs_
2. Describe _Azure Functions_
3. Describe how _Azure Functions_ scale to meet business needs

### Discover **Azure Functions**

**Azure Functions** is a serverless solution that allows you to write less code, maintain less infrastructure, and save on costs.\


Instead of worrying abou deploying and maintaining servers, the cloud infrastructure provides all the up-to-date resources needed to keep your applications running

Azure Functions supports _triggers_, which are ways to start execution of your code, and _bindings_ which are ways to simplify coding for input and output data.

#### Compare **Azure Functions** and **Azure Logic Apps**

Both functions and logic apps are Azure services that enable serverless workloads

_Azure Functions_ is a serverless compute service, _Azure Logic Apps_ is a serverless workflow integration platform.

An _Orchestration_ is a collection of functions or steps, called actions in Logic Apps, that are executed to accomplish a complex task

For _Azure Functions_ you can develop orchestrations by writing code and using the **Durable Functions extension**, for _Logic Apps_ you can create _orchestrations_ by using a GUI or editing configuration files.

#### Differences b/w Azure Functions and Azure Logic Apps

|                   | Azure Functions                                                    | Azure Logic Apps                                                 |
| ----------------- | ------------------------------------------------------------------ | ---------------------------------------------------------------- |
| Development       | Code first (imperative coding style)                               | Designer-first (declarative coding)                              |
| Connectivity      | About dozen built-in binding types, write code for custom bindings | Large collection of connectors, also can build custom connectors |
| Actions           | Each activity is an Azure function                                 | Large collection of ready-made actions                           |
| Monitoring        | Azure application insights                                         | Azure portal, Azure monitor logs                                 |
| Management        | REST API                                                           | Azure Portal, REST API, PowerShell                               |
| Execution context | Runs in Azure or locally                                           | Runs in Azure, locally, on-premise                               |

#### **Azure Functions** vs **WebJobs**

Like Azure Functions, Azure App Service WebJobs with the WebJobs SDK is a code-first integration service that is designed for developers.

Azure Functions is built on the _WebJobs SDK_, so it shared many of the same event triggers and connections to other Azure services.

It if preferred to choose Azure Functions over WebJobs if your application has following properties

1. Serverless app model with automatice scaling
2. Develop and test in browser
3. Pay-per-use pricing
4. Integration with logic apps.

Azure Functions has more features than Azure App Service WebJobs in general.

### Compare Azure Functions hosting options

When you create a function app in Azure, you must choose a hosting plan for your app. All hosting plans are generally available on both Linux and Windows VMs

The hosting plan you choose dictates the following behaviors

* How your function app is scaled
* The resources available to each function app instance
* Support for advanced functionality, such as Azure Virtual Network connectivity

For complete benefits and pricings refer documentation.

#### Function app timeout duration

The `functionTimeout` property in the _host.json_ project file specifies the timeout duration for functions in a function app. This property applies specifically to dunction executions. After the trigger starts function execution, the function needs to return/respond within the timeout duration

#### Storage account requirements

On only plan, a function requires a general Azure Storage account, which supports Azure Blob, Queue, Files and Table storage\
This is because functions rely on Azure Storage for operations such as managing triggers and logging function executions, but some storage accounts dont support queues and tables.

### Scale Azure Functions

An instance of the host is the entire function app, meaning all functions within a function app share resource within an instance and scale at the same time.\
Function apps that share the same consumption plan scale independently.

Function code files are stored on Azure Files shares on the functions main storage account. When you delete the main storage account of the function app, the function code files are also deleted and they cant be recovered.

#### Runtime scaling

Azure Functions uses a component called the _scale controller_ to monitor the rate of events and determine whether to scale out or scale in. The scale controller uses heuristics for each trigger type.\
For example, when you are using an Azure Queue storage trigger, it scales based on the queue length and the age of the oldest queue message.

> The unit of scle for Azure Functions is the function app, When the function app is scaled out, more resources are allocated to run multiple instances of the Azure Functions host. Conversely, as compute demand is reduced, the scale controller removes function host instances. The number of instances is eventually "scaled in" to zero when no functions are running within a function

[image](../../images/central-listener.png)

#### Limit Scale out

By default, Consumption plan functions scale out to as many as 200 instances, and premium plan functions scales out to as many as 100 instances. You can specify a lower maz for a specific app by modifying the `functionAppScaleLimit` value.

The `functionAppScaleLimit` can be set to 0 or _null_ for unrestricted or a valid value bbetween 1 and the app maximum
