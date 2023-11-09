1. compare compute types including container instances, VMs and functions
2. describe VM options, include VMs, VM scale sets, VM availability sets, Azure virtual Desktop
3. describe resources required for virtual machines
4. application hosting options, including Azure web apps, containers, virtual machines
5. virtual networking, including the purpose of Azure virtual networks, Azure virtual subnets, peering, Azure DNS, VPN gateway, ExpressRoute
6. Define public and private endpoints


## Azure Virtual Machines
VMs provide infrastructure as a Service (IaaS) in the form of a virtualized server.

Just like a physcial computer, you can customize all the software running on your VM.

VMs are ideal choice when you need
1. total control over the OS
2. ability to run custom software
3. use custom hosting configuration

An image is a template used to create a VM and may already include an OS and other software like development tools or web hosting environments

### Scale VMs in azure
you can run single VM or you can group VMs together to provide high availability, scalabilty and redundancy
Azure can also manage the grouping of VMs for you with features such as scale sets and availability sets.


### Virtual machine scale sets
VM scale sets let you create and manage a group of identical, load-balanced VMs.

If you simply created multiple VMs with same purpose, you manually have to configure them with same configs and have to monitor them etc.

Instead, with virtual machine scale sets, Azure automates most of the manual work. Scale sets allow you to centrally manage, configure, and upgrade a large number of VMs in minutes.

The number of VM instances can automatically increase or decrease in response to demand.


### Virtual Machine availability sets
VM availabilty sets are another tool to help you build a more resilitent, highly available environment.<br>
Availability sets are designed to ensure that VMs stagger updates and have varied power and network connectivity, preventing you from losing all your VMs with a single network or power failure

Availability sets do this by grouping VMs in two ways:
1. Update Domain
    - VMs can be rebooted at the same time. This allows you to apply updates while knowing that only one update domain grouping will be offline at a time.
2. Fault Domain
    - The fault domain groups your VMs by common power source and network switch. By default, an availability set will split your VMs across up to three fault domains. This helps protect aganist a physical power or networking failure by having VMs in different fault domains.


### VM Resources
1. Size - purpose, number of processor cores, amount of RAM
2. Stoage Disks - HDD, SSD etc.
3. Networking - virtual network, public IP address, port configs.


### Creating Azure Virtual Machines

1. Sign in to the Azure Portal
2. Select "Create Resource" -> Virtual Machines -> Create 
3. Change the following values:
    - Virtual Machine name: \<Your Virtual Machine Name>
    - Resource Group : select the group that starts with _learn_
    - Run with Azure Spot discount: unchecked
    - username: \<Add your username for the VM>
    - password: \<password to authenticate user in VM>
    - confirm password: \<confirm your auth password>
    - Public inbound posts: None

    - Remaining values leave them to the default selected values

4. Select **Review+Create** 

--

To verfiy whether VM is created or not, Go to _Resource groups_ in your azure portal, and you should see the VM id in the list else the VM is not created. If not created the repeat the above process correctly.

---

### creata a linux VM and install Nginx
We can create azure VM via CLI commands

After your VM is created, you will use the custom script extension to install Nginx.
The custom script extension is an easy way to download and run scripts on your Azure VMs.

```bash
az vm create --resource-group [sandbox resource group name] --name my-vm --public-ip-sku Standard --image Ubuntu2204 --admin-username azureuser --generate-ssh-keys
```


-> Run the following command to configure Nginx on your VM
```bash
az vm extension set --resource-group [sandbox resource group name] --vm-name my-vm --name customScript --publisher Microsoft.Azure.Extensions --version 2.1 --settings '{"fileUris":["https://raw.githubusercontent.com/MicrosoftDocs/mslearn-welcome-to-azure/master/configure-nginx.sh"]}' --protected-settings '{"commandToExecute": "./configure-nginx.sh"}'
```

This command uses the custom script extension to run a bash script on your VM.
The script is stored on GitHub. While the command runs, you can choose to examine the bash scripts from a separate browser tabs,

