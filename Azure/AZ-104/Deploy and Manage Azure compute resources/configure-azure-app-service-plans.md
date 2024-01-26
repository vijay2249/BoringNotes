- identify features and usage cases for azure app service
- select an appropriate azure app service plan pricing tier
- scale an azure app service plan


---

In Azure app service, an application runs in an azure app service plan. App service plan defines a set of compute resources for a web application to run. 

The compute resources are analogous to a server farm in conventional web hosting. One or more applications can be configured to run on the same computing resources (or in the same app service plan)

When you create an app service plan in a region, a set of compute resources is created for the plan in the specified region. Any applications that you place into the plan run on the compute resources defined by the plan.

Each app service plan defines three settings
1. Region
2. Number of VM instances
3. Size of VM instances

If your plan is configured to run five VM instances, then all applications in the plan run on all five instances. If your plan is configured for autoscaling, then all applications in the plan are scaled out together based on the auto-scale settings


Things to consider when using app service plans
1. consider cost savings
2. consider multiple applications in one plan
3. consider plan capacity - overloading an App Service plan can potentially cause downtime for new existing applications
4. consider application isolation


---

**Free and Shared service plans** are base tiers that run on the same azure virtual machines as other applications. Some applications might belong to other consumers. No SLA is provided for Free and Shared service plans.


---

### Scale up and Scale out Azure app service

There are two methods for scaling your azure app service plan and applications: _scale up_ and _scale out_.


- The scale up method increases the amount of CPU, memory and disk space. Scaling up gives you extra features like dedicated vms, custom domains and certificates, staging slots, autoscaling and more. 
- Scale out method increases the number of virtual machine instances that run your application. 


- When you change your scale setting, you dont need to change your code or redeploy your applications. 
- If your app service application depends on other azure services, such as Azure SQL database or Azure Storage, you can scale these resources separately. These resources arent managed by your app service plan.