
## Azure App Service

Azure app service is HTTP based service for web-app hosting, REST-api, and mobile backend

### Features
1. Built-in auto scale support
2. Continuous Integration/Deployment Support
    - The Azure protal provides out-of-the box continuous integration and deployment with Azure DevOps Services, Github, BitBucket, FTP, or a local GIT repository on your deployment machine
    - It also provides feature that will auto-sync your commits and updates of the repository on behalf of you.
3. Deployment Slots
    - When you deploy your web app you can use a separate deployment slot instead of default production slot when you are running _standard app service plain tier or better_
4. App Service on Linux
    - App Service can also host web apps natively on linux for supported application stacks. It can also run custom linux containers.
    - If the runtime your application requires isn't supported in the built-in images, you can deploy it with a custom container
    - The languages and their support versions, are updated regularly. You can retrieve the current list by using the command `az webapp list-runtime --os-type linux`


### Limitations
App Service on Linux have some limitations
- App service on linux isn't supported on shared pricing tier
- Azure portal shows only features that currently work for linux apps, as features are enabled, they are activated on the protal
- When deployed to built-in images, you code and content are allocated a storage volume for web content, backed by Azure storage.
- The disk latency of the volume is higher and more variable than the latency of a container filesystem
- Apps that require heavy read-only access to content files may benefit from the custom container option, which places files in the contianer filesystem instead of one the content volume


## Azure App Service Plans
One or more apps can be configured to run on the same computing resources (or in the same App Service plan).

If you have multiple apps, then they all share the same VM instance if apps are in the same app service plan


## Deploy to App Service
App Service supports both automated and manual deployments

### Automated Deployments

Azure supports automated deployment directly from several sources:
1. Auzre DevOps Service
2. Github
3. Bitbucket


### Manual Deployment
There are a few options that you can use to manually push your code to Azure:
1. Git
    - App service web apps feature a git url that you can add as a remote repository.
    - pushing to the remote repository deploys your app
2. CLI 
    - `webapp up` is a feature of `az` CLI that packages your app and deplpoys it. `az webapp up` can create a new app service web app for you it you havent already created one.
3. Zip deploy
    - use `curl` or similar HTTP utility to send a zip of your application files to App Service
4. FTP/S
    - FTP/FTPS is a traditional way of pushing your code to many hosting env, including App service.


### Use deployment slots
You can deploy your app to staging env and then swap your staging and production slots.
The swap operation warms up the necessary worker instances to match your production scale, thus eliminating downtime.


## Authentication and Authorization in App Service
App Service provides built-in authentication and authorization support.

Azure app service allows you to integrate various auth capabilities into your web app or API without implementing them yourself.

Its built directly into the platform and doesnt require any particular language.

### Identity providers
3rd party identity providers authentication is also supported by the platform and the supported parties are
1. Microsoft Identity platform -> /.auth/login/aad
2. Facebook -> /.auth/login/facebook
3. Google -> /.auth/login/google
4. Twitter -> /.auth/login/twitter
5. Any OpenID conntect provider -> /.auth/login/\<providerName>
6. Github -> /.auth/login/github

When you enable auth and authorization with one of these providers, its sign-in endpoint is available for users authentication for validation of authentication tokens from the provider


### How it works
Authentication and authorization module runs in the same sandbox as your application code.<br>
When its enabled, every incoming HTTP request passes through it before being handled by your application code.

This module handles several things for your app
1. Authenticates users and clients with the specified identify providers
2. Validates, stores and refreshes OAuth tokens issued by the configured identity providers
3. Manages the authenticated session
4. Injects identity information into HTTP request headers

The module runs separately from your application code, and can be configured using _azure resource manager settings_ or using a configuration file. No SDKs, specific programming languages, or changes to your application code are required.

> In linux and containers the authentication and authorization module runs in a separate container, isolated from your applciation code. Because it does not run in-process, no direct integration with specific language framework is possible.


### Authentication Flow
The authentication flow is same from all providers, but differs depending on whether you want to sigin in with the providers SDK

1. Without provider SDK
    - The application delegates federated sign-in to app service. This is typically the case with browser apps, which can present the providers login page to the user. The server code manages the sign-in process, so its also called _server-direccted flow or server flow_
2. With provider SDK
    - The application signs users in to the provider manually and then submits the authentication token to app service for validation.
    - The application code manages the sign-in process, so its also called _client-directed flow or client flow_
    - This applies to REST APIs, Azure Functions, JavaScript browser clients, and native mobile apps that sign users in using the providers SDK

