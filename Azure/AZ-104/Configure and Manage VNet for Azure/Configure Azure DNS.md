
- identify features and usage cases for domains, custom domains, and private zones
- verify custom domain names by using DNS records
- implement DNS zones, DNS delegation, and DNS record sets

---

Azure DNS is a hosting service that allows you to manage your DNS domains using Microsoft Azure infrastructure

1. When you  create an azure subscription, azure automatically creates a microsoft entra domain for your subscription.
2. Azure applies an initial domain name to your initial domain instance
3. Before a custom domain name can be used by microsoft entra ID, the custom domain name must be added to your directory and verified.
4. The initial domain name cant be changed or deleted, but you can add a routable custom domain name that you control
5. In Entra ID, domain names must be globally unique, when one entra directory has verified a specific domain name, the other entra directories cant use the same domain name.

---

### Verify custom domain names

When a custom domain name to a microsoft entra instance, the custom domain name is initially in an unverified state. Entra ID wont allow any directory resources to use a custom domain name that's unverified.

After you add a custom domain name for your microsoft entra instance in the azure portal, you must verify the ownership of your custom domain name.
You initiate the verification process by adding a DNS record for your custom domain name. The DNS record type can be `MX` or `TXT`

After you add a DNS record to your custom domain name, azure queries the DNS domain for the presence of the DNS record.

---

Azure DNS provides a reliable, secure DNS service to manage and resolve domain names in a virtual network without needing to add a custom DNS solution

An Azure DNS zone hosts the DNS records for a domain. To begin hosting your domain in azure DNS, you need to create a DNS zone for your domain name. Each DNS record for your domain is then created inside your DNS zone

Within a resource group, the name of DNS zone must be unique
When multiple DNS zones share the same name, each DNS zone instance is assigned to a different DNS name server address
The root/parent domain is registered at the registrar and then pointed to azure NDS
Child domains are registered directly in azure DNS


---

### Delegate DNS domains

To delegate your domain to Azure DNS, you need to identify the DNS name servers for your DNS zone. Each time a DNS zone is created, azure DNS allocates DNS name servers from a pool. After the DNS name servers are assigned, Azure DNS automatically creates authoritative `NS` records in your DNS zone.

The process involves
1. Identify your DNS name servers
2. Update your parent domain
3. Delegate subdomains

Each registrar has their own DNS management tools to manage the DNS name server records for a domain. The term registrar refers to third party domain registrar which is the company where you registered your domain.


There are several important considerations to keep in mind when working with `NS` records and name servers for a DNS zone.

- When you copy an `NS` record (a DNS name server address), be sure to include the trailing period (`.`) at the end of the address. The trailing period indicates the end of a fully qualified domain name, such as `ns1-02.azure-dns.com.` and `ns3-02.azure-dns.org.`.
- To delegate your domain to Azure DNS, you must use the exact names of the DNS name servers as created by Azure DNS.

---

A DNS record set (also known as _resource record set_) is a collection of records in a DNS zone.

All records in a DNS record set must have the same name and the same record type

DNS record set cant contain two identical records
A record set of type `CNAME` can contain only one record

You can create a record set that doesnt have any records. This set is called an empty record set

If you have an empty record set for your domain, this set doesnt appear on your azure DNS name servers.

---

Azure private DNS zones can be created by using your own custom domain names rather than the names provided by azure.

|Benefit|Description|
|---|---|
|**No custom DNS solution required**|Previously, many customers created custom DNS solutions to manage DNS zones in their virtual network. You can now perform DNS zone management by using the native Azure infrastructure. Azure Private DNS removes the burden of creating and managing custom DNS solutions.|
|**Support for common DNS records types**|Azure Private DNS supports all common DNS record types, including `A`, `AAAA`, `CNAME`, `MX`, `PTR`, `SOA`, `SRV`, and `TXT`.|
|**Automatic hostname record management**|Along with hosting your custom DNS records, Azure Private DNS automatically maintains hostname records for the virtual machines in the specified virtual networks. In this scenario, you can optimize the domain names you use without needing to create custom DNS solutions or modify applications.|
|**Hostname resolution between virtual networks**|Unlike Azure-provided host names, Azure Private DNS zones can be shared between virtual networks. This capability simplifies cross-network and service-discovery scenarios, such as virtual network peering.|
|**Familiar tools and user experience**|To reduce the learning curve, Azure Private DNS uses well-established Azure DNS tools, including PowerShell, Azure Resource Manager (ARM) templates, and the REST API.|
|**Split-horizon DNS support**|With Azure Private DNS, you can create zones with the same name that resolve to different answers from within a virtual network and from the public internet. A typical scenario for a split-horizon DNS is to provide a dedicated version of a service for use inside your virtual network.|
|**Azure region support**|Azure Private DNS zones are available in all Azure regions in the Azure public cloud.|

Azure Private DNS manages and resolves domain names in a virtual network without adding a custom DNS solution.

Azure DNS hosts the registered domains. Administrators can control and configure domain records like `A`, `CNAME`, and `MX`, and set up alias records.
