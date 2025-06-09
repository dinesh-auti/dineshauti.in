---
date: "2025-06-02T13:12:00+02:00"
title: "Cap Theorem: Eric A. Brewer"
tags: ["til", "distributed-systems"]
categories: ["tech"]
---

Eric A. Brewer first introduced the CAP theorem as a keynote talk at the 2000 Symposium on Principles of Distributed Computing (PODC), titled "Towards Robust Distributed Systems" . The original presentation slides from this keynote—created by Brewer himself are available [here](https://people.eecs.berkeley.edu/~brewer/cs262b-2004/PODC-keynote.pdf)

 Brewer’s later reflections and clarifications on the theorem, his 2012 article ["CAP Twelve Years Later: How the 'Rules' Have Changed"](https://sites.cs.ucsb.edu/~rich/class/cs293b-cloud/papers/brewer-cap.pdf)

 Understanding the CAP theorem has been a game changer for me while reading papers on large scale distributed systems like Amazon Dynamo and Google File Systems. The more I learn to apply it and see how it is being applied makes it feel more natural like the laws of physics.

In the world of distributed systems, **partition tolerance** is a given. So really the choice is between availability and consistency. In terms of a database, this means that you can either have a system that is always available (even if it means serving stale data) or one that ensures strong consistency (but may not always be available).

More about [Prof. Eric A. Brewer](https://people.eecs.berkeley.edu/~brewer/bio.html)

{{< references >}}
1. [The CAP FAQ](https://www.the-paper-trail.org/page/cap-faq/)
{{< /references >}}