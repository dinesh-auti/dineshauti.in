---
date: "2025-05-26T15:03:07+02:00"
title: "Evolution of Automation"
tags: ["til", "sre"]
categories: []
---

1) No automation:  
   Database master is failed over manually between locations.
2) Externally maintained system-specific automation:    
   An SRE has a failover script in his or her home directory.
3) Externally maintained generic automation:  
   The SRE adds database support to a "generic failover" script that everyone uses.
4) Internally maintained system-specific automation:  
   The database ships with its own failover script.
5) Systems that don’t need any automation:  
   The database notices problems, and automatically fails over without human intervention.

Ofcourse, SREs want systems that inherently do what is required and there is no need for external elements to manage the system.

{{< references >}}
1. [Google SRE Book](https://sre.google/sre-book/automation-at-google/#xref_automation_value) 
{{< /references >}}