

### Servlets

In Java web apps, Servlet container (web server) takes care of translating the HTTP messages for 
java code to understand. One of mostly used servlet container is Apache Tomcat.

Servlet Container converts the HTTP messages into ServletRequest and hand over to Servlet method as a parameter

Similarly, ServletResponse returns as an output to Servlet Container from Servlet. So everything we write inside the Java web apps are driven by Servlets

---

### Filters

Filters inside Java Web Applications can be used to intercept each request/response and do some pre-work before our business logic. So using the same filters, Spring Security enforce security based on our configurations inside a web application

---

### Spring Security Internal Flow


#### Spring Security Filters

A series of spring security filters intercept each request and work together to identify if authentication is required or not.

If authentication is required, accordingly navigate the user to login page or use the existing details stored during the initial authentication

#### Authentication
Filters like _UsernamePasswordAuthenticationFilter_ will extract username/password from HTTP request and prepare Authentication type object. Because Authentication is the core standard of storing authenticated user details inside Spring Security Framework

#### AuthenticationProvider
AuthenticationProviders has all the core logic of validating user details for authentication

#### UserDetailsManager/UserDetailsService
UserDetailsManager/UserDetailsService helps in retrieving, creating, updating, deleting the User details from the DB/storage systems

#### PasswordEncoder
Service interface that helps in encoding and hashing passwords. Otherwise we may have to live with plain text passwords

#### SecurityContext
Once the request has been authenticated, the Authentication will usually be stored in a thread-local SecurityContext managed by the SecurityContextHolder.

This helps during the upcoming requests from the same user

---


## Sequence Flow

 --> Request --> \[<Authentication Filters> {AuthorizationFilter, DefaultLoginPageGeneratingFilter, UsernamePasswordAuthenticationFilter}] --> Extract User Credentials --> \[<Authentication>{UsernamePasswordAuthenticationToken}] --> authenticate() --> \[<AuthenticationManager>{ProviderManager}] --> authenticate() --> \[<AuthenticationProvider>{DaoAuthenticationProvider}] --> loadUserByUsername() -->\[<UserDetailsService>{InMemoryUserDetailsManager}] --> UserDetails -->  \[<AuthenticationProvider>{DaoAuthenticationProvider}] --> Authentication --> \[<AuthenticationManager>{ProviderManager}] --> Authentication --> \[<Authentication>{UsernamePasswordAuthenticationToken} --> Authentication --> \[Authentication Filers {AuthorizationFilter, DefaultLoginPageGeneratingFilter, UsernamePasswordAuthenticationFilter}]  --> Response




