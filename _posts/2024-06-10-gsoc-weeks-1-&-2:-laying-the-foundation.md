---
title: Weeks 1 & 2 Laying the Foundation
description: >-
  My progress on the PySeldon project, where I'm contributing Python bindings for Seldon.
author: daivik
date: 2024-06-10 20:55:00 +0530
categories: [Blogging, Journey]
tags: [Experience, GSoC]
pin: true
---

### What did I do?
In Week 1, I immersed myself in the backend essentials: mastering the Meson build system, exploring Micromamba for package management, setting up Python packages with pyproject.toml, and diving into pybind11 bindings. I started with a simple add function to get my hands dirty. Additionally, I got acquainted with GitHub Actions and workflows, which I found quite fascinating.

For Week 2, the focus was on integrating Seldon with PySeldon through Meson subprojects and wrap files. This allowed me to wrap the original Seldon project and make it available for our bindings project. The process involved tweaking the meson.build of the original project, and thankfully, all tests passed smoothly. I also began working on bindings for the DeGroot model.

### Challenges?
I faced a few roadblocks along the way. In Week 1, I stumbled upon a Python package and module naming issue, which took up quite a bit of time. Thankfully, with some guidance from my mentor, I got past it. Week 2 brought new challenges—getting lost in unnecessary future aspects of the bindings, which distracted me from my immediate goals. However, after a mentor discussion, I refocused and made steady progress.

### What’s next?
Moving forward, I’ll continue wrapping subprojects with Meson and completing the bindings for the DeGroot model. I’m excited to dive deeper and learn more as I go.