_Azure Container Instance (ACI)_ offers the fastest and simplest way to run a container in Azure, without having to manage any virtual machines and without having to adopt a higher-level service.

Contents Covered
1. Benefits of azure container instances and how resources are grouped
2. deploy a container instance in azure by using the azure cli
3. start and stop container using policies
4. set environment variables in your container instance
5. mount file shares in your container instances


---


## Azure Container Instances

### Container Groups
The top-level resource in azure container instances is the _container group_. <br>
Container Group is a collection of containers that get schedules on the same host machine. The containers in a container group share a lifecycle, resources, local network, and storage volumes. This is similar to pod concept in kubernetes.

> Multi-container groups currently (as of Nov '23) support only linux containres. For windows containers, azure container instances only supports deployment of a single instance.


### Deployment
There are two common ways to deploy a multi-container group
- Resource Manager Template
    - this is recommended when you need to deploy additional Azure service resources when you deploy the container instances.
- YAML file
    - recommended when your deployment includes only container instances.


### Resource allocation
ACI allocates resources such as CPU, memory to container group by adding the resource requests of the instance in the group.


### Networking
Container groups share an IP address and a port namespace on that IP address. TO enable external clients to reach a container within the group, you must expose the port on the IP address and from the container.<br>
Because containers within the group share a port namespace, port mapping isnt supported. Containers within a group can reach each other via loaclhost on the ports that they have exposed, even if those ports arent exposed externally on the groups IP address.


### Storage
You can specify external volumes t omount within a container group. You can map those volumes into specific paths within the individual containers in a group.
_Azure File share_, _Secret_, _Empty directory_, _Clone git repo_ are supported volumes.


Creating container instance using Azure CLI

```bash
DNS_NAME_LABEL=<someRandomUniqueName>

# create container
az container create --resource-group <resourceGroup> --name <containerName> --image <imagePath> --ports <exposedPorts> --dns-name-label $DNS_NAME_LABEL --location <deployLocation> 

# verify container is running
az container show --resource-group <resourceGroup> --name <containerName> --query "{FQDN:ipAddress.fqdn,ProvisioningState:provisioningState}" --out table
```


### Restart Policies
With a configurable restart policy, you can specify that your containers are stopped when their processes have completed. because container instances are billed by second, you are charged only for the compute resources used while the container executing your task is running.


When you create a container group in azure container instances, you can specify one of three restart policy settings.
1. `Always` - containers in the container group are always restarted. This is the default setting applied when no restart policy is specified
2. `Never` - containers in the container group are never restarted. The containers run at most once
3. `OnFailure` - Containers in the container group are restarted only when the process executed in the container fails(when it terminates with a non-zero exit code). The containers are run at least once.

```bash
# restart policy command
az container create --resource-group <resourceGroup> --name <containerName> --image <containerImage> --restart-policy <restartPolicyString>
```


### set env values
These env variables are similar to the `--env` command line argument to `docker run` command

```bash
# env values example
az container create --resource-group <resourceGroup> --name <containerName> --image <containerImage> --restart-policy <restartPolicyString> --environment-variables 'key1='='value1' 'key2'='value2'
```

Envrionment variables with secure values arent visible in your containers properties. Their values can be accessed only from within the container.<br>
For example, container properties viewed in the Azure portal or Azure CLI display only a secure variables name not its value


---

By default Azure container instances are _stateless_.<br>
If container stops or crashes, all of its state is lost. To persist state beyond the lifetime of the container, you must mount a volume from an external store. 

ACI can mount an azure file share created with azure files. Azure files offers fully managed file shares in the cloud that are accessible via the industry standard SMB protocol. <br>
Using an azure file share with azure container instances provides file-sharing features similar to using an azure file share with azure virtual machines.

Limitations of file sharing
1. You can only mount azure files shares to linux containers
2. azure file share volume mount requires the linux container run as root
3. azure file share volume mounts are limited to CIFS support


```bash
# mount azure files to container via azure cli
az container create \
--resource-group <resoruceGroup> \
--name <containerName> \
--image <containerImagePath> \
--dns-name-lebel <DNS_NAME_LABEL> \
--ports <portExposed> \
--azure-file-volume-account-name <storageAccountName> \
--azure-file-volume-account-key <storageAccountAccessKey> \
--azure-file-volume-share-name $ACI_PERS_SHARE_NAME \
--azure-file-volume-mount-path <mountPathInContainer>
```

```yaml
# mount azure files to container via YAML file
apiVersion: '2019-12-01'
location: eastus
name: file-share-demo
properties:
  containers:
  - name: hellofiles
    properties:
      environmentVariables: []
      image: mcr.microsoft.com/azuredocs/aci-hellofiles
      ports:
      - port: 80
      resources:
        requests:
          cpu: 1.0
          memoryInGB: 1.5
      volumeMounts:
      - mountPath: /aci/logs/
        name: filesharevolume
      - mountPath: <mountPath2>
        name: share2
  osType: Linux
  restartPolicy: Always
  ipAddress:
    type: Public
    ports:
      - port: 80
    dnsNameLabel: aci-demo
  volumes:
  - name: filesharevolume
    azureFile:
      sharename: acishare
      storageAccountName: <Storage account name>
      storageAccountKey: <Storage account key>
  - name: secondVolume
    azureFile:
        shareName: share2
        storageAccountName: <storageAccountName>
        storageAccountKey: <storageAccountKey>
tags: {}
type: Microsoft.ContainerInstance/containerGroups
```


