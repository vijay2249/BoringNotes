- implement availability sets and availability zones
- implement update and fault domains
- implement azure vm scale sets
- autoscale vm

---

### Availability sets

An availability set is a logical feature you can use to ensure a group of related virtual machines are deployed together.

- All VMs in availability sets should
    - perform the identical set of functionalities
    - have the same software installed
- vm can only be added to an availability set when the vm is created. To change the availability set for a vm you need to delete and recreate the vm


Azure Vm availability sets implements two node concepts to help azure maintain high availability and fault tolerance when deploying and upgrading applications: _update domains(update multiple services at once)_ and _fault domains(group of nodes that represent a physical unit of failure)_. Each VM in an availability set is placed in one update domain and one fault domain

Availability zone in an azure region is a combination of fault domain and an update domain.

You can use availability zones to build high-availability into your application architecture by colocating your compute, storage, networking, and data resources within a zone and replicating in other zones.

ZRS replicate your applications and data across availability zones to protect aganist single point of failures.


----

### Vertical and Horizontal Scaling

things to consider when using vertical and horizontal scaling
- consider limitations
- consider flexibility
- consider reprovisioning - process of removing an existing vm and replacing it with a new maachine.

---

Azure virtual machine scale sets are an azure compute resource that you can use to deploy and manage a set of identical virtual machines. 

When you implement virtual machine scale sets and configure all your virtual machines in the same way, you gain true autoscaling