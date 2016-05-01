---
layout: post
title:  "Schedule Projects To Minimise The Cost Of Delay"
date:   2014-12-11
category: lean
tags:
  - cost of delay
  - lean
---
Plenty of Agile teams treat their backlogs as either a first-in-first-out (FIFO) queue, or perhaps a priority queue ordered by the expected ROI of each individual project. It turns out that neither approach is based on sound economics.

Donald Reinertsen knows this, and I won't attempt to summarise the incredible wealth of valuable insights in his [book on the topic](http://www.amazon.com/Principles-Product-Development-Flow-Generation/dp/1935401009/). Instead, here's a short example to illustrate one of the simplest ways teams often get their scheduling wrong: by failing to account for the cost of delay for each project.

Suppose a team is asked to deliver projects A and B, and the cost-benefit suggests that:

* Project A will take 1 month to implement (if the whole team works on it), and the ROI will be $2k per month the project is live for.
* Project B will take 2 months to implement (if the whole team works on it), and the ROI will be $3k per month the project is live for.
Here are our options for scheduling the work.

# Scenario 1: Prioritise by ROI

We've determined that project B will deliver the greatest ROI, so we decide to deliver that first. Here's a graph showing the total value added over the four month period from when development starts:

![Prioritise the benefit](/assets/cost-of-delay/scheduling-1.png)

The team takes 2 months to deliver B, which then contributes $3k over the following month. Then A is delivered, contributing (with B) a combined $5k over the fourth month. The area under the graph in green shows the aggregate value added over the total time period: a very respectable $8k of added value. Great!

# Scenario 2: Schedule according to Economics

Didn't we already schedule according to economics with our ROI heuristic? Kind of, but there's another important consideration: the **cost of delay**. Let's try delivering the projects in a different order to see what happens:

![Schedule According To Economics](/assets/cost-of-delay/scheduling-2.png)

In this scenario, the team delivers less value at first, but delivers it sooner. Thus, the total value over the timeframe is $9k, which is greater than in scenario 1. This is the correct order to maximise value: the cost of delaying project A (in terms of foregone revenue) is greater than the value of delivering project B sooner.

# Scenario 3: Prioritise All The Things

Sometimes management does this:

![All The Things](/assets/cost-of-delay/all-the-things.png)

Both projects are seen as strategic priorities, so the team endeavours to deliver both. But this means that each takes longer, as the team's time is divided. Here's what happens:

![Prioritise All The Things](/assets/cost-of-delay/scheduling-3.png)

The team works on both projects for 3 months, delivering both together – which yields approximately half as much value ($5k) as scenario 2 over the same timeframe.

Indeed, the overheads of managing multiple work streams simultaneously will likely be such that the team delivers even less than this. In short: don't do this.

# Minimise the Cost of Delay

It should be clear, but it's worth highlighting: in each of these three scenarios **the team did precisely the same amount of work, but the value added varied substantially**. This is why scheduling work according to not only ROI, but also the cost of delay, is incredibly important if you want to maximise the value your team is adding.
