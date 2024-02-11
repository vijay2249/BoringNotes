
- create a vm with azure cli
- resize vm with azure cli
- perform basic management tasks using azure cli
- connect to a running vm with ssh and azure cli

----

### Create Linux VM

```bash
az vm create 
	--resource-group <resourceGroup>
	--location <westus> 
	--name <SampleVM> 
	--image <Ubuntu2204> 
	--admin-username <azureuser> 
	--generate-ssh-keys 
	--verbose
```

The common names such as "root" and "admin" arent allowed for most images as admin usernames
```bash
az vm stop 
	--name SampleVM 
	--resource-group <resourceGroup>
```


---

Resources used in windows VM
1. VM that provides CPU and memory resources
2. Azure storage account to hold the virtual hard disks
3. Virtual disks to hold the OS, applications and data
4. Virtual Network to connect to VM to other azure services or your own on-premises hardware
5. A network interface to communicate with the VNet
6. A public IP address so you can access the VM(optional)

Azure uses virtual hard disks to represent physical disks for the VM. VHDs replicate the logical format and data of a disk drive but are stored as page blobs in an azure storage account

---

By default, new VMs are locked down.

Apps can make outgoing requests, but the only inbound traffic allowed is from the virtual network and from azure load balancer(probe checks)

There are two steps to adjusting the configuration to support FTP. When you create a new VM, you have an opportunity to open a few common ports (RDP, HTTP, HTTPS, SSH). 


### Network Security Group

Virtual Networks are the foundation of azure networking model and provide isolation and protection.

Network Security Groups(NSG) are the main tool you use to enforce and control network traffic rules at the networking level. NSG are an optional security layer that provides a software firewall by filtering inbound and outbound traffic on the VNet

Security groups can be associated to a network interface (for per-host rules), a subnet in the virtual network(to apply to multiple resources) or both levels

#### Security group rules

Each rule identifies the source and destination address, protocol, port, direction, a numeric priority and whether to allow or deny the traffic that matches the rule.

![[virtual-network-security-group-rule.png]]

Each security group has a set of default security rules to apply the default network rules described above. These default rules cant be modified, but can be overridden


#### How Azure uses network rules

For inbound traffic, azure processes the security group associated to the subnet, then the security group applied to the network interface. Outbound traffic is processed in the opposite order(network interface first, followed by a subnet)

The rules are evaluated in _priority order_, starting with the lowest priority rule. In order for a traffic to be allowed through the security group, it must pass through all applied groups.

> SMTP (port 25) is a special case. Depending on your subscription level and when your account was created, outbound SMTP traffic may be blocked. You can make a request to remove this restriction with business justification