```bash
#!/bin/bash

# Update apt cache.
sudo apt-get update

# Install Nginx.
sudo apt-get install -y nginx

# Set the home page.
echo "<html><body><h2>Welcome to Azure! My name is $(hostname).</h2></body></html>" | sudo tee -a /var/www/html/index.html

```

This second bash script simply upgrades system dependencies and create a simple web page for disaply


---

## Azure Virtual Desktops

Azure virtual desktop is another type of virtual machine in Azure ecosystem.<br>
Azure virtual desktop works across devices and operating systems, and works with apps that you can use to access remot desktops or most modern browsers

Azure virtual desktop provides centralized security management for users desktops with microsoft entra ID.<br>
You can also enable MFA for user sign-in.<br>
You can also secure access to data by assigning granular role-based access controls to users (RBAC method for data sharing between users)


==> What is multi-session windows users <==
Azure virtual desktop lets you use windows 10/11 enterprise multi-session, the only windows client-based operating system that enables multiple concurrent users on a single VM.

---

## Azure Containers
Containers are a virtualization environment. Much like running virtual machines on a single physical host, you can run multiple containers on a single physical or virtual host.

Unlike virtual machines, you dont manage the operating system for a container.
Containers are lightweight and designed to be created, scaled out and stopped dynamically.<br>
Containers are designed to allow you to respond to changes on demand
One of the most popular container engines is _Docker_ and most cloud providers support _Docker_ software


### VMs vs Containers
See _Docker_ folder _BoringNotes_ repository

### Azure container Instances
Azure container instances are a platform as a service(PaaS) offering.<br>
These instances allow you to upload your containers and then the service will run the container for users.

### Azure Container Apps
These are similar in many ways to container instances.
They allow you to get up and running right away, they remove the container management piece, and they are _PaaS_ offering

Apps have extra benefits such as the ability to incorporate load balancing and scaling. These other functions allow you to be more elastic in your design


### Azure Kubernetes Service(AKS)
Azure kubernetes service is a container orchestration service. It manages the lifecycle of containers
When you are deploying a fleet of containers, AKS can make fleet management simpler and more efficient


----

## Azure Functions
Azure functions is an event-driven, serverless compute option that doesnt require maintaining VM or containers.<br>
If you build an app using VMs or containers, those resources have to be "running" in order for your app to function. With Azure functions, an event wakes the function, alleviating the need to keep the resources provisioned when there are no events.


### Serverless Computing in Azure
The management of servers is handleded by third-pary hence the business code just needs to be submitted to run the application with high-availability.<br>
This is _event-driven service_, hence when there are no events in application the resources are put to sleep for efficiency and when there are any events then the resources starts to spin up

--

Azure functions are ideal when you are only concerned about the code running your service and not about the underlying platform or infrastructure.<br>
Fuctions are commonly used when you need to perform work in response to an event(often via REST request), timer, or message from another Azure service and when that work can be completed quickly within seconds or less.

Functions scale automatically based on demand
Functions can be stateless or stateful. When they are stateless(the default), they behave as if they are restarted every time they respond to an event. When they are stateful(called Durable functions), a context is passed through the function to track prior activity.


----

## Application Hosting options
VMs give you the max control of the hosting env and allow you to configure it exactly how you want.
Containers, with the ability to isolate and individually manage different aspects of hosting solutions can also be a robust and compelling option.


### Azure App Services
It enables you to build and host web apps, background jobs, mobile back-ends and RESTful APIs in the programming language of users choice without managing infrastructure.

App service supports windows and linux OS.
It enables automated deployments from Github, Azure DevOps, or any git repo to support a continuous deployment model

Azure app service is an HTTP-based service for hosting web applications, REST APIs, and mobile backends.

#### Types of app services
App services handles most of the infrastructure decisions you deal with in hosting web-accessible apps:
1. deploument and management are integrated into the platform
2. endpoints can be secured
3. sites can be scaled quickly to handle high traffic loads
4. the built-in load-balancing and traffic manager provide high availability.

##### WEB apps
App service includes full support for hosting web apps using ASP.NET, APS.NET core, Java, Ruby, Python etc..

