Datasets have unique lifecycles. Early in the lifecycle, people access some data often. But the need for access drops drastically as the data ages. Some data stays idle in the cloud and is rarely accessed once stored.

Contents covered
1. How each of the access tiers is optimized
2. create and implement a lifecycle policy
3. Rehydrate blob data stored in an archive tier.



## Access tiers
Azure storage offers different access tiers, allowing you to store blob object data in the most cost-effective manner.
- Hot
    - optimized for storing data that is accessed frequently
- Cool
    - optimized for storing data that is infrequently accessed and stored for a minimum of 30 days
- Cold tier
    - optimized for storing data that is infrequently accessed and stored for a minimum of 90 days
- Archieve
    - optimized for storing data that is rarely accessed and stored for at least 180 days with flexible latency requirements, on the order of hours


Only hot and cool access tiers can be set at the account level. The archieve access tier can only be set at the blob level<br>
Data in the cool access tier has slightly lower availability, but still has high durability, retrieval latency and throughput characteristics similar to hot data.


### Manage the data lifecycle
The lifecycle management policy lets you
1. Transition blobs to a cooler storage tier to optimize for performance and cost
2. Delete blobs at the end of their lifecycles
3. Define rules to be run once per day at the storage account level
4. Apply rules to containers or a subset of blobs(using prefixes as filters)


## Blob storage lifecycle policies
It is a collection of rules in a JSON document. Each rule defiition within a policy includes a filter set and an action set.<br>
The filter set limits rule actions to a certain set of objects within a container or objects names. 

A policy is collection of `rules` - at least one rule is required in a policy. You can define up to 100 rules in a policy


Parameters in each `rule`

- `name` -> String datatype -> a rule name can include upto 256 alphaNumeric characters. also case sensitive. -> Required property
- `enabled` -> Boolean -> to allow a rule to be temporarily disabled. default value is true -> not a required property
- `type` -> enum -> the current valid type of Lifecycle -> required property
- `definition` -> object that defines the lifecycle rule -> each definition is made up of a filter set and ac action set -> required property


Example policy
```json
{
  "rules": [
    {
      "name": "ruleFoo223",
      "enabled": true,
      "type": "Lifecycle",
      "definition": {
        "filters": {
          "blobTypes": [ "blockBlob" ],
          "prefixMatch": [ "container1/foo" ]
        },
        "actions": {
          "baseBlob": {
            "tierToCool": { "daysAfterModificationGreaterThan": 30 },
            "tierToArchive": { "daysAfterModificationGreaterThan": 90 },
            "delete": { "daysAfterModificationGreaterThan": 2555, "daysAfterLastAccessTimeGreaterThan": 3000 },
            "tierToArchive" : {"daysAfterCreationGreaterThan": 2555 }
          },
          "snapshot": {
            "delete": { "daysAfterCreationGreaterThan": 90 }
          }
        }
      }
    }
  ]
}
```


### Rule filters
Filters limit rule actions to a subset of blobs within the storage account. If more than one filter is defined, a logical AND runs on all filters.

Filter include
- `blobTypes` -> array of predefined enum values -> required property
- `prefixMatch` -> array of strings for prefixes to be match. Each rule can define up to 10 prefixes. Must start with container name -> not required property
- `blobIndexMatch` -> array of dictionary values consisting of blob index tag key and value conditions to be matched. -> not required property


### Rule actions
Actions are applied to the filtered blobs when the run condition is met.<br>
Lifecycle management supports tiering and deletion of blobs and deletion of blob snapshot. Define at least one action for each rule on blobs or blob snapshots.


> If you define more than one action on the same blob, lifecycle management applies the least expensive action to the blob. For examlpe, action `delete` is cheaper than action `tierToArchieve`. Action `tierToArchieve` is cheaper than action `tierToCool`


The run conditions are based on age. Base blobs use the last modified time to tract age, and blob snapshots use the snapshot creation time to tract age

The one action run condiition `daysAfterLastTierChangeGreaterThan` condition applies to only `tierToArchive` actions and can be used only with the `daysAfterModificationGreaterThan` condition


### Implementing blob storage lifecycle policies
[add-policy-blob-storage](https://learn.microsoft.com/en-us/training/modules/manage-azure-blob-storage-lifecycle/4-add-policy-blob-storage)

> Lifecycle management policy must be read or written in full. Partial updates arent supported.


### Rehydrate blob data from the archive tier
While blob is in the archive access tier, its considered to be offline and cant be read or modified.<br>
In order to read or modify data in the archived blob, you must first rehydrate the blob to an online tier, either the hot tier or cool tier.

There are two options to do so
1. __Copy an archive blob to an online tier__
    - rehydrate an archive blob by copying it to a new blob in the hot or cool tier, with _copy blob_ or _copy blob from url_ operation
2. __Change a blobs access tier to an online tier__

Rehydrating a blob from the archive tier can take several hours to complete

When you rehydrate a blob, you can set the priority for the rehydration operation via the optional `x-ms-rehydrate-priority` header on the opetaion url

To check the rehydration priority while the rehydration operation is underway, call _Get blob properties_ to return the value of the header property.


When you copy an archived blob to a new blob in an online tier, the source blob remains unmodified in the archieve tier.<br>
You must copy the archived blob to a new blob with a different name or to a different container. You cant overwrite the source blob by copying to the same blob.

Copying an archived blob to an online destination tier is supported within the same storage account only. You cant copy an archived blob to a destination blob that is also in the archive tier.


> Once a _set blob tier_ requiest is initiated, it cant be cancelled. During the rehydration operation, the blobs access tier setting continues to show as archived untill hydration process is complete.

> Changing a blobs tier doesnt affect its last modified time. IF there is a lifecycle management policy in effect for the storage account, then rehydrating a blob with __Set Blob Tier__ can result in a scenario where the lifecycle policy moves the blob back to the archive tier after rehydration because the last modified time is beyond the threshold set for the policy   