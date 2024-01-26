Decide if azure powershell is the right tool for azure admin tasks
install azure powershell on different OS
connect to an azure subscription using azure powershell
create azure resources using azure powershell


CRM - Customer Relationship Management


Azure powershell and the Azure CLI support automation, but azure portal doesnt

Azure portal doesnt require you to learn syntaz or memorize commands, tasks can be done quickly without any commands or syntax



**_Cmdlets follow a verb-noun naming convention_**

Cmdlets are shipped in modules. A powershell module is a dll that includes the code to process each available cmdlet. You load cmdlets into powershell by loading the module in which they are contained. You can get a list of loaded modules using the "Get-Module" command

install Az module in powershell
```powershell
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery
```

in general there are four steps user need to perform while creating resources via powershell
1. Import the azure cmdlets
2. connect to azure subscription
3. create resource group
4. verify that creation was successful


In powershell, you can only be in one subscription at a time. use `Get-AzContext` cmdlet to determine which subscription is active. If its not the correct one, you can change subscriptions using another cmdlet.


### Create an azure virtual machine
Azure powershell provides the `New-AzVM` cmdlet to create a new virtual machine.<br>
This cmd has many parameters to let it handle the large number of VM configuration settings. Most of the parameters have reasonable default values, so we only need to specify five things
1. ResourceGroupName - resource group into which the new VM should be placed.
2. Name - the name of the VM
3. Location - geographic location of where the VM is provisioned
4. Credential - object containing the username and password for the VM admin account.
5. Image - the OS image to use for VM

```powershell
# connect with azure account
Connect-AzAccount

# connect the azure account with device identification
Connect-AzAccount -UseDeviceAuthentication

# get subsction details
Get-AzContext

# get resource group details
Get-AzResourceGroup #retrieve all resource groups details
Get-AzResourceGroup -Name <resourceGroupName> #retrieve particular resource group details

# create new resource group
New-AzResourceGroup -Name <name> -Location <resourceGroupLocation>

# new virtual machine
New-AzVM -ResourceGroupName <> -Name <> -Credential <> -Location <> -Image <>
```
