

1. Implement JSON ARM template
2. Declare resources and add flexibility to your template by adding resources, parameters and outputs.


----

JSON ARM templates allow you to specify your projects infrastructure in a declarative and reusable way. You can version and save the templates in the same source control as your development project.

> Bicep is a language for defining your azure resources. It has simpler authoring experience than JSON along with other features that help improve the quality of your infrastructure as code. 


With infrastructure as code, you can maintain both your application code and everything you need to deploy application in a central code repository. The advantages to infrastructure as code are:
1. Consistent configurations
2. Improved scalability
3. Faster deployments
4. Better traceability


The declarative syntax is a way of building the structure and elements that outline what resources will look like without describing the control flow. Declarative syntax is different that imperative syntax, which uses commands for the computer to perform. Imperative syntax focuses on specifying each step in deploying the resources.

ARM templates allow you to automate deployments and use the practice of infrastructure as code. The template code becomes part of your infrastructure and development projects. Just like application code, you can store the IaC files in a source repository and version them.

ARM templates are _idempotent_ which means you can deploy the same template many times and get the same resource types in the same state.

Resource Manager orchestrates deploying the resources so they are created in correct order. When possible, resources will also be created in parallel. So ARM template deployments finish faster than scripted deployments.

Resource manager also has built-in validation. It checks the template before starting the deployment to make sure the deployment will succeed.


If your deployments become more complex, you can break your ARM templates into smaller, reusable components. You can link these smaller templates together at deployment time. You can also nest templates inside other templates


ARM template file structure

| Element        | Description                                                                                                                                                | Required |
| -------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| Schema         | defines the location of the JSON schema file that describes the structure of JSON data.                                                                    | Yes      |
| contentVersion | defines the version of your template.                                                                                                                      | Yes      |
| apiProfile     | defines the collection of API versions of resource types. You can use this value to avoid having to specify API versions for each resource in the tempalte | No       |
| parameters     | section where we can define values that are provided during resource types.                                                                                | No       |
| variables      | define values that are used to simplify template language expressions                                                                                      | No       |
| functions      | define user-defined functions that are available within the template.                                                                                      | No       |
| resources      | defines the actual items you want to deploy or update in a resource group or a subscription                                                                | Yes      |
| output         | specify the values that will be returned at the end of deployment                                                                                          | No       | 


You can deploy an ARM template to azure via
1. Deploy a local template
2. Deploy a linked template
3. Deploy in a continuous deployment pipeline


> The difference between <code>az deployment group create</code> and <code> az group deployment create</code> is that <code> az group deployment create</code> is an old command to be deprecated and will be replaced by <code>az deployment group create</code>. Therefore it is recommended using <code>az deployment group create</code> to deploy resources under the resource group scope


Use linked templates to deploy complex solutions. You can break a template into many templates and deploy these templates through a main template. When you deploy the main template, it triggers the linked template's deployment. You can store and secure the linked template by using a SAS token.


----

To add a resource to your template, you will need to know the resource provider and its types of resources. The syntax for this combination is in the form _{resource-provider}/{resource-type}_ 
For example, to add a storage account resource to your template, you will need the "Microsoft.Storage" resource provider. One of the types for this provider is "storageAccount". So your resource type will be displayed as _Microsoft.Storage/storageAccounts_. 

