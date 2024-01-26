
Identify the features and usage cases for ARM
Describe each ARM component and its usage
Organize ARM with resource groups
Apply ARM locks
Move Azure resoruces between groups, subscriptions and regions
Remove resources and resource groups
Apply and track resource limits



---

ARM enables user to work with the resources in your solution as a group. User can deploy, delete or update all the resources for user solution in a single, coordinated operation.

ARM provides security, auditing and tagging features to help you manage your resources after deployment

## Consistent Management Layer

[Resource Manager](../../images/resource-manager-016a1bac.png)

This image shows how all the tools interact with the same ARM api. The API passes requests to ARM service, which authenticates and authorizes the requests. ARM then routes the requests to the appropriate resource providers


With ARM you can manage your infrastructure through declerative templates rather than scripts<br>
User can define the dependencies between resources so they are deployed in correct order<br>
User can apply access control to all services in your resource group because Role-Based Access Control is natively integrated into the management platform

Arrage resources with the same lifecycle in a resource group. Use tags for all other organizing of resources.


## Azure resource terminology

1. resource
    - manageable item that is available through azure.
2. resource group
    - container that holds related resources for an azure solution.
    this can include all the resources for the solution, or only those resources that you want to manage as a group.
3. resource provider
    - service that supplies the resources you can deploy and manage through resource manager
4. template
    - JSON file that defines one or more resources to deploy to a resource group.
5. declarative syntax


The name of a resource type is in the format: **{resource-provider}/{resource-type}**.<br>
the key vault type is **Microsoft.KeyVault/vaults**


## Resource groups
Resources can be deployed to any new or existing resource group.

Deployments are incremental, if a resource group contains two web apps and you decide to deploy a third, the existing web apps will not be removed.

- Resources can only exist in one resource group
- Resource Groups cannot be renamed
- Resource groups can have resources of many different types(service)
- resource groups can have resources from many different regions

- resource group can contain resources that reside in different regions
- resource group can be used to scope access control for admin actions
- resource can interact with resources in other resource groups. This interaction is common when two resources are related but dont share the same lifecycle.


## ARM locks
resource manager locks allow organizations to put a structure in place that precents the accidental deletion of resources in azure.

- you can associate the lock with a subscription, resource group, or resource
- locks are inherited by child resources

- __Read-Only locks__
- __Delete locks__

Only the owner and user access admin roles can create or delete management locks



## Moving azure resources
When moving resources, both the source group and the target group are locked during the operation. Write and delete operations are blocked on the resource groups until the move completes.

This lock means you cant add/update/delete resources in resource groups.<br>
This doesnt mean the resources arent available

> In most cases, a child resoruce cant be moved independently from its parent resource. Child resources have a resource type in the format of \<resourceProviderNamespace>/\<parentResource>/\<childResources>.
> when you move the parent resource, the child resource is automatically moved with it.


## Remove resources and resource groups

```powershell
Remove-AzResourceGroup --name "resourceGroupName"
```

