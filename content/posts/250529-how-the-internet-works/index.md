---
date: "2025-05-29T14:24:17+02:00"
title: "How the Internet Works"
tags: ["dns", "networking", "internet", "tcp", "http"]
categories: ["tech"]
---

[comment]: <> (https://pyvideo.org/pycon-us-2013/how-the-internet-works.html)

You type https://www.minecraft.net/ into the browser. What happens next?

Every question that we answer below has a protocol associated with it to decode what is needed for the next step. Internet protocols are layered, and they work together to get work done.

Protocol: A format and rules for exchanging information.

### What is minecraft.net?

The internet is a global network of computers, and for these computers to talk to each other, each one needs a unique address. This address takes the form of four numbers separated by dots — something like 192.0.2.1. These are called IP addresses, and the format supports around **4 billion** unique addresses (2³², technically).

But here’s the catch: with billions of devices in homes, offices, and data centers, **4 billion** addresses aren’t enough to give every single device a unique one.

That’s where **private IP addresses** come in. Inside your home, all devices (laptop, phone, TV) are connected to your **Local Area Network (LAN)**, managed by your **router**. These devices use private IPs from a reserved range (like 192.168.x.x) — and so does every other home network in the world.

Now, your router itself gets **one public IP address** from your **Internet Service Provider (ISP)** — this is the address that the outside world sees. Every device in your home shares this public address when talking to the internet.

So how does that work?

A clever technique called **Network Address Translation (NAT)** happens on your router. It translates requests from private IPs inside your network into one public IP outside — and keeps track of which device made which request. It’s like your router is the receptionist forwarding all your calls and routing the replies back to the right extension.

👉 (We’ll dive deeper into NAT in a future post — it’s pretty neat!)

{{<figure src="home-lan.png" alt="Home LAN">}}

Of course, most of us don’t memorize IP addresses — we remember names like minecraft.net. So how does your browser translate that name into an IP address it can actually connect to? That’s where DNS comes in. The answer to all these questions is the **Domain Name Service** or **DNS**. The DNS is a distributed database which keeps track of computer's names and their corresponding IP addresses on the Internet.

{{< callout title="Ping" >}}
[ping](https://linux.die.net/man/8/ping) is an utility used to test the connection between two network nodes. It works by sending a small packet of data (an "echo request") and waiting for a response (an "echo reply"). This process helps determine if a host is reachable and can also provide information about the round-trip time and potential packet loss. 
{{< /callout >}}

**Domain Name Service (DNS)** is the protocol used to translate hostnames to addresses

[minecraft.net](http://minecraft.net) → 13.107.246.77

### Where is minecraft.net?

Once your computer knows the IP address of the server, it needs to figure out how to reach it. That’s the job of the Internet Protocol (IP) — specifically, routing.

{{<figure src="internet-1.png" alt="The Internet">}}

Your request doesn’t travel in a straight line. Instead, it hops across multiple routers and networks to get from your machine to the server. You can actually see this hop-by-hop journey using tools like traceroute.

{{< callout title="Traceroute">}}
[traceroute](https://linux.die.net/man/8/traceroute) is an utility you can use to see the path packets are taking on the way to the destination. Once you have the IP addresses of all the hops, there are APIs which can help you geo-locate the IP addresses so as to visualize the path.
{{< /callout >}}

### How does my computer talk to minecraft.net?

Now that you know where the address is and you can reach the address using the IP protocol’s routing and addressing capability, next step is to establish a connection with the destination and start sending data. This is where the next protocol comes into picture - **Transmission Control Protocol (TCP)**.

TCP is a connection-oriented protocol that ensures your data gets delivered **reliably**. If any packets are lost or dropped along the way, TCP detects it and automatically resends them. This means both your computer and the server can trust that the full message will arrive correctly, in the right order, without needing to handle the complexity themselves.

This reliability makes TCP the go-to choice for application-level protocols like:

- **HTTP** (for websites)
- **SMTP** (for email)
- **IRC** (for chat)

{{<figure src="protocol-stack.png" alt="Protocol Stack">}}

Each application uses a different “port” number, so many different applications can use TCP to talk to an IP address at the same time. The networking stack of the operating system then can separate out the traffic per application.

### What does my computer say to minecraft.net?

Now that your computer knows the server’s address and how to reach it, the final step is figuring out what to say. This is where HTTP (HyperText Transfer Protocol) comes in — it’s the language your browser uses to ask for content from the server.

When you visit a site like minecraft.net, your browser sends an HTTP request asking for things like:
- **HTML** to structure the page
- **CSS** to style it
- **JavaScript** to make it interactive
- Images, videos, or even dynamic data from databases

Once the server responds, your browser puts it all together and renders the webpage you see.
HTTP uses specific verbs to tell the server what kind of action is needed:
- **GET** — retrieve a resource (like a page or image)
- **POST** — submit data (like a login form)
- **PUT/PATCH** — update a resource
- **DELETE** — remove something

For a deeper dive, check out MDN’s guide to HTTP - [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/HTTP)

### Conclusion

So the next time you open your browser and type in a URL, remember: you’re kicking off a beautifully choreographed sequence of events. From DNS resolving the domain, to IP finding a path, to TCP ensuring reliable delivery, to HTTP requesting content — each layer has a job, and each protocol plays its part.

And the best part? It all happens in the blink of an eye.

The internet might feel like magic, but it’s really just a lot of smart systems working together — invisibly, reliably, and constantly — to get you what you asked for.


{{< references >}}
1. [How Does the Internet Works – Stanford](https://web.stanford.edu/class/msande91si/www-spr04/readings/week1/InternetWhitepaper.htm)  
2. [How the Internet Works – Jessica McKellar](https://pyvideo.org/pycon-us-2013/how-the-internet-works.html)  
3. [What happens when – GitHub](https://github.com/alex/what-happens-when)
{{< /references >}}