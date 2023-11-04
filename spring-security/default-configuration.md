By default Spring security framework protects all the paths present inside the web application

This behavior is due to the code present inside the method _defaultSecurityFilterChain(HttpSecurity http)_ of class _SpringBootWebSecurityConfiguration_


```java
@Bean
@Order(SecurityProperties.BASIC_AUTH_ORDER)
SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception{
    http.authorizeHttpRequests().anyRequest().authenticated();
    http.formLogin();
    http.httpBasic();
    return http.build();
}
```

The default configuration for web security, it relies on Spring Security content-negotiation strategy to determine what sort of authentication to use.

If the user specifies their own _SecurityFilteChain_ bean, this will back-off completely and the usres should specify all the bits that they want to configure as part of the custom security configuration


---

All the custom requirements for url validations, you need to invoke a method called, `requestMatchers`, this will accept any number of api paths separated by comma and invoke `authenticated()` to authenticate user if they are accessing these api calls or invoke ` permitAll()` method to give access to everyone

Example:
```java

@Bean
SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception {
    http.authorizeHttpRequests(
            (requests) -> requests.requestMatchers("/myAccount","/myBalance","/myLoans","/myCards").authenticated()
                                .requestMatchers("/notices","/contact").permitAll())
        .formLogin(Customizer.withDefaults())
        .httpBasic(Customizer.withDefaults());

    return http.build();
}
```

We can also mention the regex patterns from api endpoints

If you use `/myAccount/**` -> this means consider all endpoints that starts with /myAccount


---

User Management Services

1. UserDetailsService (Interface) -> code interface which loads user-specific data
2. UserDetailsManager (Interface) -> an extension of the userDetailsService which provides the ability to create new users and update existing ones
    1. InMemoryUserDetailsManager
    2. JdbcUserDetailsManager
    3. LdapUserDetailsManager

    These sub three classes are sample implementation classes provided by the spring security team

All the above classes and interfaces uses an interface _UserDetails_ and its implementation which provides the core user information

Regarding the UserDetails object, there are no setter methods, which mean that once the object is created there is no option to update the details of the user directly

Spring Security deals with UserDetails and Authentication separately, hence there are two different implementations you will see in which methods and its implementations are same. But the fuctionalities of why they are created are different 

_Authentication_ is the return type in all the scenarios where we are tyring to determine if the authentication is successful or not.
Example classes include, _AuthenticationProvider_ and _AuthenticationManager_

Similarlly, _UserDetails_ is the return type in all the scenarios where we try to load the user info from the database systems or from inMemoryStorage
Example classes include, _UserDetailsService_ and _UserDetailsManager_


---

How Passwords are validated with default PasswordEncoder


Encoding vs Encryption vs Hashing


Details of PasswordEncoder

```java
public interface PasswordEncoder{
    String encode(CharSequence rawPassword);
    boolean matches(CharSequence rawPassword, String encodedPassword);
    default boolean upgradeEncoding(String encodedPassword){ return false;}
}
```


----
Authentication Providers in Spring Security

The _AuthenticationProvider_ in spring security takes care of the authentication logic. 
The default implementation of the _AuthenticationProvider_ is to deligate the responsibility of finding the user in the system to a _UserDetails_ implementation and _PasswordEncoder_ for password validation.
But if we have a custom authentication requirement that is not fulfilled by Spring Security framework, then we can build our own authentication logic by implementing the _AuthenticationProvider_ interface

It is the responsibility of the _ProviderManager_ which is an implementation of _AuthenticationManager_ to check with all the implementations of _Authentication Providers_ and try to authenticate the user.

--

Details of _AuthenticationProvider_

```java
public interface AuthenticationProvider{
    Authentication authenticate(Authentication authentication) throws AuthenticationException;
    boolean supports(Class<?> authentication);
}
```

`authenticate()` method receives and returns the authentication object, we can implement our custom authentication logic in this `authenticate()` method

The second method in the _AuthenticateProvider_ interface is `supports(Class<?> authentication)`
You will implement this method to return true if the current authentication provider supports the type of the authentication object provided


If the <code>AuthenticationProvider</code> is unable to support authentication of the passed <code>Authentication</code> object, In such case, the next <code>AuthenticationProvider</code> that supports the presented <code>Authentication</code> class will be tried

Once the user is authenticated successfully, then there is no need for storing user credentials in the authentication object, hence after the auth is successful, _ProviderManager_ erases the credentials from authentication object by invoking the method _eraseCredentialsAfterAuthentication_ 

----

CROS & CSRF

CORS - CROSS ORIGIN RESOURCE SHARING
CSRF - CROSS SITE REQUEST FORGERY

CORS is a protocol that enables scripts running on a browser client to interact with resources form a different origin.
For example, if a UI app wishes to make an API call running on a different domain, it would be blocked from doing so by default due to CORS.
It is a specification from W3C implemented by most browsers

**other origins** means the URL being accessed differs from the locatoin that the javascript is running from, by having
    1. a different scheme (HTTP or HTTPS)
    2. a different domain
    3. a different port

--

Handling CORS issue

if we have a scenario where frontend part is trying to connect with REST service deployed on another server, then these kind of communications we can allow with the help of _@CrossOrigin_ annotation

_@CrossOrigin_ allows clients from any domain to consume the API

```java
@CrossOrigin(origins="http://localhost:4200") //allow requests from only specified domains

@CrossOrigin(origins="*") // allow requests from all domains
```


--

Preflight Request:

A CORS preflight request is a _CORS_ request that checks to see if the CORS protocol is understood and a server is aware using specific methods and headers

It is an "OPTIONS" request, using two or three HTTP request headers:
1. Access-Control-Request-Method
2. Origin
3. Access-Control-Request-Headers

A preflight request is automatically issued by a browser and in normal cases, front-end developers dont need to craft such requests themselves. It appears when request is qualified as "_to be preflighted_" and omitted for *simple requests*



This CORS security feature we can also configure using spring-security configurations instead of annotating all the controllers in our application

```java

@Bean
SecurityFilterChain defaultFilterChain(HttpSecurity http) throws Exception{
    http.cros().configurationSource(new CorsCOnfigurationSource(){
        @Override
        public CorsConfiguration getCorsConfiguration(HttpServletRequest request){
            CorsConfiguration config = new CorsConfiguration();
            config.setAllowedOrigins(Collections.singletonList("http://localhost:4200"));
            config.setAllowedMethods(Collections.singletonList("*"));
            config.setAllowCredentials(true);
            config.setAllowedHeaders(Collections.singletonList("*"));
            config.setMaxAge(3600L);
            return config;
        }
    }).authorizeHttpRequests()
    .requestMatchers().authenticated()
    .requestMatchers().permitAll()
    .requestMatchers().denyAll()
    .formLogin()
    .httpBasic()
    .build()

    return http;
}

```

--

Typical Cross-site Request Forgery attack aims to perform an operation in a web application on behalf of a user without their explicit consent. In general, it doesnt directly steal the users identity, but it exploits the user to carry out an action without their will