Authentication flow steps

| Step | Without provider SDK | With provider SDK|
| - | - | - |
| Sign user in | Redirects client to `/.auth/login/<provider>` | Client code signs user in directly with providers SDK and receives an authentication token|
|Post-authentication| Provider redirects client to `/.auth/login/<provider>/callback` | client code posts token from provider to `/.auth/login/<provider>` for validation|
|Established authenticated session | App Service adds authenticated cookie to response | App service returns its own authentication token to client code|
|Serve authenticated content| Client includes authentication cookie in subsequent requests(automatically handled by browser) | client code presents authentication token in `X-ZUMO-AUTH` header (automatically handled by Mobile Apps client SDKs)|

For client browsers, App Service can automatically direct all unauthenticated users to `/.auth/login/<provider>`.

### Authorization behavior

In azure portal you can configure, app service with many behaviors when an incoming request isn't authenticated
1. Allow unauthenticated requests
    - this option defers authorization of unauthenitcated traffic to your application code.
    - for authenticated requests app service also passes along authenticated information in the HTTP headers.
    - This option provides more flexibility in handling anonymous requests. It lets you present multiple sign-in proviers to your users.
2. Require authentication
    - This option rejects any unauthenticated traffic to your application.
    - This rejection can be a redirect action to one of the configured identity providers
    - In these cases, a browser client is redirected to `/.auth/login/<provider>` for the provider you choose.
    - If the anonymous requests comes from a native mobile app, the returned response is an `HTTP 401 Unauthorized` 

> Restriciting access in this way applies to all calls to your app


### Token store
App service provides a built-in token store, which is a repository of tokens that are associated with the users of your web apps, APIs or native mobile apps. When you enable authentication with any provider, this token store is immediately available to your app.


### Logging and tracing
If you enable application logging, authentication and authorization traces are collected directly in your log files.<br>
If you see an authentication error that you didnt expect, you can conveniently find all the details by looking in your existing application logs


## App Service Networking features
By default, apps hosted in app service are accessible directly through the internet and can reach only internet-hosted endpoints.

There are two main deployment types for Azure App Service.<br>
The multitenant public service hosts App Service plans in the Free, Shared, Basic, Standard, Premium, PremiumV2, and PremiumV3 pricing SKUs. There's also the single-tenant App Service Environment (ASE) hosts Isolated SKU App Service plans directly in your Azure virtual network.


### Multi-tenant App Service networking features
Azure app service is a distributed system.<br>
The roles that handle incoming HTTP or HTTPS requests are called _front ends_<br>
The roles that host the customer workload are called _workers_<br>
All the roles in an App service deployment exists in a multi-tenant network.

Instead of connecting the networks, you need features to handle various aspects of application communication.

Inbound features that app service offer
1. App-assigned address
2. Access restrictions
3. Service endpoints
4. Private endpoints

Outbound features that app service offer
1. Hybrid Connections
2. Gateway-required virtual network integration
3. Virtual network integration


The inbound use case examples for how to use app service networking features to control traffic inbound to your app

| Inbound use case | Feature |
| - | - |
|Support IP-based SSL needs for your app | App-assigned address |
|Support unshared dedicated inbound address for you app | App-assigned address |
Restrict access to your app from a set of well defined address | Access restrictions |


### Default networking behavior

The free and shared SKU plans host customer workloads on multitenant workers.<br>
The basic and higher plans host customer workloads that are dedicated to only one app service plan.

#### Outbound addresses
The worker VMs are broken down in large part by the app service plans. 

The outbound addresses used by your app for making outbound calls are listed in the properties of your app.<br>
These addresses are shared by all the apps running on the same worker VM family in the app service deployment.<br>
If you want to see all the addresses that your app might use in a scale unit, there is a property called `possibleOutboundIpAddresses` that lists them.

##### Find outbound IPs
To find the outbound IP addresses currently used by your app in Azure portal, select __Properties__ in your app's left-hand navigation.

You can also find the same information by running the following CLI command
```bash
az webapp show --resource-group \<groupName> --name \<appName> --query outboundIpAddresses --output tsv
```


To find all possible outbound IP addresses for you app, regardless of pricing tiers, run the following command 
```bash
az webapp show --resource-group \<groupName> --name \<appName> --query possibleOutboundIpAddresses --output tsv
```