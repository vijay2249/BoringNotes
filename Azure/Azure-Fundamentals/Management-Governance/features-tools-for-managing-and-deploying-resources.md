Contents covered
1. Describe Azure Portal
2. Azure cloud shell, including Azure CLI, Azure PowerShell
3. Purpose of Azure Arc
4. Azure Resource Manager (ARM), ARM templates, Bicep

---

## Azure Portal

### What is it
Web-based unified console that provides alternative to command line tools.

User can
- Build, manage, monitor everything from a simple web apps to complex cloud deployments
- Create custom dashboards for an organized view of resources
- Configure accessibility options for an optimal experience


## Azure Cloud Shell
Browser based shell tool that allows user to create, configure, manage azure resources using a shell.<br>
It supports both azure powershell and azure CLI which is a bash shell

This means that no local installation or configuration is required for access resources if you use azure cloud shell<br>
It is authenticated with azure credentials automatically.




## Azure Arc
Managing hybrid and multi-cloud environments can get rapidly complicated. azure provides a host of tools to provision, condifure, and monitor azure resources. 

In utilizing ARM, Arc lets you extend your azure compliance and monitoring to your hybrid and multi-cloud configurations.<br>

_Azure Arc_ provides a centralized, unified way to
1. Manage your entire env together by projecting your existing non-azure resources into ARM
2. Manage multi-cloud and hybrid VM, kubernetes clusters, and databases as if they are running in azure
3. use familiar azure services and management capabilities, regardless of where they live
4. continue using traditional ITOps while introducing DevOps practices to support new cloud and native patterns in your env
5. Configure custom locations as an abstraction layer on top of Azure Arc-enabled kubernetes cluster and cluster extensions


Currently _Azure Arc_ allows user to manage the following resource types hosted outside azure
- Servers
- Kubernetes cluster
- azure data services
- SQL server
- VMs (preview)


## Azure Resource Manager (ARM)
ARM is the deployment and management service. It provides a management layer that enables you to create, update and delete resources.<br>
_Anytime you do anything with your azure resources, bts ARM is involved_

ARM stands in between user requesting the resource and resource processing the request from user.

With ARM,
- User can manager infrastructure through declerative templates rather than scripts (similar to ReactJS or Docker compose files)
- Deploy, manage and monitor all resources for your solution as a group, rather than handling resoruces individually
- Re-deploy solution throughout the development life-cycle and have condifence your resources are deployed in a consistent state
- Define the dependencies between resources, so they are deployed in correct order
- Apply access control to all services because RBAC is natively integrated into the management platform
- Apply tags to resources to logically organize all the resources in your subscription


### Infrastructure as Code
It is a concept where you manage your infrastructure as lines of code. At an introductory level, its things like using azure cloud shell, powershell, or CLI to manage and configure resources.

You can use infrastructure as code concept to manage entire deployments using repeatable templates and configurations. ARM templates and Bicep are two examples of using infrastructure as code with Azure Resource Manager to maintain your environment


## ARM Templates
With this user can describe the resources user want to use in a declerative JSON format.<br>
With this the deployment code verified first before it gets executed. This ensures that the resources will be created and connected correctly.<br>
The template orchestrates the creation of those resources in parallel. Templates can even execute powershell or bash scripts before or after the resources has been set up.


Benefits of _ARM Templates_
- Declerative Syntax
- Repeatable results
- Orchestration
- Modular files
    - break your templates into smaller, reusable components and link them together at deployment time
    - You can also nest one template inside another template.
- Extensibility
    - the deployment scripts extend your ability to set up resources during deployment
    - a script can be included in the template or stored in an external source and referenced in the template.
    - deployment scripts give you the ability to complete your end-to-end environment setup in a single ARM template


## Bicep
It is the language that uses declerative syntax to deploy azure resources.<br>
A Bicep file defines the infrastructure and configuration. Then ARM deploys that environment based on your bicep file. While similar to an ARM template, which is written in JSON, Bicep files tend to use a simpler, more concise style.

Benefits include
- Support for all resource types and API versions
- Simple syntax
- Repeatable results
    - bicep files are idempotent, which means you can deploy the same file many times and get the same resource types in the same state.
- Orchestration
    - Resource manager orchestrates the deployment of interdependent resources so they are created in the correct order for all resources to get up and running without errors
- Modularity
    - you can break your bicep code into managable parts by using modules.
    - The module deploys a set of related resources. Modules enable you to reuse code and simplify environment.