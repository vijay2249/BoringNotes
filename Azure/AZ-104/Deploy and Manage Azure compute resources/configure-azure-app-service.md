- identify features and usage cases for azure app service
- create an app with azure app service
- configure deployment settings, specifically deployment slots
- secure your azure app service app
- configure custom domain names
- back up and restore you azure app service app
- configure azure application insights


---

Azure App Service brings together everything you need to create websites, mobile backends, and web APIs for any platform or device. Applications run and scale with ease in both windows and linux based environments.

Quick-start products:
- ASP.NET
- Java
- Node.js
- PHP
- HTML
- Ruby
- WordPress
- Custom containers (windows/linux)
- Python on Linux (Django/Flask)


---

### Continuous Integration and deployment

Azure portal provides out-of-the-box continuous integration and deployment with azure devops, github, bitbucket, FTP or a local git repository on your development machine

App services auto-synchronizes your code and any feature changes to the code into your web app.

Things to know about continuous deployment
- Automated deployment 
	- Azure devops
	- github
	- bitbucket
- Manual deployment
	- Git
	- CLI
	- Visual Studio
	- FTP(S)

---

### Deployment slots

Deployment slots are live apps that have their own hostnames

Deployment slots are available in the standard, premium, and isolated app service pricing tiers. Your app needs to be running in one of these tiers to use deployment slots

App content and configuration elements can be swapped between two deployment slots, including the production slot.


Things to consider when using deployment slots
- Consider validation
- consider reduction in downtime
- consider restoring to last known good site
- consider auto swap

New deployment slots can be empty or cloned.

Deployment slot settings fall into three categories
- Slot-specific app settings and connection settings
- Continuous deployment settings
- Azure app service authentication settings.

When you clone a configuration from another deployment slot, the cloned configuration is editable.

#### Swapped settings versus slot-specific settings

The following table lists the settings that are swapped between deployment slots, and settings that remain in the source slot (slot-specific)

| Swapped settings | Slot-specific settings |
| ---------------- | ---------------------- |
| General settings, such as framework version, 32/64-bit, web sockets  <br>App settings *****  <br>Connection strings *****  <br>Handler mappings  <br>Public certificates  <br>WebJobs content  <br>Hybrid connections ******  <br>Service endpoints ******  <br>Azure Content Delivery Network ******  <br>Path mapping                 | Custom domain names  <br>Nonpublic certificates and TLS/SSL settings  <br>Scale settings  <br>Always On  <br>IP restrictions  <br>WebJobs schedulers  <br>Diagnostic settings  <br>Cross-origin resource sharing (CORS)  <br>Virtual network integration  <br>Managed identities  <br>Settings that end with the suffix _EXTENSION_VERSION                       |

---

### Secure App service app

Azure app service provides built in authentication and authorization support. 

The authentication and authorization security module in azure app service runs in the same environment as your application code, yet separately.

The security module is configured by using app settings. No SDKs, specific languages, or changes to your application code are required.
When you enable the security module, every incoming HTTP request passes through the module before its handled by your application code.
The security module handles several tasks for your app
- Authenticate users with the specific tokens
- Validate, store and refresh tokens
- manage the authenticated session
- inject identity information into request headers


Things to consider when using app service for app security
- Allow anonymous requests(no action) for only necessary endpoints
- Logging and tracing


---

You can create custom domains in azure portal itself and configure custom domain name for your app


---

Backup and restore feature in azure app service lets you easily create backups manually or on a schedule. You can configure the backups to be retained for a specific or indefinite amount of time. You can restore the app or site to a snapshot of a previous state by overwriting the existing content or restoring to another app or site.


Things to know about backup and restore
- to use the backup and restore feature, you need the standard or premium tier app service plan for your app or site
- You need an azure storage account and container in the same subscription as the app to back up
- Azure app service can backup the following information to an azure storage account and container you configure
	- App configuration settings
	- file content
	- any database connected to your app.
- Each backup consists of zip file(contains the back-up data for app/site) and XML file (manifest of your zip file contents)
- full backups are the default
- Backups can hold up to 10GB of app and database content