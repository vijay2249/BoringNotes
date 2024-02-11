
- Identify usage cases and product features of azure virtual network peering
- Configure your network to implement azure VPN gateway for transit connectivity
- extend peering by using a hub and spoke network with user-defined routes and service chaining

---

Azure Virtual network peering lets you connect virtual networks in the same or different regions. Azure virtual network peering provides secure communication between resources in the peered networks.

After the networks are peered, the two virtual networks operate as a single network, for connectivity purposes.

- There are two types of azure virtual network peering

![[azure-virtual-network-peering.png]]

- Global peering of virtual networks in different azure government cloud region isnt permitted
- After you create a peering between virtual networks, the individual virtual networks are still managed as separate resources

Things to consider when using azure virtual network peering

|   |   |
|---|---|
|**Private network connections**|When you implement Azure Virtual Network peering, network traffic between peered virtual networks is private. Traffic between the virtual networks is kept on the Microsoft Azure backbone network. No public internet, gateways, or encryption is required in the communication between the virtual networks.|
|**Strong performance**|Because Azure Virtual Network peering utilizes the Azure infrastructure, you gain a low-latency, high-bandwidth connection between resources in different virtual networks.|
|**Simplified communication**|Azure Virtual Network peering lets resources in one virtual network communicate with resources in a different virtual network, after the virtual networks are peered.|
|**Seamless data transfer**|You can create an Azure Virtual Network peering configuration to transfer data across Azure subscriptions, deployment models, and across Azure regions.|
|**No resource disruptions**|Azure Virtual Network peering doesn't require downtime for resources in either virtual network when creating the peering, or after the peering is created.|


When virtual networks are peered, you can configure azure VPN gateway in the peered virtual network as a transit point. 

A virtual network can have only one VPN gateway

Gateway transit is supported for both regional and global virtual network peering

When you allow VPN gateway transit, the virtual network can communicate to resource outside the peering.

Gateway transit allow peered virtual networks to share the gateway and get access to resources, with this implementation you dont need to deploy a VPN gateway in the peer virtual network.

---

To implement virtual network peering, your azure account must be assigned to `Network Contributor` or `Classic Network Contributor` role. Alternatively, your azure account can be assigned to a custom role that can complete the necessary peering actions.


Virtual network peering in nontransitive. The communication capabilities in a peering are available to only the virtual networks and resources in the peering. Other mechanisms have to be used to enable traffic to and from resources and networks outside the private peering network.

Suppose you have three virtual networks: A, B, and C. You establish virtual network peering between networks A and B, and also between networks B and C. You don't set up peering between networks A and C. The virtual network peering capabilities that you set up between networks B and C don't automatically enable peering communication capabilities between networks A and C.


There are a few ways to extend the capabilities of your peering for resources and virtual networks outside your peering network:

- Hub and spoke networks
- User-defined routes
- Service chaining


