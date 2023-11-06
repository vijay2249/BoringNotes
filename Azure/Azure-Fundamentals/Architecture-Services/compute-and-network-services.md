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
