---
title: "No Installs"
date: 2022-02-12T15:00:00-05:00
author: Milosz Kowal
draft: false
tags: ["technology"]
---

I don't install any dependencies on my computer when it comes to development. Well, I do install one, and it is the most important one:

Docker.

That's right - I'm one of those devs that uses Docker for virtually everything. And with the phenomenal effort by Microsoft and the open-source community to bring in development containers to Visual Studio Code, I no longer have to worry about running conflicting versions of things like Python (I only run whatever macOS has installed natively, and whatever homebrew packages might require), nodeJS, npm, or virtually anything else. I also don't have to worry about massive package-lock.json files or `node_modules` folders conflicting with any other projects I may be working on. I highly recommend everyone try out this freedom. This website will eventually also get a `.devcontainer` folder with Hugo installed.

Why do I do this? Coming from a background of DevOps, Docker is a god-send when it comes to portability and fighting the "it works on my machine" syndrome. I have the same container that I run in my CircleCI pipeline, and for my applications, the same container that runs in production (barring a difference in secrets and environment variables). Of course, it's not perfect, as perfect would involve having a secrets manager handle that problem, but it gets the job done for now. I highly recommend folks to try this out.
