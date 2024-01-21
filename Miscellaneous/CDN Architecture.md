
### Overview
CDNs have become a must have to combat latency and a requirement for any major company delivering content to users on the internet.
While providing performance and reliability for users, CDNs also enable companies to further secure their application and cut costs.



### Traditional challenges deploying web applications

Companies running their applications on the cloud or on-premises are faced with the challenges of
1. implementing solutions to increase performance
2. As demand grows, scaling out their architecture to meet availability and redundancy concerns
3. Securing their environments and applications from growing internet threats
4. Reining in growing costs related to doing all the above tasks

Traditionally a website is deployed centrally and replicated to another region for availability or the website is deployed across a handful of servers sometimes across multiple data centers for resiliency.


The servers hosting the website are called _origin servers_. When clients access a website, they make a request for resources from the server. Navigating to one website can generate hundreds of requests from the browser for HTML, CSS, images, videos, etc. With versions of HTTP prior to HTTP/2, each of these HTTP requests would also require a new TCP connection.


Enhancements in HTTP/2 and HTTP/3 allow for multiplexing multiple requests to the same server over a single TCP connection, thus saving server resources. However, computer and network resources are still consumes as servers respond to these requests. 

As more clients access the website, the following scenarios can happen
- The origin server starts to become overloaded with requests, impacting availability. Companies start looking at scaling out to handle the additional load
- As each request has to make its way to origin server performance and user experience is impacted due to latency
- The latency for end users become proportional to the distance between the client and origin server, this resulting in varying experiences based on client location
- As origin servers respond to the increasing requests, bandwidth, egress, and compute costs increase drastically
- Even as customers scale out to handle the increased demand in traffic, they are left exposed both infrastructure level and application level distributed-denial-of-service attacks.

![[HTTP_request_with_no_cdn.png]]


### How a CDN tackles web application challenges

A CDN helps address the challenges customer face around latency, performance, availability, redundancy, security and costs

A CDNs core goal is to decrease latency and increase performance for websites and applications by caching content as close as possible to end users or those accessing the content.

CDNs decrease latency and increase performance by having many data center locations across globe that cache the content from the origin server. The goal is to have content cached as close a possible to users, to content is cached at the edge of CDN providers network.


### Benefits
- __Improved Website load time__
	- instead of every client making a request to the origin server, which could be located a considerable distance away, the request is routed to a local server that responds with cached content, thus decreasing latency and increasing overall performance.
	- Regardless of where the origin server and clients are located, performance will be more consistent for all users, as the CDN will server locally cached content when possible
- __Increased content availability and redundancy__
	- because every client request no longer needs to be send to the origin server, CDN also provide not only performance benefits, but also availability and redundancy.
	- Requests are load balanced over local servers with cached content. these servers respond to local requests, significantly decreasing overall load on the origin server. The origin server only is contacted when needed.
- __Improved website security__
	- a CDN acts as a reverse proxy and sits in front of origin server. Thus it can provide enhanced security such as DDoS mitigation, improvements to security certificates and other optimizations.
- __Reduced bandwidth costs__
	- because CDN use cached content to respond to requests, the number of requests sent to the origin server is reduced, thus also reducing associated bandwidth costs.


### Routing requests to CDN nodes

Routing requests to CDN nodes can be done via two different methods

#### DNS unicast routing

In this method, recursive DNS queries redirect requests to CDN nodes, the clients DNS resolver forwards requests to the CDNs authoritative nameserver. CDNs based on DNS unicast routing are not ideal in that clients may be geographically dispersed from the DNS resolver.

Decisions on closest-proximity CDN nodes are based on the clients DNS server instead of clients IP address. Also if any changes are needed for the DNS response, there is a dependency on DNS time to live expiration

Further, since DNS routing uses unicast addresses, traffic is routed directly to a specific node, creating possible concerns when there are traffic spikes as in a DDoS attack.

Another challenge with DNS-based CDNs is that DNS is not very graceful upon failover.


#### Anycast routing
Anycast allows for nodes on a network to have the same IP address. The same IP address is announced for multiple nodes in different locations and client redirection is handled via the internets routing protocols, BGP

Using an Anycast-based CDN has several advantages
1. Incoming traffic is routed to the nearest data center with the capacity to process the requests efficiently
2. Availability and redundancy is inherently provided. Since multiple nodes have the same IP address. if one node were to fail, requests are simply routed to another node in close proximity
3. Because Anycast distributed traffic across multiple data centers, it increases the overall surface area, thus preventing any one location from becoming overwhelmed with requests. For this reason anycast networks are very resilient to DDoS attacks.


![[HTTP_request_to_cloudflare_cdn.png]]

Cloudflare is a reverse proxy, meaning it receives requests from clients and proxies the requests back to the users origin servers.

The Cloudflare CDN leverages the cloudflare global anycast network. This the incoming request is routed and answered by the node closest to the user

Edge nodes within the cloudflare network cache content from the origin servers and are able to respond requests via a cached copy. Cloudflare also provides DNS, DDoS protection, WAF and other performance, reliability and security services using the same edge architecture.


### Tiered Cache

Once a site is onboarded, standard caching is configured by default. With standard caching each data center acts as a directly reverse proxy for the origin servers. A cache miss in any data center results in a request being sent to the origin server from the ingress data center.

With tiered cache, certain data centers are reverse proxies to the origin for other data centers, resulting in more cache hits and faster response times

Tiered cache leverages the scale of cloudflare networks to minimize requests to customer origins. When a request comes into a cloudflare data center, if the requested content is not locally cached, other cloudflare data centers are checked for the cached content

Argo Smart Routing can also be enabled as an add-on to provide the fastest paths between data centers and origin servers for cache misses and other types of dynamic traffic.


### Traffic Flow: Tiered Cache, Smart Tiered Cache topology

![[HTTP_requests-traffic-flow-through-cloudflare-CDN.png]]



### Argo Smart Routing

It is a service that finds optimized routes across the cloudflare network to deliver responses to users more quickly.

Argo Smart routing accelerates traffic by taking into account real time data and network intelligence from routing nearly 50 million HTTP requests per second, it ensures the fastest and most reliable network paths are traversed over the cloudflare network to the origin server.


### Cache Reserve

Expanding on the idea of Tiered Cache, Cache Reserve further utilizes the scale and speed of cloudflare network while additionally leveraging R2, Cloudflare's persistent object storage, to cache content even longer. 

Cache Reserve helps customers reduce bills by eliminating egress fees from origins while also providing multiple layers of resiliency and protection to make sure that the content is reliably available which improves website performance by having content load faster. Basically, Cache reserve is an additional higher tier of cache with longer retention duration.

Cache reserve has a retention period of 30 days which means it will hold cached content for 30 days regardless of cached headers or TTL policy. The TTL policy still affects the contents freshness which means the content cache TTL expires inside of Cache Reserve, the content will need to be revalidated by checking the origin for any updates.

### Traffic Flow: Cache Reserve Topology

![[traffic_flow_cache_reserve_topology.png]]

