
### What is Cloudflare?

_Cloudflare is a global network of servers._

When user adds cloudflare to their application, this created a network in between customer request and server response network route and does all the network security checks and all available features.

![[website-with-cloudflare-3464878e.svg]]

In this sitting position, cloudflare can 
1. speed-up content delivery and user experience
2. protect website from malicious activity
	1. DDoS attacks
	2. WAF - web application firewall
3. Load Balancing


### How Cloudflare works?

Fundamentally, cloudflare is large network of servers, these can improve the security, performance and reliability of anything connected to the internet.

For all this to work, cloudflare serves as the _reverse proxy_ for all users applications web traffic.

All the requests to and from your origin flow through cloudflare and as these requests pass through the cloudflare network, various security rules and optimization techniques are applied.


#### Life of a request
A website's content does not technically live at a URL like `www.example.com`, but rather at an IP address like `232.55.23.190`

This conversion of URL into IP address is called __DNS Lookup__


In general, the request from a customer for `example.com`, DNS lookups for application URL return the IP address of origin IP address

![[Without Cloudflare DNS proxy.canvas]]

with cloudflare, user domains or subdomain is using _proxied DNS records_ - DNS lookups for the application URL will resolve to _Cloudflare Anycast IP_ instead of user original DNS target.


This means that all requests intended for proxied hostnames will go to cloudflare first and then be forwarded to origin server.

Cloudflare assigns specific Anycast IPs to users domain dynamically and these IP address may change at any time. This is an expected part of operation for cloudflare Anycast network and does not affect the proxy behavior that is described.

### Benefits

- Beyond hiding users IP address, cloudflare also stops malicious traffic before it reaches your origin web server.
- Cloudflare automatically mitigates security risks using WAF, DDoS
- For proxied traffic, Cloudflare also serves as a CDN, caching static resources and otherwise optimizing asset delivery
- Cloudflare globally distributed Anycast network routes visitor requests to the nearest cloudflare data center


Cloudflare maintains infrastructure-level nameservers that are integral to the functioning of the internet. One key example is the f-root server network which cloudflare is partially responsible for hosting. The F-root is one of the root level DNS nameserver infrastructure components responsible for the billions of Internet requests per day. 

Cloudflare _AnyCast network_ puts it in a unique position to handle large volumes of DNS traffic without service interruption

---

### Glossary

### What is _reverse proxy | Proxy servers_


#### What is a reverse proxy?
A reveres proxy is a server that sits in front of web servers and forwards clients requests to those web servers.

Reverse proxies are typically implemented to help increase security, performance and reliability.


#### Before deep diving, what exactly is _proxy server?_
A _forward proxy_, often called _proxy or proxy server or web proxy_ is a server that sits in front of a group of client machines.

When computers make requests to sites and services on the internet, the proxy server intercepts those requests and then communicates with web servers on behalf of those clients like a middleman.


![[Forward_Proxy_Flow.png]]

In a standard internet communication, Computer A would reach out directly to computer C with the client sending requests to the _origin server_ and the origin server responding to the client.


### How is _reverse proxy different?_
A reverse proxy is a server that sits in front of one or more web servers, intercepting requests from clients. 

With a reverse proxy, when clients send requests to the origin server of a website, those requests are intercepted at the network edge by the reverse proxy server. The reverse proxy server will then send requests to and receive responses from the origin server.

![[Reverse_Proxy_Flow.png]]

The difference between a forward and reverse proxy is subtle but important.
A simplified way to sum it up would be to say that a forward proxy sits in front of a client and ensures that no origin server ever communicates directly with that specific client. On the other hand, reverse proxy sits in front of an origin server and ensures that no client ever communicates directly with that origin server.


Benefits of reverse proxy include:
1. Load balancing
2. Protection from attacks
	1. with  a reverse proxy in place, a website or service never needs to reveal the IP address of their origin server. This makes it much harder for attackers to leverage a targeted attack against them such as DDoS attack. 
	2. Instead attackers will only be able to target the reverse proxy, such as Cloudflare's CDN, 
3. Global Server load balancing
	1. In this form of load balancing, a website can be distributed on several servers around the globe and the reverse proxy will send clients to the server that's geographically closest to them. 
	2. This decreases the distance that requests and responses needs to travel, minimizing load times.
4. Caching
	1. a reverse proxy can also cache content, resulting in faster performance
5. SSL encryption
	1. Encryption and decrypting SSL/TLS communications for each client can be computationally expensive for an origin server.
	2. A reverse proxy can be configured to decrypt all incoming requests and encrypt all outgoing responses, freeing up valuable resources on the origin server.


Building own reverse proxies, requires intensive software and hardware engineering resources as well as a significant investment in physical hardware.

One of the easiest and most cost-effective ways to reap all the benefits of a reverse proxy is by signing up for a CDN service. 