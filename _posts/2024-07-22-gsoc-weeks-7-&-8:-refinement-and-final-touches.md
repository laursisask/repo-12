---
title: Weeks 7 & 8 Refinement and Final Touches
description: >-
  As we near the end of this journey, these weeks have been focused on refining the project and preparing for the final stages.
author: daivik
date: 2024-07-22 20:55:00 +0530
categories: [Blogging, Journey]
tags: [Experience, GSoC]
pin: true
---

### What did I do?
Week 7 was dedicated to understanding the theoretical underpinnings of the simulations by reading key research papers on Opinion Dynamics. This was crucial for refining our simulation models and ensuring they align with established theories like homophily, polarization, and echo chambers. I also identified and started fixing a bug in the ActivityDrivenModel bindings that caused an infinite loop.

In Week 8, I focused heavily on testing the bindings using pytest and formatting the Python code with the Black formatter. One significant challenge was that pybind11 doesn't support the C++20 span container, which caused some tests to fail. To work around this, I converted Python lists to vectors in the pybind11 interface, ensuring compatibility without altering the original codebase.

### Challenges?
Handling the lack of span support in pybind11 was tricky, but the workaround proved effective. Documentation and failing tests remain ongoing challenges, but I’m steadily addressing them.

### What’s next?
The focus will be on completing the documentation, refining the API, and resolving any remaining issues. With the end in sight, it’s all about delivering a polished, functional package.