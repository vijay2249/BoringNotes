- identify the features and usage cases for azure network watcher
- configure diagnostic capabilities like IP flow verify, next hop and network topology

---

Azure network watcher is a tool that allows you to monitor, diagnose and manage resources in an azure virtual network

Network watcher is a regional service that enables you to monitor and diagnose conditions at a network scenario level.

|Feature|Description|Scenarios|
|---|---|---|
|**IP flow verify**|Quickly diagnose connectivity issues from or to the internet, and from or to your on-premises environment.|_Identify if a security rule blocks ingress or egress traffic to or from a virtual machine_  <br>  <br>_Troubleshoot issues to determine if other exploration is required_|
|**Next hop**|View the next connection point (or _next hop_) in your network route, and analyze your network routing configuration.|_Determine if there's a next hop, and view the next hop target, type, and route table_  <br>  <br>_Confirm traffic reaches an intended target destination_|
|**VPN troubleshoot**|Diagnose and troubleshoot the health of your virtual network gateway or connection with gathered data. View connection statistics, CPU and memory information, IKE security errors, packet drops, and buffers and events.|_View summary diagnostics in the Azure portal_  <br>  <br>_Review detailed diagnostics in generated log files stored in your Azure storage account_  <br>  <br>_Simultaneously troubleshoot multiple gateways or connections_|
|**NSG diagnostics**|Use flow logs to map IP traffic through a network security group (NSG). A common implementation for NSG flow logs is to meet security compliance regulations and auditing requirements.|_Define prescriptive NSG rules for your organization, and conduct periodic compliance audits_  <br>  <br>_Compare your prescriptive NSG rules against the effective rules for each virtual machine in your network_|
|**Connection troubleshoot**|Azure Network Watcher Connection Troubleshoot is a more recent addition to the Network Watcher suite of networking tools and capabilities. Check a direct TCP or ICMP connection from a virtual machine, application gateway, or Azure Bastion host to a virtual machine.|_Troubleshoot your network performance and connectivity issues in Azure_  <br>  <br>_Troubleshoot connection issues for a virtual machine, application gateway, or Azure Bastion host_|

> To use Network Watcher, you must be owner, contributor, or Network contributor. If you create a custom role, the role must be able to read, write and delete network watcher service.


---

__IP flow verify__ feature in azure network watcher checks connectivity from or to the internet and from or to your on-premises environment.

The feature tests communication for a target virtual machine with associated network security group rules by running inbound and outbound packets to and from the machine

When you deploy a virtual machine, azure applies several default rules to your machine, the security rules allow or deny traffic to or from your virtual machine. You can override azure default rules or create other rules

---

__next hop__ feature in azure network watcher checks if traffic is being directed to intended destination. This feature lets you view the next connection point in your network route and helps you verify a correct network configuration

The next hop test returns three items
- next hop type
- IP address of the next hop
- Route table for the next hop

Examples of next hop are _internet, virtual network, virtual network service endpoint_

If the next hop is user-defined route(UDR), the process returns the UDR route. Otherwise, next hop returns the system route

If the next hop is of type _None_, there might be a valid system route to the destination IP address, but no next hop exists to route the traffic to the target.

---

Azure network watcher provides a network monitoring topology tool to help visualize and understand infrastructure. 

Network watcher topology tool generates a visual diagram of the resources in a virtual network

you can view subnets, vms, network interfaces, public IP addresses, network security groups, route tables and more.

To generate a topology, you need an azure network monitor watcher instance in the same region as the virtual network