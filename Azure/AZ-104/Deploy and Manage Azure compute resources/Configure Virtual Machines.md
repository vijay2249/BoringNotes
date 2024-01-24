

Azure VM is the basis of the azure infrastructure as service model.

VM provides its own operating system, storage, network capabilities and can run a wide range of applications.


Things to consider when using IaaS and VMs
- consider test and development - teams can quickly set up and dismantle test and development environments, bringing new applications to market faster.
- consider website hosting
- consider storage, backup and recovery
- consider high-performance computing
- consider big data analysis
- consider extended datacenters

---

Before you create an azure virtual machine, its helpful to make a plan for the machine configuration

The checklist of things to consider
1. Start with the network
2. Choose a name for the VM
3. decide the location for the VM
4. Determine the size of VM
5. Review the pricing model and estimate your costs
6. Identify which azure storage to use with the virtual machine
7. Select an OS for the VM


#### Network Configurations

Virtual networks are used in azure to provide private connectivity between azure virtual machines and other azure services.

VMs and services that are part of the same virtual network can access one another.
By default, services outside the virtual network cant connect to services within the virtual network. 

---

Azure Managed Disks handle azure storage account creation and management in the background for you. You specify the disk size and the performance tier.

Azure allows you to change the virtual machine size when the existing size no longer meets your needs. You can resize a virtual machine if your current hardware is allowed in the new size.

> Resizing a machine might require a restart that can cause a temporary outage or change configuration settings such as IP address


---

### Virtual Machine Storage

All virtual machines have at least two disks, OS disk, and temporary disk. VMs can also have one or more data disks. All disks are stored as virtual hard disks (VHDs). VHD is like a physical disk in a on-premises server but virtualized.


#### Operating system disk

Every vm has one attached operating system disk. The OS disk has a pre-installed operating system, which is selected when the virtual machine is created. The OS disk is registered as SATA drive(Serial Advanced Technology Attachment) and labeled as `C:` drive by default

#### Temporary disk

data on the temporary disk might be lost during a maintenance event or when you redeploy a vm.

On Windows VM, the temporary disk is labeled as the `D:` drive by default. This drive is used for storing the __pagefile.sys__ file

On linux VM, the temporary disk is typically `/dev/sdb`. This disk is formatted and mounted by `/mnt` by the azure linux agent.


#### Data disks

Is a managed disk thats attached to a  virtual machine to store application data or other data you need to keep. Disks are registered as SCSI drives and are labeled with a letter you choose.

---

### Connect to Virtual Machines

The azure portal supports options for connecting your windows and linux machines and making connections by using azure bastion

![[azure-connect-to-virtual-machines.png]]


Azure Bastion provides secure RDP and SSH connectivity to all virtual machines in the virtual network. Azure Bastion protects your virtual machines from exposing RDP/SSH ports to the outside world while still providing secure access with RDP/SSH. Azure Bastion lets you connect to the virtual machine directly from the azure portal.

To connect to a Windows-based virtual machine hosted on Azure, use the Microsoft Remote Desktop application with the remote desktop protocol (RDP). The Remote Desktop app provides a graphical user interface (GUI) session to an Azure virtual machine that runs any supported version of Windows.

To connect to a Linux-based virtual machine, you can use a secure shell protocol (SSH) client. SSH is an encrypted connection protocol that allows secure sign-ins over unsecured connections.