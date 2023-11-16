Auto-scaling enables a system to adjust the resources required to meet the varying demand from users, while controlling the costs associated with these resources. 

You can use auto-scaling with many azure services, including web applications.<br>
Auto-scaling requires you to configure autoscale rules that specify the conditions under which resources should be added or removed.

Contents covered:
1. Identify scenarios for which auto-scaling is an appropriate solution
2. create auto-scaling rules for a web app
3. monitor the effects of autoscaling

## Examine Autoscale factors

Autosacling can be triggered according to a schedule, or by assessing whether the system is running short on resuorces.

### What is autoscaling?
Autoscaling is a cloud system or process that adjust available resources based on the current demand. Autoscaling performs scaling in and out as opposed to scaling up and down.

### Azure app service autoscaling
Autoscaling doesnt have any effect on the CPU power, memory or storage capacity of the web servers powering the app, it only changes the number of web servers.


#### Autoscaling rules
A rule specifies the threshold for a metric, and triggers an autoscale event when this threashold is crossed.<br>
Autoscaling can also deallocate resources when the workload has diminished.



### When should you consider autoscaling?
Autoscaling isnt the best approach to handling long term growth. You might have a web app that starts with a few users, but increases in popularity over time. Autoscaling has an overhead associated with monitoring resources and determining whether to trigger a scaling event.<br>
In this scenario, if you can anticipate the rate of growth, manually scaling the system over time may be a more cost effective approach.




## Identify autoscale factors
Effective autoscaling ensures sufficient resources are available to handle large volumes of requests at peak time, while managing costs when the demand drops.

### Autoscaling related to service plan
To prevent runaway autoscaling, an app service plan has an instance limit. Plans in more expensive tier have a higher limit. Autoscaling cant create more than this limit.


### Autoscale conditions
You can indicate how to autoscale by creating autoscale conditions.<br>
Azure provides two options for autoscaling
1. Scale based on metric, such as length of disk queue, number of HTTP requests awaiting processing
2. Scale to be specific instance count according to a schedule. 

You can also combine metric and schedule-based autoscaling in the same autoscale condition. You can create multiple autoscale conditions to handle different schedules and metrics.

An app service plan also has a default condition that is used if none of the other conditions are applicable. This condition is always active and doesnt have a schedule.


### Metrics for autoscale rules
Metrics that you as a app service user can monitor are
1. CPU percentage usage
2. Memory percentage
3. Disk Queue Length
4. HTTP Queue length
5. Data in
6. Data out



### How an autoscale rule analyzes metrics
Autoscaling works by analyzing trends in metric values over time across all instances. Analysis is a multi-step process

__Step 1__

    - an autoscale rule aggregates the values retrieved for a metric for all instances across a period of time known as the _time grain_.
    - each metric has its own intrinsic _time grain_

__Step 2__

    - An autoscale rule performs a second step that performs a futher aggregration of the value calculated by the time aggregration over a longer, user-specified period, known as _Duration_
    - The minimium _Duration_ is 5 minutes.

__Step 3__
    
    - The aggregration calculation for the _Duration_ can be different from the time grain
    - If the time aggregration is average and the statistic gathered is CPU percentage across a one-minute time grain, each minute the average CPU percentage utilization across all instances for that minute is calculated.
    - If the time grain statistic is set to mazximum and the duration is set to 10 minutes, the max of the 10 average values for the CPI percentage utilization is to determine whether the rule threshold has been crossed or not.



### Autoscale actions
An autoscale action can be _scale-in_ or _scale-out_

An autoscale action uses an operator ( >, <, =, != etc..) to determine how to react to the threshold.

An autoscale action has a cool down period, specified in minutes. During this interval, the scale rule wont be triggered again. This is to allow the system to atabilize between autoscale events.<br>
This minimum cool down period is 5 minutes.


### Pairing autoscale rules
It is recommended to define scaling rules for both scale-in and scale-out possibilities.


### Combining autoscale rules
A single autoscale rule can contain multiple autoscale rules. However the autoscale condition dont have to be directly related.<br>
When determining whether to scale out, the autoscale action is performed if __any__ of the scale-out rules are met and similarlly the same applies to scale in rules.



## Enable autoscale in App Service
By default, an App Service Plan only implements manual scaling. Selecting __Custom autoscale__ reveals condition groups you can use to manage your scale settings.


### Add scaling condition in web portal
[Autoscale options](../../images/autoscale-conditions.png)

### create scale rules
[Autoscale rules](../../images/autoscale-rules.png)

### Monitor autoscaling activity
[Autoscale history](../../images/autoscale-run-history.png)


## Explore autoscale best practices

- Ensure the max and min values are different and have an adequate margin between them
- Choose the appropriate statistic for your diagnostics metric
- Choose the thresholds carefully for all metric types
- Always select a safe default instance count
- Configure autoscale notifications

You can also use an activity log alert to monitor the health of the autoscale engine. In addition to using activity log alerts, you can also configure email or webhook notifications to get notified for successful scale actions via the notifications tab on the autoscale setting.