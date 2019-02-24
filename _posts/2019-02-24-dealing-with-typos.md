---
layout: post
title: Dealing with typos with typo-aliasing
categories: [blog, tips]
tags: [shell, alias, typo]
---

*Did you ever thought of alias typos in your shell alias file?*

Something like this. Well you could say: go and learn to type, but hey... :)
```
alias ks="ls"
alias ös="ls"
alias öls="ls"
alias lös="ls"
alias lks="ls"
alias mroe="more"
alias les="less"
alias hit="git"
alias exitz="exit"
```

After I encountered sometimes mistyping a handful of commands in the same way more often I decided to alias them.
Just in case for the next typo. But I tend not to typo-alias anything critical like rm, that could end fatal ;)

With allowing duplicates in a big sized shell history file you can take a look how often such typo-alias have been
used and decide if they're useful or you should book a course in typewriting. This way identifying what to alias in
general is helpful as well. Of course you've got to live with those duplicate entries when going up the history. I
tend to always use reverse search and can live with those duplicates (at least for some time).

But some other way of statistics about how often you use which command could be a nice new side project.