##### API apps
you can build REST-based web APIs by using your choice of languages and frameworks.
you can get full swagger support and the ability to package and publish you API in Azure marketplace.
the produced apps can be consumed from any HTTP or HTTPS based clients

##### Web Jobs
you can use the webjobs feature to run a program or a script in the same context as a web app, api app, or mobile app.
They can be scheduled or run by a trigger.

Webjobs are often used to run background tasks as part of your application logic.

##### Mobile apps
Feature of app service to quickly build a backend for IOS and Android apps.

features include

->store mobile app data in a cloud based SQL db<br>
-> authenticate customers aganist common social providers, such as MSA, Google, FB etc.<br>
-> send push notifications<br>
-> execute custom back-end logic in Nodejs or C#


----


## Azure Virtual Networking
Azure virtual networks and virtual subnets enable Azure resources, such as VMs, web apps, and databases to communicate with each other, with users on the internet and with your on-premises client computers.

Azure virtual networks provide the following key networking capabilities:
1. Isolation and segmenatation
2. Internet communications
3. communicate between azure resources
4. communicate with on-premise resources
5. route network traffic
6. filter network traffic
7. connect virtual networks


Aure virtual networking supports both public and private endpoints to enable communcation between external or internal resources with other internal resources.

--


### Isolation and Segmentation

Azure virtual networks allow you to create multiple isolated virtual networks.
When you set up a virtual network, you define a private IP address space by using either public or private IP address ranges.
The IP range only exists within the virtual network and isnt internet routable. You can divide that IP address space into subnets and allocate part of the defined address space to each named subnet.

For name resolution, you can use the name resolution service that built into Azure. You can also configure the virtual network to use either an internal or an external DNS server.

--

### Internet Communications
You can enable incoming connections from the internet by assigning a public IP address to an Azure resource or putting the resource behind a public load balancer.

--

### Communicate between Azure resources
-> Virtual networks can connect not only VMs but other Azure resources such as the App Service Environment for Power Apps, Azure Kubernetes Service and Azure VM scale sets

-> Service endpoints can connect to other Azure resource types, such as Azure SQL databases and storage accounts. This approach enables you to link multiple Azure resources to virtual networks to improve security and provide optimal routing between resources.


--

### Communicate with on-premises resources
Azure virtual networks enable you to link resources together in your on-premises environment and within your azure subscription.

There are 3 mechanisms for you to achieve this connectivity
- Point-to-site virtual private network connections are from a computer outside your organization back into your corporate network. In this case, the client computer initiates an encrypted VPN connection to connect to the Azure virtual network
- Site-to-site virtual private networks link your on-premise VPN device or gateway to the Azure VN gateway in a virtual network. In effect, the devices in Azure can appear as being on the local network. The connection is enrypted and works over the internet.
- Azure _ExpressRoute_ provides a dedicated private connectivity to Azure that doesnt travel over the internet. _ExpressRoute_ is useful for environments where you need greater bandwidth and even higher level of security

--

### Route Network Traffic
By defualt, Azure routes traffic between subnets on any connected virtual networks, on-premises networks and the internet.

User can control network traffic by following methods:
1. Route tables allow you to define rules about how traffic should be directed
2. Border Gateway Protocol(BGP) works with Azure VPN gateways, Azure Route Server or Azure ExpressRoute to propagate on-premises BGP routes to Azure virtual networks

--

### Filter network traffic
-> Network security groups are Azure resources that can contain multiple inbound and outbound security rules. You can define these rules to allow or block traffic, based on factors such as source or destination IP address, port, protocol

-> Network virtual appliances are specialized VMs that can be compared to hardened network appliance. A network virtual appliance carriers out a particular network function, such as running a firewall or performing wide area network optimization


--

### Connect Virtual Networks
You can link virtual networks together by using virtual network peering.
Network traffic between peered networks is private, and travels on the microsoft backbone network, never entering the public internet.

User-defined routes(UDR) allow you to control the routing tables between subnets within a virtual networks or between virtual networks. This allwos for greater control over network traffic flow.

---

## Configure Network Access

To verify the VMs created and to verify that VM is running run the command __az vm list__

--

### Accessing web-server from VM

__az vm list-ip-addresses__ this command will return the VM ip address

