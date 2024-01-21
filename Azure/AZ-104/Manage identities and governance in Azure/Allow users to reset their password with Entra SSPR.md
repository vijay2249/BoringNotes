
- decide whether to implement self-service password reset
- Implement self-service password reset (sspr) to meet your requirements
- Configure self-service password reset to customize the experience


---

### Why use SSPR

In Entra ID, any user can change their password if they are already signed in. But if they are not signed in and forgot their password or its expired, they will need to reset their password. With SSPR, users can reset their passwords in a web browser or from a window sign-in screen to regain access to azure and to other applications as well.

SSPR reduces the load on administrators because users can fix password problems themselves without having to call the help desk.

---

### How SSPR work

The user initiates a password reset either by going directly to password-reset portal or by selecting the *Cant access your account* link on the sign-in page.

The reset portal takes these steps
1. **Localization** : portal checks the browsers locale setting and renders the SSPR page in the appropriate language
2. **Verification** : user enters their username and passes a captcha to ensure that its a user and not a bot
3. **Authentication** : User enters the required data to authenticate their identity.
4. **Password reset** : if user passes the authentication tests, they can enter a new password and confirm it.
5. **Notification** : Message is sent to the user to confirm the reset process.

As an administrator, you can choose the methods to use when you configure SSPR for authentication.

The available methods are:
1. **Mobile app notification** - install authenticator app - register - verify/deny the password reset via app notification
2. **Mobile App code** - install authenticator app - enter code shown in app
3. **Email** - provide email address thats external to azure - enter code sent to email address
4. **Mobile Phone** - provide mobile phone number - enter code sent to mobile number via sms/whatsapp/call
5. **Office phone** - provide a nonmobile phone number - you receive an automated call to this number and press "#"
6. **Security Questions** - select some predefined security questions and set some predefined answers to it. - answer these questions when asked in the process.


For accounts associated with administrator roles
- strong two method authentication policy is always applied to accounts with an administrator role, regardless of your configuration for other users.
- The security question method isnt available to accounts associated with an administrator role.


---

### SSPR Deployment options

You can deploy SSPR with password writeback using _Microsoft Entra Connect_ or _cloud sync_ depending on user needs. You can deploy each option side by side in different domains to target different set of users.


---

Before you start to configure SSPR, you need these things in place
1. Microsoft Entra Organization - this org must have at least a trial license enabled
2. Microsoft Entra account with Global Admin privileges - you will use this account to setup SSPR
3. Non-Admin user account - use this account to test SSPR
4. Security group with which to test the configuration - non-admin user account must be a member of this group. You will use this security group to limit who you roll SSPR out to.


**Scope of SSPR rollout**
- **Disabled** - no user in the entra org can use SSPR. This is set by default
- **Enabled** - all users in the entra org can use SSPR
- **Selected** - only members of specified security group can use SSPR. You can use this option to enable SSPR for a targeted group of users who can test it and verify that it works as expected.

