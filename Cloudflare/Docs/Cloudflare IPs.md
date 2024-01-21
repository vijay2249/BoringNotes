Cloudflare has several IP address ranges which are shared by all proxied hostnames.

Together, these IP addresses form the backbone of cloudflare's _Anycast network_, helping distribute traffic amongst various edge network servers.


Because of [how cloudflare works](https://developers.cloudflare.com/fundamentals/concepts/how-cloudflare-works/), all traffic to proxied DNS records pass through cloudflare before reaching users origin server. This means that users origin server will stop receiving traffic from individual visitor IP addresses and instead receive from Cloudflare IP addresses, which are shared by all proxied hostnames.

This setup can cause issues if users origin server block or rate limits connections from cloudflare IP addresses. Because all visitor traffic will appear to come from cloudflare IP addresses, blocking these IPs (even accidentally) will prevent visitor traffic from reaching users applications.

> To avoid rate limiting or blocking these requests, users need to allow Cloudflare IPs at users origin server.


Once cloudflare starts advertising users IP prefixes, it will accept IP packets destined for users network, process them, and then output these packets to users origin servers.