```bash
IPADDRESS="$(az vm list-ip-addresses --resource-group [sandbox resource group name] --name my-vm --query "[].virtualMachine.network.publicIpAddresses[*].ipAddress" --output tsv)"
```

Now you have env variable __IPADDRESS__ which contains the IP address of your VM

Now you can use the curl command to connect with VM

```bash
curl --connect-timeout 5 http://$IPADDRESS
```

You might be seeing _connection timed out_ error in the beginning that is due to network security rules and we are going to resolve this issue

### Network security group rules
1. Run the command `az network nsg list` to list the network security groups that are associated with VM

```bash
az network nsg list --resource-group \<resource-Grp> --query '[].name' --output tsv
```

Every VM on azure is associated with atleast one network security group

To list the rules of the network group, run the command
```bash
az network nsg rule list --resource-group \<resourceGroup> --nsg-name \<PreviousCommandOutput>
```

You will see the total information about the network security group that your VM is placed into and all the rules and regulations applicable to that VM and resource groups.


You can use the `--query` flag to scale down your output to only the information that you need.

```bash
az network nsg rule list --resource-group \<resourceGroup> --nsg-name \<NSG-NAME> --query '[].{Name:name, Priority:priority, Port:destinationPortRange, Access:access}' --output table
```

This scrapes the data about name of rule, priority, port and access to rules that are assigned to VM and machine process in a tabular format<br>
Priority is more if priority number is less

Now in our current scenario only port 22 is open, that is for SSH connections, which in general means that only admin can access our VM<br>
But we also need to allow inbound connections on port 80 to display our website which is hosted on port 80 from our VM

--

### Creating network security rule
Now we create a rule to allow inbound access to port 80 in our VM
```bash
az network nsg rule create \
--resource-group \<group> \
--nsg-name \<networkName> \
--name allow-http \
--protocol tcp \
--priority 700 \
--destination-port-range 80 \
--access allow
```

all flags are self-explanatory in this command

Now if you run the rules command again, you can see multiple rules outputted in which one of that rule is the one that we created from above command.


Now you can run the curl command from above section(s) to try to connect with our VM to request webpage, for which this time you will get response.

--

If you have multiple VMs that serve the same purpose, you can assign that network security group(NSG) to each VM at the time you create it.


----

## Azure Virtual Private Networks
VPN - used encrypted tunnel within another network<br>
Traffic is encrypted while travelling over the untrusted network to precent eavesdropping or other attacks.

### VPN gateways
Azure VPN gateway instances are deployed in a dedicated subnet of the virtual network to enable the following connectivity
1. connect on-premise datacenters to virtual networks through site-to-site connection
2. connect individual devices to virtual networks through a point-to-site connection
3. connect virtual networks to other virtual networks through a network-to-network connection


You can deploy only one VPN gateway in each virtual network<br>
However you can use one gateway to connect to multiple locations, which includes other virual networks or on-premise datacenters

In Azure, regardless of the VPn type, the method of authentication employed is a pre-shared key<br>
There are two types of VPN type 
1. policy-based
    - specify statically the IP address of packets that should be encrypted through each tunnel.
    - This type of device evaluates every data packet aganist those sets of IP addresses to choose the tunnel where that packet is going to be sent through
2. route-based
    - IPSec tunnels are modeled as a network interface or virtual tunnel interface.
    - IP routing decides which one of these tunnel interfaces to use when sending each packet.
    - Route-based VPNs are preferred connection method for on-premise devices. They are more resilient to topology changes such as the creation of new subnets.

The difference is how they determine which traffic needs encryption.

--

### High-availability Scenarios

#### Active/Standby
By default, gateways are deployed as two instances in an active/standby configuration, even if you only see one VPN gateway resource in Azure.

When ther are any disruptions, the standby instance automatically assumes responsibility for connections without any user intervention<br>
In general the standby time is 90 seconds for unplanned disruptions


#### Active/active
With the introduction of support for BGP routing protocol, you can also deploy VPN gateways in an active configuration<br>
In this configuration, you can assign a unique IP address to each instance. You can extend the high availability by deploying an additional VPN device on-premise


