---
title: "Papers I’ve Read"
layout: "single"
summary: "A minimal, dated log of papers I’ve read or am reading, with brief notes."
ShowToc: false
---

This is a growing collection of research papers and whitepapers I’ve read — or am currently reading — across systems engineering, distributed computing, reliability, and software infrastructure. I use this page as a reading log and reference point, occasionally updating it with new insights.

### Currently Reading

- **June 2025** : **[Dynamo: Amazon’s Highly Available Key-value Store](https://www.allthingsdistributed.com/2007/10/amazons_dynamo.html)**  
<small class="paper-authors">DeCandia et al. (Amazon Web Services)</small> 
A deep dive into Dynamo, the distributed system that inspired many modern NoSQL databases. Focuses on availability, eventual consistency, and partition tolerance.

- **June 2025** : **[The Google File System](https://research.google/pubs/archive/51.pdf)**  
<small class="paper-authors">Ghemawat, Gobioff, Leung</small>
Describes the fault-tolerant, distributed file system that formed the backbone of Google’s infrastructure — optimized for large data throughput, not POSIX compliance.

---

### Recently Read

- **[SRE Book – Chapter: Eliminating Toil](https://sre.google/books/)**  
  An SRE staple for understanding ops efficiency, automation goals, and engineering productivity.

---

### On My Radar

- **[The Datacenter as a Computer (v3)](/)**
An overview of datacenter-scale design — energy, efficiency, architecture — as if it were a single computer.

- **[Raft: In Search of an Understandable Consensus Algorithm](https://raft.github.io/raft.pdf)**  
  A simplified, readable alternative to Paxos with real-world adoption in tools like etcd and Consul.

- **[Spanner: Google’s Globally Distributed Database](https://research.google/pubs/archive/39966.pdf)**  
  How Google achieves strong consistency at global scale, leveraging TrueTime and synchronized clocks.

- **[MapReduce: Simplified Data Processing on Large Clusters](https://research.google/pubs/pub62/)**  
  <small class="paper-authors">*Jeffrey Dean & Sanjay Ghemawat* </small>
  A foundational paper describing a programming model and system for processing large data sets with distributed algorithms.

- **[The Tail at Scale](https://research.google/pubs/pub40801/)**  
  <small class="paper-authors">*Dean & Barroso*</small> 
  Discusses how rare but high-latency responses affect system performance, and what techniques help mitigate them.