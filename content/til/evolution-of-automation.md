---
title: "Evolution of Automation"
date: 2025-05-26
tags: ["sre", "til"]
ShowToc: false
---

1) No automation
   Database master is failed over manually between locations.
2) Externally maintained system-specific automation
   An SRE has a failover script in his or her home directory.
3) Externally maintained generic automation
   The SRE adds database support to a "generic failover" script that everyone uses.
4) Internally maintained system-specific automation
   The database ships with its own failover script.
5) Systems that don’t need any automation
   The database notices problems, and automatically fails over without human intervention.

Ofcourse, SREs want systems inherently do what is required and there is no need for external elements to manage the system. 

