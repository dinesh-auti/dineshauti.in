---
date: "2025-06-09T00:30:45+02:00"
title: "What Is a Distributed System?"
tags: ["distributed-systems", "architecture"]
categories: ["tech"]
---

> A collection of independent computers that appear to its users as one computer  
> <cite class="paper-authors">- Andrew Tannenbaum</cite>

Life was simple when business applications ran on a single server, connected to a single database sitting on a rack in the basement of a company’s office. Everything was local, contained, and relatively easy to reason about.

But that model doesn’t hold up anymore.

As businesses evolved and data became central to every function — from dashboards to machine learning — the demands on infrastructure grew exponentially. Datasets ballooned in size. It became impractical, even impossible, to store and process everything on a single machine.

Sure, you could buy bigger servers — more CPU, more memory, faster disks. That’s **vertical scaling**, and it works… until it doesn’t. There’s always a ceiling. Eventually, the cost, power, or physical limits catch up.

So we turned to **horizontal scaling** — distributing work across many machines. Instead of one enormous box, we used many commodity servers, tied together through software. Each node contributes to a shared task: storing data, running computations, serving traffic. To the outside world, this **fabric of machines behaves like one logical system** — even though it’s anything but under the hood.

That’s a distributed system.

It’s a shift in mindset as much as it is a change in architecture. Suddenly:

- Failures aren’t the exception — they’re expected.
- Latency isn’t just “slow code” — it could be a network hop.
- Debugging isn’t about one stack trace — it’s about correlating events across nodes, logs, and services.

Distributed systems are about scaling beyond what any one computer can do alone. But they’re also about complexity: coordination, consensus, consistency, failure detection, replication, and a dozen other concerns you rarely think about on a single machine.

And yet, they’re everywhere — powering the apps we use daily, the platforms we build on, and the infrastructure the internet runs on. It’s a big shift — but it’s also beautiful in its own way. We build these messy, resilient, collaborative systems out of unreliable parts… and they work. Mostly.

### Summary
- **Failure is a first class citizen** and the system now needs to be designed around it. 
- Solving problems like **consistency, availability, and partition tolerance** ([CAP theorem](https://dineshauti.in/til/250602-cap-theorem-eric-a-brewer/)) becomes crucial.

{{< references >}}
1. [Distributed Systems in One Lesson by Tim Berglund](https://www.youtube.com/watch?v=Y6Ev8GIlbxc)
2. [The Data Center as a Computer: An Introduction to the Design of Warehouse-Scale Machines](https://www.cs.cornell.edu/projects/ladis2009/talks/dean-keynote-ladis2009.pdf)
{{< /references >}}