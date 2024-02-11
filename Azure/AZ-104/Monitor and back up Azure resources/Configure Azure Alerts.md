- identify azure monitor alerts, including alert types and alert states
- configure azure monitor alerts
- create alert rules and action groups

---


Azure Monitor alerts provide a way to capture telemetry data and detect potential problems in your infrastructure or applications.

Azure Monitor captures logs and metrics telemetry data for your infrastructure or applications so you can analyze and identify potential problems. You can configure Azure alerts to initiate responsive action and send notifications based on your telemetry data. 

Azure alerts help you detect and address issues to keep your applications running and prevent service disruptions for your users.

An alert consists of alert rules that combine the settings and conditions you want to monitor, including
- resources to monitor
- signals or telemetry to gather from the resources
- conditions to match

![[azure-alert-process.png]]

Most common types of alerts
1. **Metric alerts**: evaluate metrics data from your resources at regular intervals. Metric alerts can apply multiple conditions and dynamic thresholds
2. __Log alerts__: use log analytics queries in the azure portal to evaluate resource logs at a predefined frequency
3. __Activity log events__: implement alerts to trigger when a new activity log event occurs that meets your conditions. resource health alerts and service health alerts are two types of activity log alerts
4. __Smart detection alerts__: receive automatic warnings about potential performance issues and failure anomalies in your web apps by using smart detection on your application insights resource. 

In the Azure portal, each alert has a _state_ indicator to identify where the alert and corresponding issue are in the monitoring process.

There are three alert state
1. New -> the issue is new and not in review
2. Acknowledged -> the issue is in review and work is in progress
3. Closed -> the issue is resolved.

Only the initial _New_ state for an alert is set by the system. All other state changes must be made by you as an administrator.

The history of the alert stores all state changes.


The alert state is different and independent of the azure monitor condition.

You can configure most types of alerts as _stateful or stateless_, which corresponds to how many instances of the same alert can be active at the same time.

---

An alert rule consists of several key attributes, the target resource, an alert signal, the rule criteria, the issue severity, and name and description.

The __target resource__ defines the scope and signals that are available for your alert operation. A target can be any azure resource such as vm, an azure storage account or a vm scale set instance.

the target resource for your alert emits a signal based on your selected resource type. The emitted signal can be metric, activity log, application insights or log

---

An action group is a collection of notification preferences that you define as an Azure subscription owner. When Azure Monitor detects an issue in your telemetry data, your alert triggers and your alert rule actions initiate. Azure Monitor, Azure Service Health, and Azure Advisor use _action groups_ to notify users when an alert triggers.

Actions specify how to invoke your defined actions when your action group triggers

You can configure the action group to use an automated action via the __Action type__ attribute
- __Automation runbook__; ability to define, build, orchestrate, manage and report on workflows that support system and network operational process. A runbook workflow can potentially interact with all types of infrastructure elements, such as applications, databases and hardware.
- __Azure functions__: serverless compute service that lets you run event-triggered code without having explicitly provision or manage infrastructure
- __ITSM__: the action can connect azure and a support IT Service Management(ITMS) product or service. This action requires an ITSM connection
- __Logic Apps__: azure logic apps connects your business critical apps and services by automating your workflows.
- __Webhook__: is an HTTP(S) endpoint that allows external applications to communicate with your system.