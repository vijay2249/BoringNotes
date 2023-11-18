Contents covered

- Factors that affect costs in azure
- Compare pricing calculator and total cost of Ownership calculator
- Microsoft Cost management tool
- Purpose of tags


## Factors that can affect costs in Azure
Azure shifts development costs from the capital expense of building out and maintaining infrastructure and facilities to an operational expense of renting infrastructure as you need it, whether its compute, storage, networking and so on.

The operational expense cost can be impacted by many factors
- Resource type
    - when you provision an azure resource, azure creates metered instances for that resource.
    - The meters tacks the resources usage and generate a usage record that is used to calculate the bill
- Consumption
    - Azure offers ability to commit to using a set of amount of cloud resources in advanced to and receiving discounts on those "reserved" resources.\
    - When you reserve capacity, you are commiting to using and paying for a certain amount of azure resources during a given period.
    - With the back-up of pay-as-you-go, if you see a sudden surge in demand that eclipses what you have pre-reserved, you just pay for the additional resources in excess of your reservation.
- Maintenance
- Geography
    - Network traffic is also impacted based on geogrpahy. For example, its less expensive to move information within Europe than to move information from Europe to Asia
    - Bandwidth refers to data moving in and out of azure datacenters. Some inbound daa transfers are free. For outbound data transfers, data transfer pricing is based on zones.
- Subscription type
- Azure Marketplace



## Compare Pricing and Total Cost of Ownership calculators

### Pricing Calculator
The pricing calculator is designed to give you an estimated cost for provisioning resources in azure.<br>
The pricing calcualtor focus is on the cost provisioned resources in azure<br>
With the pricing calculator, you can estimate the cost of any provisioned resources, including compute, storage, and associated network costs. You can even account for different storage options like storage type, acces tier, and redundancy

### TCO Calculator
It is designed to help you compare the costs for running an on-premises infrastructure compared to an azure cloud infrastructure. 



## Microsoft Cost Management tool
Cost Management provides tha bility to quickly check azure resource costs, create alerts based on resource spend and create budgets that can be used to automate management of resources


Cost analysis is a subset of Cost Management that provides a quick visual for your azure costs. 

[Cost Analysis demo](../../images/cost-analysis-b52dedab.png)


### Cost Alerts
Cost alerts provide a single location to quickly check on all of the different alert types that may show up in the _cost management service_.
1. Budget alerts
    1. Notify you when spending, based on usage or cost, reaches or exceeds the amount defined in the alert condition of the budget.
    2. Budget alerts support both cost based and usage based budgets. 
2. Credit alerts
    1. Notify user when user auzre credit monetory commitments are consumed.
3. Department spending quota alerts
    1. Notify users when department spending reaches a fixed threshold of the quota. 



## Purpose of Tags
Tags provide extra information or metedata about your resources.

This metadata is useful for
- Resource Management
    - Tags enable user to locate and act on resources that are associated with specific workloads, envs, business units, and owners
- Cost management and optimization
- Operations Management
- Security
- Governance and regulatory compliance
- Workload optimization and automation


### Managing resource tags
User can add, modify, delete resource tags through windows powershell, azure CLI, azure resource manager templates, REST API, in azure portal.<br>
User can use _Azure Policy_ to enforce tagging rules and conventions

Resources dont inherit tags from subscriptions and resource groups, meaning that you can apply tags at one level and not having those tags automatically show up at a different level, allowing you to create custom tagging schemas that change depending on the level(resource, resource group, subscription etc.)