
- Configure alerts on events in your azure resources based on metrics, log events, and activity log events.
- Learn how to use action groups in response to an alert and how to use alert processing rules to override action groups when necessary

---

Azure monitor receives data from target resources like applications, operating systems, azure resources, azure subscriptions and azure tenants. 

The nature of the resource defines which data types are available. A data type can be _a metric, a log, or both metric and a log_
- The focus for metric-based types is the numerical time-sensitive values that represent some aspect of the target resource
- The focus for log-based data types is the querying of content data held in structured, record based log files that are relevant to the target resource.


Metric - alerts provide an alert trigger when a specific threshold is exceeded
Activity log - alerts notify you when azure resources change state.
Log - alerts are based on things written log files.

---

## Composition of log search rules

Every log alert has an associated search rule. The composition of these rules is as follows:

- **Log query**: Query that runs every time the alert rule fires
- **Time period**: Time range for the query
- **Frequency**: How often the query should run
- **Threshold**: Trigger point for an alert to be created

Log search results are one of two types: _number of records_ or _metric measurement_.

### Number of records

Consider using the number-of-records type of log search when you're working with an event or event-driven data. Examples are syslog and web-app responses.

This type of log search returns a single alert when the number of records in a search result reaches or exceeds the value for the number of records (threshold). For example, when the threshold for the search rule is greater or equal to five, the query results have to return five or more rows of data before the alert is triggered.

### Metric measurement

Metric measurement logs offer the same basic functionality as metric alert logs.

Unlike number-of-records search logs, metric measurement logs require additional criteria to be set:

- **Aggregate function**: The calculation that will be made against the result data. An example is count or average. The result of the function is called **AggregatedValue**.
- **Group field**: A field by which the result will be grouped. This criterion is used with the aggregated value. For example, you might specify that you want the average grouped by computer.
- **Interval**: The time interval by which data is aggregated. For example, if you specify 10 minutes, an alert record is created for each aggregated block of 10 minutes.
- **Threshold**: A point defined by an aggregated value and the total number of breaches.

---

### Monitoring VMs

- Host VM -> Host virtual machine in Azure
- Guest OS -> Windows/Linux OS running on the virtual machine's host
- workloads -> Workloads running in the guest OS that support your business applications
- Applications -> Business application that depends on your VM

Azure automatically collects basic metrics for VM hosts.

To collect metrics and logs from guest OS and client workloads and applications, you need to install Azure Monitor Agent and set up a data collection rule (DCR).

Use Metrics Explorer to view detailed host metrics

In Metrics Explorer, you can select the following values from the dropdown fields:
- **Scope:** If you open Metrics Explorer from a VM, this field is prepopulated with the VM name. You can add more items with the same resource type (VMs) and location.
- **Metric Namespace**: Most resource types have only one namespace, but for some types, you must pick a namespace. For example, storage accounts have separate namespaces for files, tables, blobs, and queues.
- **Metric**: Each metrics namespace has many metrics available to choose from.
- **Aggregation**: For each metric, Metrics Explorer applies a default aggregation. You can use a different aggregation to get different information about the metric.