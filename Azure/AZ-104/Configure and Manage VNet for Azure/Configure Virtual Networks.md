- describe azure virtual network features and components
- identify features and usage cases for subnets and subnetting
- identify usage cases for private and public ip address
- create a virtual network and assign an IP address

---

An Azure virtual network is a logical isolation of the azure cloud resources
Each virtual network has its own classless inter-domain routing (CIDR) block and can be linked to other virtual networks and on-premises networks

Things to consider when using virtual networks
- create a dedicated private cloud only virtual network
- securely extend your data center with virtual network
- enable hybrid cloud scenarios


### Subnets

Subnets provide a way for you to implement logical divisions within your virtual network.  Your network can be segmented into subnets to help improve security, increase performance and make it easier to manage

- each subnet contains range of IP addresses that fall within the virtual network address space
- The address range for a subnet must be unique within the address space for the virtual network
- the range for one subnet cant overlap with other subnet IP address ranges in the same virtual network
- The IP address space for a subnet must be specified by using CIDR notation 
- you can segment a virtual network into one or more subnets in the azure portal. 


For each subnet, azure reserves five IP addresses, 

| Reserved address                  | Reason                                                                |
| --------------------------------- | --------------------------------------------------------------------- |
| `192.168.1.0`                     | This value identifies the virtual network address.                    |
| `192.168.1.1`                     | Azure configures this address as the default gateway.                 |
| `192.168.1.2` _and_ `192.168.1.3` | Azure maps these Azure DNS IP addresses to the virtual network space. |
| `192.168.1.255`                   | This value supplies the virtual network broadcast address.            |


----

### Create virtual networks

When you create a virtual network, you need to define the IP address space for the network
The address space for the network can be either on-premises or in the cloud, but not both.

Once you create the IP address space, it cant be merged. If you plan your address space for cloud-only virtual networks, you might later decide to connect an on-premises site.

To create a virtual network, you need to define at least on subnet.
	Each subnet contains a range of IP addresses that fall within the virtual network address space
	The address range for each subnet must be unique within the address space for the virtual network
	The range for one subnet cant overlap with other subnet IP address ranges in the same virtual network.

**Private IP addresses** enable communication within an azure virtual network and your on-premises network. You create a private IP address for your resource when you use a VPN gateway or Azure ExpressRoute circuit to extend your network to azure.

**Public IP addresses** allow your resource to communicate with the internet. You can create a public IP address to connect with azure public facing services.

A public IP address resource can be associated with virtual machine network interfaces, internet-facing load balancers, VPN gateways, and application gateways. You can associate your resources with both dynamic and static public IP addresses.

A private IP address resource can be associated with virtual machine network interfaces, internal load balancers, and application gateways. Azure can provide an IP address(dynamic assignment) or you can assign the IP address(static assignment)


Private IP address is allocated from the address range of the virtual network subnet that a resource is deployed in. There are two options
- dynamic
	- Azure assigns the next available unassigned or unreserved IP address in the subnets address range. 
- Static
	- you select and assign any unassigned or unreserved IP address in the subnet address range.

