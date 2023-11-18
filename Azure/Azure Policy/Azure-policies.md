# Azure-policies

### Introduction

Policy is the backbone of azure implementation and compliance.\
Through _Azure Policy_, user can control the types of resources that can be provisioned, or user can restrict the locations where resources can be provisioned.

[Policy dashboard](../images/1-azure-policy.png)

### What is it?

_Azure Policy_ is a service that user can use to create, assign, manage policy definitions.\
Policy definitions impose different rules and actions on your resource, so that those resources remain in compliance with corporate standards.\
Policies focuses on both the properties of resources during deployment and for existing resources.

Azure Policy is used to

* Enforcement compliance by
  * turning on built-in policies or building custom policies for all resource types
  * performing real-time policy evaluation and enforcement
  * performing periodic and on-demand compliance evaluation
  * implementing VM in-guest policy
* Apply policies at scale
  * apply policies to a management group with control across entire organization
  * Handle exclusion scopes.
* Remediation
  * real time remediation
  * remediation on existing resources

#### How it works

Some keywords to start with

**Policy** : business rule to be applied within your organization, written in JSON format\


**Initiative**: set of policies combined to simplify management. Written in JSON format

**Definitions**: list of built-in or custom initiatives and policies available to be assigned

**Assignments**: associations of initiative or policies with scopes. Assignments are inherited by all child resources.

**Exemptions**: used to exempt a resource hierarchically or an individual resource from the evaluation of initiatives or definitions

**Remediation**: way to handle non-compliant resources.

Azure policy covers all azure resources, including arc-enabled resources. Using azure policy is free for azure resources but there is a fee associated for an arc resource.

> Azure Arc is a service that allows user to manage some resource types hosted outside of azure.

#### When to use it

These policy definitions are mainly used to implementing governance for resource consistency, regulatory compliance, security, cost and management

You can specify configuration requirements for any resources that are created and take one of the actions

1. Identify resources that are out of compliance
2. Block the resources from being created
3. Add the required configuration

There are four topics to be considered for a successful implementation of azure policies

1. Assessment
   1. Overview about the status of your environment
   2. before making changes in the environment through policies to take actions assign a policy just to audit your environment.
2. Test
3. Deploy
4. Check

Policy assignments dont come into effect immediately, there is a policy evaluation delay which is around 30 minutes or so.\
Also auditing resources might take some time, as the azure policy engine needs to evaluate all resources aganist policy rules within the assigned scope.
