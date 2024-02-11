
- identify features and usage cases for azure backup
- configure azure recovery services vault backup options
- configure azure recovery services agent for azure backup
- implement on-premises file and folder backups

---

The Azure Backup service provides a simple, secure, and cost-effective solution for backing up your data. Administrators implement the Microsoft Azure Recovery Services (MARS) agent for Azure Backup to recover their data from the Microsoft Azure cloud.

 All Azure Backup components (no matter whether you're protecting data on-premises or in the cloud) can be used to back up data to a Recovery Services vault in Azure.


|Benefit|Description|
|---|---|
|**Offload on-premises backup**|Azure Backup offers a simple solution for backing up your on-premises resources to the cloud. Get short and long-term backup without the need to deploy complex on-premises backup solutions.|
|**Back up Azure IaaS VMs**|Azure Backup provides independent and isolated backups to guard against accidental destruction of original data. Backups are stored in an Azure Recovery Services vault with built-in management of recovery points. Configuration and scalability are simple, backups are optimized, and you can easily restore as needed.|
|**Get unlimited data transfer**|Azure Backup doesn't limit the amount of inbound or outbound data you transfer, or charge for the data that's transferred. Outbound data refers to data transferred from a Recovery Services vault during a restore operation. If you perform an offline initial backup by using the Azure Import/Export service to import large amounts of data, there's a cost associated with inbound data.|
|**Keep data secure**|Data encryption allows for secure transmission and storage of your data in the public cloud. You store the encryption passphrase locally, and it's never transmitted or stored in Azure. If it's necessary to restore any of the data, only you have encryption passphrase, or key.|
|**Get app-consistent backups**|An application-consistent backup means a recovery point has all required data to restore the backup copy. Azure Backup provides application-consistent backups, which ensure extra fixes aren't required to restore the data. Restoring application-consistent data reduces the restoration time, allowing you to quickly return to a running state.|
|**Retain short and long-term data**|You can use Azure Recovery Services vaults for short-term and long-term data retention. Azure doesn't limit the length of time data can remain in a Recovery Services vault. You can keep it for as long as you like. Azure Backup has a limit of 9,999 recovery points per protected instance.|
|**Automatic storage management**|Hybrid environments often require heterogeneous storage with some on-premises instances and some instances in the cloud. With Azure Backup, there's no cost for implementing on-premises storage devices. Azure Backup automatically allocates and manages backup storage. The service uses a pay-as-you-use model, so you only pay for the storage you consume.|
|**Multiple storage options**|Azure Backup offers two types of replication to keep your storage and data highly available.  <br>  <br>**Locally redundant storage (LRS)** replicates your data three times (it creates three copies of your data) in a storage scale unit in a datacenter. All copies of the data exist within the same region. LRS is a low-cost option for protecting your data from local hardware failures.  <br>  <br>**Geo-redundant storage (GRS)** is the default and recommended replication option. GRS replicates your data to a secondary region (hundreds of miles away from the primary location of the source data). GRS costs more than LRS, but GRS provides a higher level of durability for your data, even if there's a regional outage.|

---

The **Recovery Services vault** is a storage entity in Azure that stores data. Recovery Services vaults make it easy to organize your backup data, while minimizing management overhead.

the recovery services vault can be used to backup azure files file shares or on-premises files and folders

Recovery services vaults store backup data for various azure services such as IaaS virtual machines and Azure SQL in azure vm

recovery services vaults support system center data protection manager, windows server, azure backup server and other services.

---

- Azure Backup for files and folders relies on the MARS agent to be installed on your Windows client or Windows Server.
- the data thats available for backup depends on where you install and run the MARS agent
- MARS - Microsoft Azure Recovery Services
- MARS agent doesnt require a separate backup server

![[microsoft-azure-recovery-service-backup.png]]

-> Step 1: Create Recovery Services vault

The first step is to create a Recovery Services vault for your backups. The vault must be created within your Azure subscription, as described in the [previous section](https://learn.microsoft.com/en-us/training/modules/configure-file-folder-backups/4-setup-recovery-service-vault-backup-options).

-> Step 2: Download MARS agent and credentials file

On the Backup center dashboard, the Recovery Services vault page provides a link to download the MARS agent (Recovery Services Agent). To complete the MARS agent installation, you also need to download the _vault credentials_ file. For details, see [Download the MARS agent](https://learn.microsoft.com/en-us/azure/backup/install-mars-agent#download-the-mars-agent).

-> Step 3: Install and register MARS agent

The MARS agent installer provides a wizard to configure the installation location, proxy server, and passphrase information. The downloaded credentials file is used to register the agent. The MARS agent is installed on your local machine.

-> Step 4: Configure backups

Now you're ready to use the MARS agent to create a backup policy. You can specify when to do the backup, what data to back up, how long to retain the backup items, and other settings such as network throttling.

---

Azure Backup doesn't limit the amount of inbound or outbound data that's transferred. Azure Backup also doesn't charge for the data that's transferred.