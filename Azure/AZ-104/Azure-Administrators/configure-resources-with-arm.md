List advantages of Azure templates
Identify the azure templates schema components
Specify the azure template parameters
Locate and use azure quickstart templates


Automate the deployment of VM by using azure resource manager templates


## ARM tempaltes
It precisely defines all the resource manager resources in a deployment. you can deploy a resource manager template into a resource group as a single operation

these templates are written in JSON, which allows you to express data stored as an object in text.

You are limited to 256 parameters in a template. You can reduce the number of parameters by using objects that contains multiple properties.


## Bicep Templates
Azure Bicep is a domain specific language(DSL) that uses declarative syntax to deploy azure resource. it provides cocise syntax, reliable type safety and support for code reuse.

Bicep is transparent abstraction over ARM template JSON and doesnt lose any of the JSON template capabilities

[Bicep working process](../../images/bicep.png)

When you deploy a resource to azure, the tooling thats buit into Bicep converts your Bicep template into JSON template. This is known as "transpilation". 

If you run the same template again, if the resource already exists and no change is detected in the properties, no action is taken. If the resource already exists and a property has changed, the resoruce is updated. If the resource doesnt exist, its created.