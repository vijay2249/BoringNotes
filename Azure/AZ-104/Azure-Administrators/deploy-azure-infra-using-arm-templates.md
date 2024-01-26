implement json ARM template 

declare resources and add flexibility to your template by adding resources, parameters and outputs


JSON ARM templates allow you to specify project infrastructure in a declarative and reusable way. - define the infrastrucute and configuraion for your deployments

Different policies for each deployment will be implemented through different azure storage accounts.

With infrastructure as code, you can maintain both your application code and everything you need to deploy your application in a central code repository.<br>
The pros of infrastructure as code are
- consistent configurations
- improved scalability
- faster deployments
- better traceability


These ARM templates uses declarative syntax.

ARM templates are _idempotent_, which means you can deploy the same template many times and get the same resource types in the same state.<br>
Resource manager also has built-in validation. It checks the template before starting the deployment to make sure the deployment will succeed.

You can break your ARM templates into smaller, reusable components. You can link these smaller templates together at deployment time. You can also nest templates inside other templates.



You can deploy ARM template to aure via
1. Deploy a local tempalte
2. Deploy a linked template
3. Deploy in a continuous deployment pipeline


The difference between <code>az deployment group create</code> and <code>az group deployment create</code> is that <code>az group deployment create</code> is an old command to be deprecated and will be replaced by <code>az deployment group create</code>. Therefore, it is recommended to use <code>az deployment group create</code> to deploy resources under the resource group scope.

Both commands require the resource group, the region and the name for the deployment so you can easily identify it in the deployment history.

In case of linked templates, when you deploy the main template, it triggers the linked templates deployment as well. You can store and secure the linked template by using SAS token


To add resource to your template, you will need to know the resource provider and its types of resources. The syntax for this combination is in the form of _{resource-provider}/{resource-type}_. [Microsoft.Storage/storageAccounts]


ARM-template parameters let you customize the deployment by providing values that are tailored for a particular environment.For example, you pass in different values based on whether you are deploying to an environment for development, test, production, or others.
You can reuse this template for other deployments that create a storage account by making the name of the storage account by mentioned parameters.

In the `parameters` section of the template, you can specify which values you can imput when you deploy the resources. You are limited to 256 parameters in a template.

Properties of a parameter are
```json
"parameters": {
  "<parameter-name>": {
    "type": "<type-of-parameter-value>",
    "defaultValue": "<default-value-of-parameter>",
    "allowedValues": [
      "<array-of-allowed-values>"
    ],
    "minValue": <minimum-value-for-int>,
    "maxValue": <maximum-value-for-int>,
    "minLength": <minimum-length-for-string-or-array>,
    "maxLength": <maximum-length-for-string-or-array-parameters>,
    "metadata": {
      "description": "<description-of-the-parameter>"
    }
  }
}
```

The allowed types of parameters are
1. string
2. secureString
3. integers
4. boolean
5. object
6. secureObject
7. array


Use _secureString_ for all passwords and secrets. If you are passing sensitive data into object use _secureObject_ data type

The syntax for parameter reuse <code>"[parameters('<parameterNames')]"</code>


In the ARM template output section, you can specify the values that will be returned after a successful deployment. 
Example:
```json
"outputs": {
  "<output-name>": {
    "condition": "<boolean-value-whether-to-output-value>",
    "type": "<type-of-output-value>",
    "value": "<output-value-expression>",
    "copy": {
      "count": <number-of-iterations>,
      "input": <values-for-the-variable>
    }
  }
}
```

output-name -> must be a valid JS identifier

You template can contain all of the resources you need for your azure solution and you can safely execute a template again. Resources will be created only if they didnt already exist and updated only if there's a change.