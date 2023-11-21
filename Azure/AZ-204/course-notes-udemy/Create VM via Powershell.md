
---


### Creating new resource group command

```powershell
New-AzResourceGroup -Name GroupName -Location VMLocation
```


```bash
az group create --name <groupName> --location <location>
```

### Create VM in Azure command
```powershell
New-AzVM -ResourceGroupName "GroupName" -Location "Location" -Name "NameOfVM" -PublicIpAddressName "IPAddressName" -OpenPort <OpenPortsForConnectionCommaSeparated>
```

Now it may sometimes prompt user for login credentials for authentication

Now the VM has much more customized options than that are provided here, so for the options that didn't provided here in the command, Azure sets the default values to those options

```bash
az vm create --resource-group <resourceGroup> --name <NameofVM> --image <VMISO-image> --admin-username <userName> 
```

This is prompt for admin password just so that the command wont have the user password in transit or even in logs the command wont have the user password shown unencrypted.


---

The default VM size that Azure wants to use when you create a VM is _Standard DS1_

