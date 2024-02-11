
- implement system routes and user-defined routes
- Configure a custom route
- implement service endpoints
- identify features and usage cases for azure private link and endpoint services

---

Azure virtual networking provides capabilities to help you customize your network routes, establish service endpoints and access private links.

---

### System routes

Azure uses _system routes_ to direct network traffic between virtual machines, on-premises networks and the internet.
Information about the system routes is recorded in a route table.

Route table contains a set of rules, that specifies how packets should be routed in a virtual network

Route tables record information about the system routes, where the tables are associated to subnets

Each packet leaving a subnet is handled based on the associated route table

When a matching route cant be found, the packet is dropped

![[azure-system-routes.png]]

---

Azure automatically handles all network-traffic routing but in some cases a custom configuration is preferable. In these situations, you can configure _user-defined routes(UDRs)_ and _next hop_ targets

- UDRs control network traffic by defining routes that specify the _next hop_ of the traffic flow.
- The next hop can be one of the following targets:
    - Virtual network gateway
    - Virtual network
    - Internet
    - Network virtual appliance (NVA)
- Similar to system routes, UDRs also access route tables.
- Each route table can be associated to multiple subnets.
- Each subnet can be associated to one route table only.
- There are no charges for creating route tables in Microsoft Azure.


![[azure-user-defined-routes.png]]

---

A virtual network service endpoint provides the identity of your virtual network to the azure service. After service endpoints are enabled in your virtual network, you can secure azure service resources to your virtual network by adding a virtual network rule to the resources

![[azure-service-endpoints.png]]
