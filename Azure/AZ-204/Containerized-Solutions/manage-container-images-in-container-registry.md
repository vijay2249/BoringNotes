_Azure Container Registy (ACR)_ is a managed, private docker registry service based on the open-source Docker registry.

Contents Covered
1. Features and benefits Azure Container Registry offers
2. How to use ACR tasks to automate builds and deployment
3. Elements in a dockerfile - refer docker folder in repository
4. Build and run an image in the ACR by using Azure CLI


---


## Azure Container Registry
Pull images from an azure container registry to various deployment targets
- __Scalable Orchestration systems__
    - manage containerized applications across clusters of hosts, including Kubernetes, DC/OS and docker swarm
- __Azure Services__
    - support building and running applciations at scale, including Azure Kubernetes Service (AKS), App service, Batch, Service Fabric and other


Use ACR tasks to streamline building, testing, pushing, and deploying images in Azure. Configure build tasks to automate your container OS and framework patching pipeline, and build images automatically when your team commits code to the source control


## Storage Capabilities
All container images in your registry are encrypted at rest. Azure automatically encrypts an image before storing it, and decryts it on the fly when you or your applications and service pull the image.

ACR stores data in the region where the registry is created, to help customers meet data residency and compliance requirements. <br>
If a regional outage occurs, the registry data may become unavailable and isnt automatically recovered.

A feature of Premium service tier, zone redundancy uses azure availability zones to replicate your registry to a minimum of three separate zones in each enabled region

ACR allows you to create as many repositories, images, layers, or tags as you need, up to the registry storage limit



### Create container image in ACR

```bash
az group create --name <groupName> -- location <Location>

az acr create --resource-group <resourceGroup> --name <containerName> --sku Basic

az acr build --image <imageName>:<tag> --registry <containerRegistry> --file Dockerfile .


# check the containers in resource group
az acr repository list --name <containerName> --output table

#run the image
az acr run --registry <containerRegisty> --cmd `$Registry/<image>:<tag>` /dev/null

# clean up resources
az group delete --name <groupName> --no-value
```

