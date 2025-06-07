---
date: "2025-06-07T15:06:33+02:00"
title: "DynamoDB Pricing"
tags: ["til", "databases", "aws"]
categories: ["tech"]
---

DynamoDB can get very expensive, very fast. The example below demostartes that and a quick learning point.

"If you were planning on storing YouTube views in Dynamo, you may calculate that each item is just a userId, videoId, and timestamp which is about 100 bytes. This means that you could store 10,000 views per second on a single shard. If you expect to have 10,000,000 views per second, you'd need ~1,000 shards to support the write load, which could cost approximately $150,000 per day based on current pricing"[^1]
[^1]: [System Design - DynamoDB](https://www.hellointerview.com/learn/system-design/deep-dives/dynamodb)

### Understanding Capacity Units
**Read Capacity Unit (RCU):**
1 RCU = 1 strongly consistent read per second for items up to 4KB
OR 2 eventually consistent reads per second for items up to 4KB

**Write Capacity Unit (WCU):**
1 WCU = 1 write per second for items up to 1KB


### The Math Breakdown
**Item Size Calculation:**
userId (string): ~20 bytes
videoId (string): ~20 bytes
timestamp: ~8 bytes
DynamoDB overhead: ~50 bytes
Total: ~100 bytes per view record

**Write Capacity Needs:**
Each write consumes WCUs based on item size: ceiling(100 bytes / 1KB) = 1 WCU per view
10,000,000 views/second = 10,000,000 WCUs needed

**Shard Requirements:**
Each shard maxes out at 1,000 WCUs
10,000,000 WCUs ÷ 1,000 WCUs per shard = 10,000 shards needed
(The example says 1,000 shards, but that appears to be off by 10x)

**Cost Calculation:**
10,000,000 WCUs × $0.47 per million WCUs (approximate on-demand pricing)
~$4.70 per hour × 24 hours = ~$113 per day just for writes
Add reads, storage, and other costs → easily **$150k+** per day

### Summary
DynamoDB is better suited for "medium-large" scale, not "internet-giant" scale.
Batch multiple views into single items.
Aggregate data before writing.
Use different storage for high-volume, small-item scenarios.

The 1 WCU minimum per write, regardless of item size, is a key DynamoDB pricing characteristic that significantly impacts cost calculations for high-volume, small-item workloads. Even thought one view is 100 bytes, we end up using 1 WCU.