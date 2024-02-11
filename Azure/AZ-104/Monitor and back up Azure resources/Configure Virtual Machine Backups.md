
- identify features and usage cases for different azure virtual machine backups
- configure virtual machine snapshots and backup options
- implement virtual machine backup and restore, including soft delete
- perform site to site recovery by using azure site recovery
- compare different virtual machine backup options


---


|**Azure backup option**|**Configuration scenarios**|**Description**|
|---|---|---|
|**Azure Backup**|_Back up Azure virtual machines running production workloads_  <br>  <br>_Create application-consistent backups for both Windows and Linux virtual machines_|Azure Backup takes a snapshot of your virtual machine and stores the data as recovery points in geo-redundant recovery vaults. When you restore from a recovery point, you can restore your entire virtual machine or specific files only.|
|**Azure Site Recovery**|_Quickly and easily recover specific applications_  <br>  <br>_Replicate to the Azure region of your choice_|Azure Site Recovery protects your virtual machines from a major disaster scenario when a whole region experiences an outage due to a major natural disaster or widespread service interruption.|
|**Azure managed disks - snapshot**|_Quickly and easily back up your virtual machines that use Azure managed disks at any point in time_  <br>  <br>_Support development and test environments_|An Azure managed disks snapshot is a read-only full copy of a managed disk that's stored as a standard managed disk by default. A snapshot exists independent of the source disk and can be used to create new managed disks. Each snapshot is billed based on the actual size used. If you create a snapshot of a managed disk with a capacity of 64 GB that's used only 10 GB, you're billed for 10 GB.|
|**Azure managed disks - image**|_Create an image from your custom VHD in an Azure storage account or directly from a generalized (via Sysprep) virtual machine_  <br>  <br>_Create hundreds of virtual machines by using your custom image without copying or managing any storage account_|Azure managed disks also support creating a managed custom image. This process captures a single image that contains all managed disks associated with a virtual machine, including both the operating system and data disks.|

An azure backup job creates a snapshot for your virtual machine in two phases,
1. Take a snapshot of virtual machine data
2. Transfer the snapshot to an azure recovery services vault


By default, azure backup keeps snapshots for two days to reduce backup and restore times. The local retention reduces the time required to transform and copy data back from an azure recovery services vault.

you can set the default snapshot retention value from one and five days

incremental snapshots are stored as azure page blobs

Recovery points are listed for the virtual machine snapshot in the azure portal and are labeled with a _recovery point type_

---

An azure recovery services vault is a storage entity in azure that houses data. The data is typically copies of data or configuration information for virtual machines, workloads, servers or workstations. You can use recovery services vaults to organize your backup data and minimize your management overhead.


To use azure backup to protect your azure virtual machines its a three step process,
1. Create a vault
2. Define your backup options
3. Trigger a backup job


After you back up your virtual machine, the backup snapshots and recovery points are stored in your Recovery Services vault. You can recover your machine by accessing the snapshot, or restore data to a specific point-in-time by using recovery points.


---

Another option for backing up your virtual machines is to use System Center Data Protection Manager(DPM) or Microsoft Azure Backup Server(MABS).

You can use these services to back up specialized workloads, virtual machines or files, folders, and volumes. Specialized workloads can include data from microsoft sharepoint, microsoft exchange, and SQL server.

You can back up your virtual machines and applications to System Center DPM or MABS storage, and then back up the DPM or MABS storage to an Azure Recovery Services vault.


- When you set up protection for a machine or application by using System Center DPM or MABS, you select to back up to the MABS or DPM local disk for short-term storage, and to Azure for online protection. You specify when to run the backup to the local DPM or MABS storage, and when to run the online backup to Azure.
- To protect your on-premises machines, the System Center DPM or MABS instance must be located on-premises.
- To protect your Azure virtual machines, the MABS instance must run as an Azure virtual machine and located in Azure.
- The System Center DPM / MABS protection agent must be installed on each machine you want to protect
- The machines that you want to backup must be added to a _system center DPM protection group_
- when the backup triggers, the disk of the protected workload is backed up to the local MABS or DPM disks, according to the schedule you specified. The DPM and MABS disks are then backed up to the recovery services vault by the MARS agent running on the DPM or MABS instance.

---

Azure Backup server vs MARS backup agent

|Component|Benefits|Limits|Data protected|Backups stored|
|---|---|---|---|---|
|**MARS backup agent**|_Back up files and folders on physical or virtual machines running Windows_  <br>  <br>_No separate backup server required_|- Backups triggered 3x per day  <br>- Not application aware  <br>- File, folder, and volume-level restore only  <br>- No support for Linux|Files and folders|Azure Recovery Services vault|
|**Azure Backup Server**|_App-aware snapshots_  <br>  <br>_Full flexibility for when backups are triggered_  <br>  <br>_Recovery granularity_  <br>  <br>_Linux support on Hyper-V and VMware virtual machines_  <br>  <br>_Back up and restore VMware virtual machines_  <br>  <br>_No System Center license required_|- Always requires an active Azure subscription  <br>- No backups for Oracle workloads  <br>- No support for tape backup|Files, folders, volumes, virtual machines, applications, and workloads|Azure Recovery Services vault or locally attached disk|


---

![[soft-delete-for-vm.png]]

Soft delete for virtual machines protects backups of your virtual machines from unintended deletion. Even after the backups are deleted, they are preserved in the soft delete state or 14 more days.

> Soft delete only protects backup data. If a virtual machine is deleted without a backup, the soft delete feature wont preserve the data.


- **Stop backup job**. Before you can delete or retain backup data for your virtual machine, you must stop the active backup job. After you stop the backup job in the Azure portal, you can choose to delete or retain your backup data.
- **Apply soft-delete state**. Prevent your virtual machine backup data from being permanently deleted by selecting **Delete backup data** followed by **Stop backup**. The soft-delete state is applied to your backup data, and the data is retained for 14 days. If you apply the state to a virtual machine, the machine is referred to as _soft-deleted_.
- **View soft-delete data in the vault**. During the 14 day retention period, the Recovery Services vault shows your soft-deleted virtual machine with a red **soft-delete** icon.
- **Undelete backup items**. Before you can restore a soft-deleted virtual machine, you must undelete the backup data.
- **Restore items**. After you undelete the backup item, you can restore your virtual machine by selecting **Restore virtual machine** from the chosen recovery point in the backup.
- **Resume backups**. When the undelete process completes, the backup job status returns to **Stop backup with retain data**, and you can choose **Resume backup**. The resume operation retrieves the backup item in the _active_ state according to the backup policy selected by the user. The policy defines the backup and retention schedules.

---

### Azure site recovery

You can implement site recovery to backup your virtual machines and physical machines in the following scenarios
- replicate azure virtual machines from one azure region to another
- replicate on-premises VMware vm, Hyper-V vm, physical servers, and azure stack vms to azure
- replicate aws windows instance to azure
- replicate on-premises VMware vms, Hyper-V vm managed by system center VMM and physical server to a secondary site