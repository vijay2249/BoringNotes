
- create management groups to target policies and spending budgets
- implement azure policy with policy and initiative definitions
- scope azure policies and determine compliance


---


Azure policy is a service in azure that enables you to create, assign and manage policies to control or audit your resources. these policies enforce different rules over resource configurations so the configurations stay compliant with corporate standards.

Azure management groups provide a level of scope and control above your subscriptions. 

Things to know about management groups
- by default, all new subscriptions are placed under the top-level management group or root group
- all subscriptions within a management group automatically inherit the conditions applied to that management group
- management group tree can support up to six levels of depth
- azure role based access control authorization for management group operations isnt enabled by default


the main advantage of azure policy are in the areas of enforcement and compliance, scaling, and remediation.


---

 There are four basic steps to create and work with policy definitions in azure policy:
 1. Create policy definitions
 2. Create initiative definition
	 1. it is a set of policy definitions that help you track your resource compliance state to meet a larger goal.
	 2. you can use an initiative definition to ensure resources are compliant with security regulations
 3. Scope the initiative definition
	 1. azure policy lets you control how your initiative definitions are applied to resources in your organization
 4. Determine compliance
	 1. after you assign a initiative definition you can evaluate the state of compliance for all your resources. Individual resources, resource groups, and subscriptions within a scope can be exempted form having the policy rules affect it.
	 2. Exclusions are handled individually for each assignment.

Built-in initiative definitions
- audit machines with insecure password security settings
- configure windows machines to run azure monitor agent and associate them to a data collection rule
- configure azure defender to be enabled on SQL servers.


Management groups facilitate the hierarchical ordering of Azure resources into collections, at a level of scope above subscriptions. Distinct governance conditions can be applied to each management group, with Azure Policy and Azure role-based access controls, to manage Azure subscriptions effectively. The resources and subscriptions assigned to a management group automatically inherit the conditions applied to the management group.

