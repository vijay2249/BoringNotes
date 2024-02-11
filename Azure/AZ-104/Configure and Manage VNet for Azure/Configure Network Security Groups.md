
- determine when to use network security groups
- create network security groups
- implement and evaluate network security group rules
- describe the function of application security groups

---

Network security groups are a way to limit network traffic to resources in your virtual network. Network security groups contain a list of security rules that allow or deny inbound or outbound network traffic.

You can assign a network security group to a subnet or a network interface. and define security rules in the group to control network traffic.

Characteristics of network security groups
- NSG contains a list of security rules that allow or deny inbound or outbound network traffic
- NSG can be associated to a subnet or a network interface
- NSG can be associated multiple times
- you create a NSG and define security rules in the azure portal


---

Azure creates several default security rules within each network security group, including inbound traffic and outbound traffic. Examples of default rules include `DenyAllInbound` traffic and `AllowInternetOutBound` traffic

Azure creates the default security rules in each network security group that you create

You can dd more security rules to a network security group by specifying conditions for any of the following settings:
- Name
- Priority
- Port
- Protocol
- Source
- Destination
- Action

Each security rule is assigned a priority value. All security rules for a network security group are processed in priority order. When a rule has a low priority value, the rule has a higher priority or precedence in terms of order processing. 

You cant remove the default security rules.

You can override a default security rule by creating another security rule that has a higher priority setting for your network security group

---

Azure defines three default inbound security rules for your network security group. These rules **deny all inbound traffic** except traffic from your virtual network and Azure load balancers

Azure defines three default outbound security rules for your network security group. These rules **only allow outbound traffic** to the internet and your virtual network.

![[default-security-group-rules.png]]

---

Each network security group and its defined rules are evaluated independently. Azure processes the conditions in each rule defined for each virtual machine in your configuration
- For inbound traffic, azure first processes network security rules for any associated subnets and then any associated network interfaces
- For outbound traffic, the process is reversed, azure first evaluates nsg rules for any associated network interfaces followed by any associated subnets
- for both the inbound and outbound evaluation process, azure also checks how to apply the rules for intra-subnet traffic

![[network-security-group-rules.png]]


If you have several network security groups and arent sure which security rules are being applied, you can use the **Effective security rules** link the azure portal. You can use the link to verify which security rules are applied to your machines, subnets and network interfaces

---

You can implement application security groups in your azure virtual network to logically group your virtual machines by workload. You can then define your network security group rules based on your application security groups.

Application security groups works in the same way as network security groups, but they provide an application-centric way of looking at your infrastructure