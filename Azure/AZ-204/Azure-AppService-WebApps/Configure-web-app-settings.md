Contents covered
- Create application settings that are bound to deployment slots
- Explain the options for installing SSL/TLS certificates for your app
- Enable diagnostic logging for you app to aid in monitoring and debugging
- create virtual app to directory mappings

## Configure application settings
In app service, app settings are variables passed as environment variables to your application code.

Application settings can be accessed by navigating to your app's management page and selecting **Configuration** > **Application Settings**.
[App settings](../../images/configure-app-settings.png)

App settings are always encrypted when stored(encrypted-at-rest)


### Adding and editing settings
[App config settings](../../images/app-configure-slotsetting.png)

> In a default Linux container any nested JSON key structure in the app setting name like `ApplicationInsights:InstrumentationKey` needs to be configured in App service as `ApplicationInsights__InstrumentationKey` for the key name.
> In other words, any ":" should be replaced by "__" (double underscore)


### Editing application settings in bulk
For editing multiple settings at once, add all the values in a json file and under the configuration settings, click on advanced and upload this json file.
Example json file
```json
[
  {
    "name": "<key-1>",
    "value": "<value-1>",
    "slotSetting": false
  },
  {
    "name": "<key-2>",
    "value": "<value-2>",
    "slotSetting": false
  },
]
```


### COnfigure connection strings
For ASP.NET and ASP.NET Core developers, the values you set in App service override the ones in Web.config file.<br>
For other language stacks, its better to use app settings instead, because connection strings require special formatting in the variable keys in order to access the values.

Connection strings are also always encrypted when stored(encryption-at-rest)

> There is one case where you may want to use connection strings instead of app settings for non-.NET languages: certain Azure database types are backed up along with the app only if you configure a connection string for the database in your App Service app.


## Configure general settings
In the **Configuration** > **General settings** section you can configure some common settings for your app. Some settings require you to scale up to higher pricing tiers.


Some settings and description
1. __Stack settings__ : The software stack to run the app, including the language and SDK
2. __Platform settings__ : 
    1. __Bitness__: OS 32/64-bit
    2. __WebSocket protocol__
    3. __Always on__: keep the app loaded even when there is no incoming traffic. By default, this is disabled and the app is unloaded after 20 minutes without any incoming requests. It is required for continuous _WebJobs_ or for _WebJobs_ that are triggered using CRON expression
    4. __Managed pipeline version__: The IIS pipeline mode. Set it to __Classic__ if you have a legacy app that requires an older version of IIS
    5. __HTTP version__: http version for communication
    6. __ARR affinity__: In a multi-instance deployment, ensure that the client is routed to the same instance for the life of the session. You can set this option to __Off__ for stateless applications.
3. __Debugging__: Enable remote debuggin for ASP.NET or NodeJs apps. This option turns off automatically after 48hrs
4. __Incoming client certificates__: Require client certificates in manual authentication. TLS mutual authentication is used to restrict access to your app by enabling different types of authentication for it.



## Configure Path Mappings
In the **Configuration** > **Path mappings** section you can configure handler mappings, and virtual application and directory mappings. The **Path mappings** page displays different options based on the OS type.


### Windows apps (uncontainerized)
Handler mappings let you add custom script processors to handle requests for specific file extensions.

To add a custom handler, select **New handler** and configure the handler
- __Extension__: the file extension you want to handle, such as .php or handler.fcgi
- __Script processor__: the abslute path of the script processor. Requests to files that match the file extension are processed by the script processor
- __Arguments__: optional CLI arguments for the script processor.

Each app has a default root path mapped to `D:\home\site\wwwroot`, where your code is deployed by default. 

If you app root is in a different folder or if your repository has more than one application, you can edit or add virtual applications and directories.

You can configure virtual applications and directories by specifying each virtual directory and its corresponding physical path relative to the website root(`D:\home`)<br>
To mark a virtual directory as a web application, clear the __Directory__ checkbox


### Linux and containerized apps
You can add custom storage for your containerized app

select **New Azure Storage Mount** and configure your custom storage with following properties
- Name: the display name
- Configuration options: Basic or advanced
- Storage accounts: The storage account with the container you want
- Storage type: Azure Blobs or Azure files. Windows container apps only support Azure files.
- Storage container: For basic configuration, the container you want
- Share name: for advanced configuration, the file share name
- Access key: the access key
- Mount path: the absolute path in your container to mount the custom storage.



## Enable Diagnostic logging
There are built-in diagnostics to assist with debugging an App Service app

The following table shows the types of logging and description

| Type | Platform | Location | Description |
| - | - | - | - |
| Application Logging | Windows, Linux | App service file system or Azure storage blobs | Logs messages generated by your application code |
| Web server logging | Windows | App service file system or Azure storage blobs | Raw HTTP request data in W3C extended log file format. Each log message includes data like the HTTP method, resource URI, client IP, client port, user agent, response code, and so on. |
| Detailed error logging | Windows | App service file system | Copies of the .html error pages that would have been sent to client browser.|
| Failed request tracing | Windows | App service file system | detailed tracing information on failed requests, including a trace of the IIS components used to process the request and the time taken in each component. |
| Deployment Logging | Windows, Linux | App service file system | Helps determine why a deployment failed. Deployment logging happens automatically and there are no configurable settings for deployment logging. |


> If you regenerate your storage account's access keys, you must reset the respective logging configuration to use the updated access keys. To do this turn the logging feature _off_ and then _on_ again

The __Filesystem__ options for logging is temporary debugging purposes and turns itself off in 12hrs

The __Blob__ option is for long-term loggin and needs a blob storage container to write logs into.

In __App Service Logs__ option in nav bar, you have option to windows/linux related logging options to select and configure which are quite straight-forward

### Stream Logs
Before you stream logs in real time, enable the log type that you want. Any information written to files ending in .txt, .log or .htm that are stored in the `/LogFiles` directory (`D:\home\logfiles`) is streamed by App Service.

> Some types of logging buffer write to the log file, which can result in out of order events in the stream. For example, the application log entry that occurs when a user visits a page may be displayed in the stream before the corresponding HTTP log entry for the request page.

In Azure portal, to stream logs in the Azure portal, naviage to your app and select __Log stream__

In Azure CLI, to stream logs live in cloud shell, run the command
```bash
az webapp log tail --name <appName> --resource-group <resourceGroup>
```


### Access log files
If you configure the azure storage blobs option for log type, you need a client tool that works with azure storage.

For logs stored in the App Service file system, the easiest way is to download the ZIP file in the browser at
- Linux containers : `https://<appName>.scm.azurewebsites.net/api/logs/docker/zip`
- Windows : `https://<appName>.scm.azurewebsites.net/api/dump`

For linux container apps, the ZIP file contains the console logs output for both docker host and docker container.


## Configure security certificates
Azure app service has tools that let you create, upload, import a private certificate or a public certificate into app service.

> A certificate uploaded into an app is stored in a deployment unit that is bound to the app service plans resource group and region combination (internally called a _webspace_)
> This makes the certificate accessible to other apps in the same resource group and region combination.


- Create a free app service managed certificate -> A private certificate thats free of charge and easy to use if you just need to secure your custom domain in app service.
- Purchase an App Service certificate -> a private certificate thats managed by azure. It combines the simplicity of automated certificate management and the flexibility of renewal and export options.
- Import a certificate from key valut -> useful if your use azure key valut to manage your certificates
- Upload a private certificate -> if you already have a private certificate from a third-party provider, you can upload it.
- Upload a public certificate -> public certificates arent used to secure custom domains, but you can load them into your code if you need them to access remote resources.

