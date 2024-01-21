
- Determine the correct region to locate azure services
- review features and use cases for azure subscriptions
- obtain an azure subscription
- understanding billing and feature for different azure subscriptions
- use microsoft cost management for cost analysis
- when to use azure resource tagging
- identify ways to reduce costs

---

A region is a geographical area on the planet containing at least one but potentially multiple datacenters. The datacenters are in close proximity and networked together with a low-latency network.

Regions preserve data residency, and offer comprehensive compliance and resiliency options for customers.


Things to consider when using regions and regional pairs
- consider resource and region deployment
- consider service support by region
- consider services that dont require regions
- consider exceptions to region pairing
- consider benefits of data residency


### Azure subscriptions

An azure subscription is logical unit of azure services thats linked to an azure account. An Azure account is an identity in Microsoft Entra ID or a directory thats trusted by Microsoft Entra ID, such as a work or school account. Subscriptions help you organize access to azure cloud service resources and help you control how resource usage is reported, billed and paid.


- Every azure cloud service belongs to a subscription
- each subscription can have a different billing and payment condifuration
- multiple subscriptions can be linked to the same azure account
- more than one azure account can be linked to the same subscription
- billing for azure service is done on a per-subscription basis
- if your azure account is the only account associated with a subscription, you are responsible for the billing requirements
- programmatic operations for a cloud service might require a subscription ID


Things to consider when using subscriptions
- the types of azure accounts required
- consider multiple subscriptions
- a dedicated shared services subscription
- access to resources


Azure offers free and paid subscription options to meet different needs and requirements.

Common subscriptions are **Free**, **Pay-As-You-Go**, **Enterprise Agreement**, **Student**. 

---

### Microsoft Cost Management

Microsoft Cost Management provides support for administrative billing tasks and helps you manage billing access to costs. You can use the product to monitor and control azure spending and optimize your azure resource usage.

- Cost Management shows organizational cost and usage patterns with advanced analytics. Predictive analytics are also available.
- Reports in Cost Management show the usage-based costs consumed by azure services the third party marketplace offerings.
- The product uses azure management groups, budgets and recommendations to show clearly how your expenses are organized and how you might reduce costs.
- you can use azure portal or various API for export automation to integrate cost data with external systems and processes. Automated billing data export and scheduled reports are also available.

---

Things to know about resource tags:
- Each resource tag has a name and a value
- the tag name remains constant for all resources that have the tag applied
- the tag value can be selected from a defined set of values or unique for a specific resource instance.
- A resource or resource group can have a maximum of 50 tag name/value pairs
- tags applied to a resource group arent inherited by the resources in the resource group.


---

### Apply Cost savings

| Cost saving           | Description                                                                                                                                         |
| --------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| Reservations          | Save money by paying ahead, pre-playing allows you to get a discount on the resources you use.                                                      |
| Azure Hybrid Benefits | Access pricing benefits if you have a license that includes software assurance. it helps maximize the value of existing on-premises windows server. |
| Azure credits         | use the monthly credit to develop, test, experiment with new solutions on azure.                                                                    |
| Azure regions         | compare pricing across regions. Pricing can vary from one region to another                                                                         |
| Budgets               | Apply the budgeting features in microsoft cost management to help plan and drive organizational accountability                                      |
| Pricing calculator                      | this service provides estimates in all areas of azure including compute, networking, storage, web, databases.                                                                                                                                                    |

---

### Summary

- Azure subscriptions help you effectively identify and manage costs for your organization, so you can provide services and resources for specific scenarios
- azure regions provide flexibility, data residency, compliance, resiliency options
- azure subscriptions are essential for managing access to azure resources and billing
- azure offers various subscription options such as free, pay-as-you-go, enterprise agreement, student
- azure offers cost-saving options such as reservations, azure hybrid benefits and azure credits
- resource tagging allows for organizing and analyzing resources in azure
- microsoft cost management helps monitor and control azure spending
- the pricing calculator provides billing estimates for different usage cases