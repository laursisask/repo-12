---
title: Weeks 3 & 4 Building Momentum
description: >-
  These past two weeks have been crucial in making significant headway in the PySeldon project.
author: daivik
date: 2024-06-24 20:55:00 +0530
categories: [Blogging, Journey]
tags: [Experience, GSoC]
pin: true
---

### What did I do?
During Week 3, I thoroughly explored the Seldon codebase and identified the classes requiring Python bindings via pybind11. I managed to write about 50% of the bindings, although I encountered some confusion initially. With clear goals and help from my mentor, I made good progress. I haven't submitted a PR yet, as I'm still polishing my forked copy of the Seldon codebase before making changes to the official repository.

In Week 4, I focused on classes that handle simulation options independently, rather than relying on a TOML file. I completed bindings for classes like DeGrootSettings, ActivityDrivenSettings, and SimulationOptions. Additionally, I started testing the code using pytest and submitted a PR after a fruitful meeting with my mentor, where I learned about debugging with gdb, using Hypothesis for testing, and improving my coding style.

### Challenges?
Templates in the C++ codebase proved to be a formidable challenge, particularly when dealing with C++ templates in bindings. However, I view these hurdles as valuable learning opportunities.

### What’s next?
Next week, I aim to complete the remaining bindings, particularly for the Networks class, and refine the pytest tests. It’s a race against time, but I’m confident I’ll get there.