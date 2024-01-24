
- configure and use azure storage explorer
- configure the azure import/export service
- use the WAImportExport tool with azure import/export service
- configure and use AZCopy


---

### Azure Storage explorer

A standalone application that makes it easy to work with azure storage data on multiple OS.

Characteristics of Azure storage explorer
- Azure storage explorer requires both management (Azure Resource Manager) and data layer permissions to allow full access to your resources.
- You need Entra permissions to access your storage account, the containers in your account and the data in the containers
- Azure storage explorer lets you connect to different storage accounts
	- connect to storage accounts associated with your azure subscriptions
	- connect to storage accounts and services that are shared from other azure subscriptions
	- connect to and manage local storage by using the azure storage emulator


![[azure-storage-explorer-connecton-options.png]]

#### Access keys

These provide access to the entire storage account. You are provided two access keys so you can maintain connections by using one key while regenerating the other.
When you regenerate you access keys, you must update any azure resources and applications that access this storage account to use the new keys. This action doesn't interrupt access to disks from your virtual machines


---

### Azure import/export service

Used to securely import large amounts of data to azure blob storage and azure files by shipping disk drives to an azure data center. This service can also be used to transfer data from azure blob storage to disk drives and ship to your on-premises sites.

Characteristics of Azure import/export service
- data from your disk drives can be imported to azure blob storage or azure files in your storage account
- data from azure storage in your azure storage account can be exported to drives that you provide
- create an azure export job to export data from azure storage to hard disk drives.
- You can create jobs directly from the azure portal or programmatically by using the azure storage import/export REST API


---

### Azure Import jobs

Azure import jobs securely transfer large amounts of data to azure blob storage or azure files. 

![[azure-import-jobs.png]]

Use the WAImportExport tool to copy the data on the disks

### Azure Export jobs

Azure export jobs transfer data from azure storage to hard disk drives and ship the disks to your on-premises sites. 

![[azure-export-jobs.png]]

The BitLocker keys are used to encrypt your disks are stored within the specific storage account in the azure portal. You can decrypt the content of the disks and copy the data to your on-premises storage


----

### WAImportExport tool

It is the azure import/export service tool. The tool is used to prepare drives before importing data and to repair any corrupted or missing files after data transfer

> It is available in two versions
> V1 -> best for importing and exporting data in azure blob storage
> V2 -> best for import data into azure files.
> Only compatible with 64-bit windows OS.


- Before you create an azure import jobs, use the tool to copy data to the hard disk drives you intend to ship to servers
- Azure your azure import job completes, use the tool to repair any blobs that were corrupted, missing or that have conflicts with other blobs in your azure storage.
- the tool handles data copy, volume encryption and creation of journal files. Journal files are necessary to create an azure import/export job and help ensure the integrity of the data transfer

Things to consider when using the WAImportExport tool
1. Consider supported disk drives
	1. for hdd, azure import/export service requires internal SATA II/III HDDs or SSDs
2. Consider BitLocker encryption
3. Consider OS version

---

### AzCopy tool

Alternate method of transferring data is the __AzCopy__.
You can use AzCopy to copy data between a file system and a storage account or between storage accounts

- Every AzCopy instance creates a job order and a related kog file. 
- you can use AzCopy to list or remove files or blobs in a given path. 
- AzCopy automatically retires a transfer when a failure occurs
- When you use azure blob storage, AzCopy lets you copy an entire account to another account. No data transfer to the client is needed.
- Supports Azure Data Lake Storage Gen2 APIs
- Is built into azure storage explorer
- available on multiple OS


There are two options to authenticate your transferred data when using AzCopy
- **Entra ID** - Support for Azure Blob, and Azure Data lake storage Gen2
- **SAS Tokens** - support for azure blob storage and azure files


#### AzCopy and Azure storage explorer

Azure storage explorer uses your account key to perform operations. After you sign in to azure storage explorer, you dont need to provide your authorization credentials again

Things to consider when using AzCopy
- Consider data synchronization
- consider job management
- consider transfer resiliency - if a copy job fails, AzCopy automatically retires the copy
- consider fast account to account copy


AzCopy command <code>azcopy copy [source] [destination] [flags]</code>
