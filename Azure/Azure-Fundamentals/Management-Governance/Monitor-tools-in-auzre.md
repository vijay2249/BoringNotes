Contents covered
1. purpose of azure advisor
2. azure service health
3. azure monitor, including azure log analytics, azure monitor alerts, application insights


---

## Azure Advisor
Evaluates your azure resoruces and makes recommendations to help improve reliability, security and performance, achieve operational excellence and reduce costs.

The recommendation are available via the azure portal and API, and you can set up notification to alert you to new recommendations.

[Advisor dashboard in portal](../../images/azure-advisor-dashboard-baca22e2.png)

The recommendations are divided into 5 categories
1. Reliability
    - used to ensure and improve the continuity of business critical applications
2. Security
    - detect threats and vulnerabilitites that might lead to security breaches
3. Performance
    - improve the speed of applications
4. Operational Excellence
    - help you achieve process and workflow efficiency, resource manageability and deployment best practices.
5. Cost
    - optimize and reduce your overall azure spending



## Azure Service Health
It helps you keep track of azure resources, both your specifically deployed resources and the overall status of azure.

Azure service health does this by combining three different azure services
1. __Azure status__
    - broad picture of the status of azure globally
    - informs you the service outages in azure on the azure status page
    - This page is view of the health og all azure services across all azure regions.
2. __Service health__
    - provides narrow view of azure services and regions.
    - this is the place to look for service impacting communications about outages, planned maintenance activities and other health advisories because the authenticated service health experience knows which services and resources you currently use.
3. __Resource Health__
    - Tailored view of your actual azure resources.
    - provides information about the health of your individual cloud resources, such as a specific VM instance.

Historical alerts are also stored and are accessible for later review



## Azure Monitor
Platform for collecting data on your resources, analyzing that data, visualizing the information and even acting on the results.<br>
_Azure Monitor_ can monitor azure resources, your on-premises resources and even multi cloud resources like VMs hosted with a different cloud provider.


[Azure Monitor dashboard](../../images/azure-monitor-overview-614cd2fd.svg)


### Azure log analytics
Tool in the azure portal where you will write and run log queries on the data gathered by azure monitor.<br>
Log analytics is a robust tool that supports both simple and complex queries and data analysis


### Azure monitor alerts
Is an automated way to stay informed when azure monitor detects a threshold being crossed. You sent the alert conditions, the notification actions, and then azure monitor alerts notifies when an alert is triggers.<br>
Depending on your configuration, azure monitor alerts can also attempt corrective action



### Application Insights
Is an azure monitor feature, monitors your web applications. Application Insights is capable of monitoring applications that are running in azure, on-premises or in a different cloud environment.

You can either install an SDK in your application or you can use the application insights agent.<br>
The application agent is supported in C#, .NET, VB.NET, Java, JS, NodeJS, Python.

Once application insight is up and running, you can use it to monitor
1. Request rates, response times, failure rates
2. Dependency rates, response times and failure rates to show whether external services are slowing down performance
3. Page views and load performance reported by users browsers
4. AJAX calls from web pages, including rates, response times, and failure rates.
5. User and session counts
6. Performance counters from windows or linux server machinesm such as CPU, memory, network usage etc.
