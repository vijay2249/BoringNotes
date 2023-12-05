_Azure Container Apps_ provide the flexibility you need with a serverless container service built for microservice applications and robust autoscaling capabilities without the overhead of managing complex infrastructure.


Contents covered
- Features/Benefits of Azure Container Apps
- Deploy container apps in azure by using azure cli
- utilize azure container apps built-in authentication and authorization
- create revisions and implement app secrets


---


## Azure Container Apps
These enables you to run microservices and containerized applications on a serverless platform that runs on top of azure kubernetes service.

Common uses of azure container apps include
- Deploying API endpoints
- Hosting background processing applications
- Handling event-driven processing
- Running microservices

> Applications built on azure container apps can dynamically scale based on HTTP traffic, event-driven processing, CPU, or memory load


With azure container apps, user can
- run multiple container revisions and manage the container apps application lifecycle
- autoscale apps based on KEDA supported scale trigger.
- enable HTTPS ingress without having to manage other azure infrastructure
- split traffic across multiple versions of an application for Blue/Green deployments and A/B testing scenarios
- Use internal ingress and service discovery for secure internal-only endpoints with built-in DNS based service discovery
<!-- - Build microservices with Dapr and access its rich set of API -->
- Run containers from any registry, public, private including Docker Hub and ACR
- Use azure cli extension, azure portal, ARM templates to manage your applications
- Securely manage secrets directly in your application
- Provide an existing virtual network when creating an environment for your container apps.
- Monitor logs using azure log analytics


Container apps in the same environment are deployed in the same virtual network and write the logs to the same log analytics workspace.

### Dapr Integration
When you implement a system composed of microservices, function calls are spread across the network. To support the distributed nature of microservices, you need to account for failures, retires and timeouts.<br>
While container apps features the building blocks for running microservices, use of Dapr provides an even richer microservices programming model.<br>
Dapr includes features like observability, pub/sub and service-to-service incovation with mutual TLS, retires and more.


## Deployment a container app

```bash
# add azure container apps extension
az extension add --name containerapp --upgrade

# register the Microsoft.App namespace
az provider register --namespace Microsoft.App

# register the `Microsoft.OperationalInsight` provider for the azure monitor log analytics workspace if you havent used it before
az provider register --namespace Microsoft.OperationalInsights

# set env values
myRG=<resourceGroup>
myLocation=<resourceLocation>
myAppContEnv=<appEnvironment>

# create resource
az group create --name $myRG --location $myLocation

# create env
az containerapp env create --name $myAppContEnv --resource-group $myRG --location $myLocation

# create container app
az containerapp create \
    --name <containerAppName> \
    --resource-group $myRG \
    --environment $myAppContEnv \
    --image <containerImagePath> \
    --target-port <exposedPorts> \
    --ingress 'external' \  #this makes you container app available to public requests.
    --query properties.configuration.ingress.fqdn
```


## Containers in Azure Container Apps
