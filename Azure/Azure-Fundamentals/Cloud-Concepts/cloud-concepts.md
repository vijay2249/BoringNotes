Azure services support everything from simple to complex
Azure has simple web services for hosting your business presence in the cloud

Azure also support running fully virtualized computers managing your custom software solutions. Azure provides cloud based services like remote-storage, database hosting, centralized account management

----


## Describe Cloud Computing

1. define cloud computing
2. describe the shared responsibility model
3. define cloud models, including public, private and hybrid
4. identify appropriate use cases for each cloud model
5. describe the consumption-based model
6. compare cloud pricing models


--

### What is Cloud Computing?

it is the delivery of computing services over the internet.
Conputing services include common IT infrastructure such as VM, storage, dbs and networking
Cloud srevices also expand the traditional IT offerings to include things like IoT, ML, AI

--

### Describe Shared Responsibility Model

Traditional corporate datacenter -> company is responsible for maintaining the physical space, ensuring security and maintaining or replacing the servers if anything happens

With the _Shared Responsibility Model_, these responsibilities get shared between the cloud provider and the consumer.
Physical security, power, cooling, network connectivity are the responsibility of the cloud provider.
The consumer isn't allocated with the datacenter, so it wouldnt make sense for the consumer to have any of those mentioned responsibilities in _traditional corporate datacenter_

At the same time, the consumer is responsible for the data and infromation stored in the cloud. The consumer is also responsible for access security, meaning you only give access to those who need it.

Infrastructure as a Service(IaaS) -> places most responsibility on the consumer, with the cloud provider being responsible for the basics of physical security, connectivity and power.
Software as a Service(SaaS) -> places most responsibility with the cloud provider
Platform as a Service(PaaS) -> is somewhere in between IaaS and SaaS

![Shared Responsibilities of services](../images/shared-responsibility.png)


--

What ever the service might be, you'll always be responsible for 
1. the information and data stored in the cloud
2. devices that are allowed to connect to your cloud
3. the accounts and identifies of the people, services, and devices within your organization

The cloud provider is always responsible for
1. The physical datacenter
2. physical network
3. physical hosts


The service that you take will determine the responsibilities for things like
1. operating systems
2. network controls
3. applications
4. identity and infrastructure


--

### Cloud Models

The cloud models deinfe the deployment type of cloud resources

Three main cloud models are

#### Private cloud

its a cloud thats used by a single entity.
Private cloud privdes much greater control for the entity and its IT department
Private cloud may be hosted from your on site datacenter. It may also be hosted in a dedicated datacenter offsite, potentially even by a third party that has dedicated that datacenter to your company

#### Public cloud
it is built, controlled, and maintained by a third-party cloud provider.
WIth a public cloud, anyone that wants to purchase cloud services can access and use resources.
The genera public availability is a key difference between public and private clouds

#### Hybrid cloud
It is a computing env that uses both public and private clouds in an inter-connected env.
A hybrid cloud env can be used to allow a private cloud to surge for increased, temporary demanded by deploying public cloud resources.
Hybrid cloud can be uesd to provide an extra layer of security

--

### Azure Arc
is a set of technologies that helps manage your cloud env
Azure arc can help manage your cloud env, whether its public cloud solely on Aaure, a private cloud in your datacenter, a hybrid configuration or even a multi-cloud env running on multiple cloud providers at once.

--

### Consumption Based Model

when comparing IT infrastructure models, there are two types of expenses to consider,
1. Capital Expenditure (CapEx)
    1. It is typically a one-time, up-front expenditure to purchase or secure tangible resources.
2. Operational Expenditure (OpEx)
    1. Is is spending money on services or products over time, 
    2. Cloud computing falls under this category

The consumption-based model benefits include
1. No upfront costs
2. no need to purchase and manage costly infrastructure that users might not use to its fullest potential
3. the ability to pay for more resources when they are needed
4. the abiilty to stop paying for resources that are no longer needed


In cloud-based model, you dont have to worry about getting the resources needs just right. If you find that you need more virtual machines, you add more. If the demand drops and you dont need as many VMs, you remove the machines as needed. Either way you are only paying for the virtual machines that you use not the "Extra capacity" that the cloud provider has on hand.

### Compare cloud pricing models
Cloud computing is the delivery of computing services over the internet by using a _pay-as-you-go_ pricing model.
You typically pay only for the cloud services you use, which helps you
1. plan and manage your operation costs
2. run your infrastructuere more efficiently
3. scale as your business needs change


------

------

## Benefits of using cloud services

1. Describe the benefits of high availablity and scalability in the cloud
2. benefits of reliability and predictability in the cloud
3. benefits of security and governance in the cloud
4. benefits of manageability in the cloud


--

### benefits of availability and scalability in the cloud

#### high availability

High availability focuses on ensuring maximum availability, regardless of disruptions or events that may occur