#### ExpressRoute failover
Another option is to configure a VPN gateway as a secure failover path for _ExpressRoute_ connections<br>
_ExpressRoute_ circuits have resiliency built-in.<br>
In high availability scenarios, where there is risk associated with an outrage of an ExpressRoute circuitm you can also provision a VPN gateway that uses the internet as an alternative method of connectivity


#### Zone redundant gateways
In regions that support availability zones, VPN gateways and ExpressRoute gateways van be deployed in a zone-redundant configuration.<br>
Deploying gateways in Azure availability zones physically and logically separates gateways within a region while protecting your on-premise network connectivity to Azure from zone-level failures

These gateways require different gateway stock keeping units and use standard public IP addresses instead of basic public IP addresses.


----

## Azure _ExpressRoute_
_Azure ExpressRoute_ lets you extend your on-premise networks into the Microsoft cloud over a private connection, with the help of a connectivity provider. Circuit is called _ExpressRoute Circuit_

Connectivity can be from an any-to-any network, point-to-point ethernet network, or a virtual cross-connection through a connectivity provider at a colocation facility. <br>
ExpressRoute connections dont go over the public internet. This offers reliability, speed, consistent latencies, and higher security.

### Features/benefits of ExpressRoute
1. Connectivity to Microsoft cloud services across all regions in the geopolitical region
2. Global connectivity to microsoft services across all regions with the ExpressRoute Global Reach
3. Dynamic routing between your network and microsoft via BGP
    - ExpressRoute uses the BGP, which is used to exchange routes between on-premises networks and resources running in Azure. This protocl enables dynamic routing between your on-premises network and services running in the cloud.
4. Built-in redundancy in every peering location for higher reliability.


### ExpressRoute Connectivity models
ExpressRoute supports four models that you can use to connect your op-premise network to the microsoft cloud:
1. CouldExchange colocation
    - if your facility is co-located at a cloud exchange, you can request a virtual cross-connect to the microsoft cloud
2. Point-to-point ethernet connection
    - refers to using point-to-point connection to connect your facility to the microsoft cloud
3. Any-to-any connection
    - With any-to-any connectivity, you can integrate WAN with azure by providing connections to your offices and datacenters.
4. Directly from ExpressRoute sites
    - This provides Active/Active connectivity at scale


### Security Considerations
With _ExpressRoute_ your data doesnt travel over the public internt.<br>
Its a private connection from your on-premise infrastructure to your azure infrastructure<br>
Even if you have ExpressRoute connection, DNS queries, certificate revocation list checking and Azure content delivery network requests are still sent over the public internet.


----

## Azure DNS
By hosting your domains in Azure, you can manage your DNS records using the same credentials, APIs, tools and billings as your other Azure services.


### Reliability and Performace
Azure DNS uses anycast networking, so each DNS query is answered by the closest available DNS server to provide fast performance and high availability.


### Security
Azure DNS is based on Azure Resource Manager, which provides features as:
1. Azure Role-based-access-control to control who has access to specific actions to your org.
2. Activity logs to monitor changes for troubleshooting purpose
3. Resource locking to lock a subscription, resource group, or resource. Locking prevents other users in your organization from accidentally deleting or modifying critical resources.

### Customizable virtual networks with private domains
Azure DNS also supports private DNS domains, this feautre allows you to use your own custom domain names in your private virtual networks, rather than being stuck with the Azure-provided names.


### Alias records
Azure DNS also supports alias record sets. You can use an alias record set to refer an Azure resource, such as an Azure public IP address, an Azure Traffic Manager rpofile, or an Azure Content Delivery Network endpoint.<br>
If the IP address of the underlying resource changes, the alias record set seamlessly updates itself during DNS resolution.

The alias record set points to the service instance, and the service instance is associated with the IP address


---

> You cant use Azure DNS to buy a domain name. For an annual fee, you can buy domain name by using app service domains or third party domain name registrar. 
> Once purchased, your domains can be hosted in Azure DNS for record management.

-----

## Summary
https://learn.microsoft.com/en-us/training/modules/describe-azure-compute-networking-services/14-summary
