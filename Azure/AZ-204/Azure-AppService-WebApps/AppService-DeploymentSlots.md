The deployment slot functionality in App service is a powerful tool that enables you to preview, manage, test and deploy your different environments.


Contents covered.
1. Describe the benefits of using deployment slots
2. Understand how slot swapping operates in App Service
3. Perform manual swaps and enable auto swap
4. Route traffic manually and automatically.


You need to have some knowledge about creating apps in azure portal :)


## Explore staging Environments
Deployment slots are live apps with their host own host names. App content and configurations elements can be swapped between two deployment slots, including the production slots.

- Deploying th app to a slot first and swapping it into prodction makes sure that all instances of the slot are warmed up before being swapped into production. 
- This eliminates downtime when you deploy your app. The traffic redirection is seamless and no requests are dropped because of swap operations. There is an option to automate this whole process too.
- If the changes swapped into the production slot arent as you expect, you can perform the same swap immediately to get your "last known good site" back.

Each app service plan tier supports a different number of deployment slots. There is no extra charge for using deployment slots.

When you create a new slot the new deployment slot has no content, even if you clone the settings from a different slot. You can deploy to the slot from a different repository branch or a different repository.



## Examine Slot swapping
When you swap two slots, App service does the following to ensure that the target slot doesnt experience downtime.
1. Apply the following settings from the target slot to all instances of the source slot
    1. slot specific app settings and connection strings if applicable
    2. Continuous deployment settings, if enabled
    3. App service authentication settings, if enabled
2. Wait for every instance in the source slot to complete its restart
    - If any instance fails to restart, the swap operation reverts all changes to the source slot and stops the operation
3. If local cahce is enabled, trigger local cache initialization by making HTTP request to the application root on each instance to the source slot.
    - wait untill each instance returns any HTTP response. Local cache initialization causes another restart on each instance
4. If auto swap is enabled with custom warn-up , trigger application initialization by making an HTTP request to the application root on each instance of the source slot.
    - if `applicationInitialization` isnt specified, trigger an HTTP request to the application root of the source slot on each instance
    - If an instance returns any HTTP response, its considered warmed up
5. If all instances on the source slot are warmed up successfully, swap the two slots by switching the routing rules for the two slots.
6. Now that the source slot has the pre-swap app previously in the target slot, perform the same operation by applying all settings and restarting the instances


The target slot remains online while the source slot is being prepared and warmed up, regardless of where the swap succeeds or fails.

To swap a staging slot with the production slot, make sure that the production slot is always the target slot. This way, the swap operation doesnt affect your production app status.


When you clone configuration from another deployment slot, the cloned configuration is editable. Some configuration elements follow the content across a swap, whereas other configuration elements stay in the same slot after a swap.

> To make settings swappable, add the app setting **WEBSITE_OVERRIDE_PRESERVE_DEFAULT_STICKY_SLOT_SETTINGS** in every slot of the app and set its value to `0` or `false`. These settings are either all swappable or not at all. You cant make just some settings swappable and not the others. Managed identities are never swapped and are not affected by this override app setting



## Swap deployment slots
Before you swap an app from a deployment slot into production, make sure that production is your target slow and that all settings in the source slot are configured exactly as you want to have them in production.

### Manually swapping deployment slots
You can manually swap the deployment slots in __Deployment Slot__ page under __Swap__ option.<br>
You can configure settings and connection strings before you can swap. Select the preview option to preview the swap before swapping.


### Swap with preview(multi-phase swap)

[ => Couldnt understand it well, need to go throug it again. ]


### Configure auto swap
Auto swap streamlines Azure DevOps scenarios where you want to deploy your app continuously with zero cold starts and zero downtime for customers of the app.

When auto swap is enabled from a slot into production, everytime you push your code changes to that slot. App service automatically swaps the app into production after its warmed up in the source slot.

> Auto swap is currently not supported in web apps on Linux and Web App for containers as of November 2023


To configure auto-swap
1. Go to __resource__ page of app and select __deployment slot__ 
2. Set __Auto swap enabled__ to On. Then select the desired target slot for auto swap deployment slot. and select __Save__ on the command bar.
3. Execute a code push to the source slot, auto swap happens after a short time and the update is reflected at your target slots URL.


### Specify custom warm-up
Some apps might require custom warm-up actions before the swap. The `applicationInitialization` configuration element in web.config lets you specify custom initialization actions. The swap operation waits for this custom warm-up to finish before swapping with the target slot. 

More info at -> For more information on customizing the applicationInitialization element, see [most-common-deployment-slot-swap-failures-and-how-to-fix-them](https://ruslany.net/2017/11/most-common-deployment-slot-swap-failures-and-how-to-fix-them/)


### Rollback and monitor a swap
If any errors occur in the target slot, after a slot swap, restore the slots to their pre-swap states by swapping the same two slots immediately.<br>
A swap operation appears in the log query as `Swap Web App Slots`, you can expand it and select one of the suboperations or errors to see the details.




## Route traffic in App Service
By default, all client requests to the apps production url are routed to the production slot.

### Route production traffic automatically
To route production traffic automatically<br>
Go to __Deployment Slots__ page --> in the __Traffic %__ column of the slot you want to route to, specify a percentage to represent the amount of total traffic you want to route. --> select __Save__

On the client browser, you can see which slot your session pinned to by looking at the `x-ms-routing-name` cookie in HTTP headers.<br>
A request thats routed to the "staging" slot as the cookie `x-ms-routing-name=stating`. <br>
A request thats routed to the production slot has the cookie `x-ms-routing-name=self`



### Route production traffic manually
To route production traffic manually, use the `x-ms-routine-name` query parameter<br>
Using `x-ms-routing-name=stating` query parameter, will redirect to staging slot and `x-ms-routing-name=self` this to production slot.

But by default new slots are given a routing rule of 0%.