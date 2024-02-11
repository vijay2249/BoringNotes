
- identify features and usage cases for azure monitor
- configure and interpret metrics and logs
- identify azure monitor components and data types
- configure azure monitor activity logs

---

Azure Monitor is a comprehensive solution that collects, analyzes, and responds to telemetry data from both on-premises and cloud environments.

![[azure-monitor-service.png]]

**Metrics** are numerical values that describe some aspect of a system at a particular point in time. Metrics are lightweight and capable of supporting near real-time scenarios.

**Logs** contain different kinds of data organized into records with different sets of properties for each type. Data like events and traces are stored as logs along with performance data so all the data can be combined for analysis.

- Log Analytics includes a [rich query language](https://learn.microsoft.com/en-us/azure/azure-monitor/log-query/log-query-overview) to help you quickly retrieve, consolidate, and analyze your collected data.


---

Azure monitor can collect data from various sources. You can think of the collected data as being categorized by tiers. Tier can include data collected from many sources, such as
- Your application 
- operating system
- services and resources used by your application
- platform that supports your application


Activity logs are kept for 90 days


After you define a set of filters, you can pin the filter set to the Azure Monitor dashboard. You can also download your activity log search results as a CSV file.