---
layout: post
title: Nudging build pipelines
categories: [blog, tips]
tags: [git, commits, ci, pipeline, testing]
---

*When setting up a build pipeline with for example TravisCI or AppVeyor did the first build worked out?*

For me it fails most of time and I've got to tweak the configuration and test again. Usually you'd rerun 
the task, but sometimes you have to commit anything to go through the whole cycle including git and
probably some hooks for Jenkins, Gerrit, Crucible, Sonar, Coverall, etc. as well.

When you finished configuration and want to retry (perhaps for a second time - only to be sure) try not change anything
somewhere and commit, instead allow an empty commit like this:

```
git commit -m "Want to be sure for n-th time that pipeline works" --allow-empty
```

Nevertheless I'll try to avoid that and commit empty things only when finishing and testing pipelines 
(or nudging impatiently jekyll to update that pages here ;)).