Service Level Agreement(SLA) -- agreement with cloud and customer that gurantees the services are avaiable and performable
This is essentially account for service availabilty gurantees, in azure it is measured in percentage, related to application/service availability also called _UP TIME_

High SLA -> high cost

99% SLA -> 432 min/month downtime is max expected, in which if there are multiple services then this time is cummulative
99.9% SLA -> 43.2 min/month downtime is max expected

#### Scalability
Scalability refers to the ability to adjust resources to meet demand. If you suddently experience peak traffic and your systems are overwhelmed, the ability to scale means you can add more resources to better handle the increaes demand.

Scaling generally comes in two varities

##### Vertical Scalability
if your app needed more processing power, you could vertically scale up to add more CPUs or RAm to the virtual machine
Conversely, if you realized you had over-specified the needs, you could vertically scale down by lowering the CPU or RAM specifications

##### Horizontal Scalability
If you suddenly experienced a steep jump in demand, your deployed resources could be scaled out(either automatically or manually)
You could add additional virtual machines or containers, scaling out
you could remove virtual machines or containers, scaling in

--

### Reliability and Predictability in the cloud

#### Reliability

Reliability is the ability of a system to recover from failures and continue to function

The cloud, by virtue of its decentralized design, naturally supports a reliable and resilient infrastructure. With a decentralized design, the cloud enables you to have resources deployed in regions around the world.

#### Predictability

Predictability can be focused on performace predictability or cost predictability.


#### Performance
Performance predictability focuses on predicting the resources needed to deliver a positive experience for your customers.
Autoscaling, load balancing and high availability are just some of the cloud concepts that support performance predictability.
Example: if the traffic is heavily focused on one area, load balancing will help redirect some of the overload to less stressed areas.

#### Cost
Cost predictability is focused on predicting or forecasting the cost of the cloud spend. With the cloud, you can tract your resources use in real time, monitor resources to ensure that you are using them in most efficient way and apply data analytics to find patterns and trends that help better plan resource deployments.
You can even use tools like the _Total Cost of Ownership(TCO)_ or _Pricing Calculator_ to get an estimate of potential cloud spend

--

### Security and Governance in the cloud

whether you are deploying infrastructure as a service or software as a service, cloud features support governance and compliance

Things like set templates help ensure that all your deployed resources meet corporate standards and government regulatory requirements.

Depending on your operating model, software patches and updates may also automatically be applied, which helps with both governance and security

On the security side
1. if you want maximum control of security, IaaS provides you with physical resources but lets you manage the operating systems and installed software, including patches and maintenance
2. If you want patches and maintenance taken care of automatically, PaaS or SaaS deployments may be best cloud strategies.

Because the cloud is intended as an over the internet delivery of IT resources, cloud providers are typically well suited to handle things like __Distributed Denial of Service (DDoS) attaks__, making your network more robust and secure



--

### Manageability in the cloud

major benefit of cloud computing is the mangeability options

#### Management of the cloud
Management of the cloud speaks to managing your resources
1. Automatically scale resource deployment based on need
2. deploy resources based on a preconfigured template, removing the need for manual configuration
3. monitor health of resources and automatically replace failing resources
4. Receive automatic alerts based on configured metrics, so you are aware of performance in real time

#### Management in the cloud
Management in the cloud speaks of how you are able to manage your cloud environment and resources

You can manage these things:
1. through a web portal
2. using a CLI
3. using API
4. using powershell


----


----

## Cloud Service Types

1. Describe Infrastructure as a Service (IaaS)
2. Describe Platform as a Service (PaaS)
3. Describe Software as a Service (SaaS)
4. Identify appropriate use cases for each cloud service

--

### Infrastructure as a Service (IaaS)
It is the most fleible category cloud services, as it provides you the maximum amount of control for your cloud services
In IaaS mode, the cloud provider is responsible for maintaining the hardware, network connectivity, physical security and other than these mentioned consumer is responsible for everything else.

#### Scenarios
-> Just want to migrate your services from your physical data-center to cloud provider
-> testing and development: you have establisjed configurations for development and test environments that you need to rapidly replicate.

--

### Platform as a Service (PaaS)
It is a middle ground between renting space in a data-center(IaaS) and paying for a complete and deployed solution (SaaS).

In this model, cloud provider maintains the physical infrastructure, physical security, network connectivity, OS, middleware, development tools

In PaaS scenario, you dont have to worry about the licensing or patching for operating systems and databases

> Depending on the configuration, you or the cloud provider may be responsible for networking settings and connectivity within your cloud environment, network and application security and the directory infrastructure


--

### Software as a Service (SaaS)
This model is the most complete cloud service model from a product prespective.
With SaaS, you are essentially renting or using a fully developed application

Email, financial software, messaging applications are all common examples of a SaaS implementation

In SaaS environment you are responsible for the data that you put into the system, the devices that you allow to connect to the system and the users that have access. Nearly everything else falls to the cloud provider.

#### Scenarios
1. Email & Messaging
2. Business productivity applications
3. Finance and expense tracking