---
layout: post
title: Functions in Makefiles
categories: [blog, tips]
tags: [c, makefiles, toolchain, pipeline]
---

*When you wrote for the second time almost the same code and for the next time you started 
to copy & paste those code - that sounds like you should introduce a function. Functions 
in Makefile can shorten and clean things up and will be shown in the following...*

# Basic syntax
```
define print_anything
	@echo "\nMakefile: $(1)\n"
endef
```
Thats a print function taking one argument to echo with a prefix and two line breaks.
Functions in a Makefile are enclosed with the two keywords `define` and `endef` (yes,
that extra d is omitted and reads rather unusual). There is no need to define arguments
of those functions, it is possible to access them directly by `$(1)` and subsequently 
with `$(n)` where `n > 0`. The indention is optional what is noteworthy due to Makefile 
targets forcing indention. In this particular case it can increase readability like it
is always with indention.

```
test:
	$(call print_anything, "Testing a first function in a Makefile.")
```

The custom function `print` is called with the keyword `call` inside `$()`. The parameters
are passed to the function by specifying them inside those parenthesis separated by a comma.
Makefile targets won't complain when this comma has been forgotten. The parameter will be
silently ignored and won't be available inside the function. Thats one drawback of calling
those functions and can lead to some time spend debugging weird issues.

# Example to color output with functions
After writing about the basic syntax of how to define and call a function it is time for a 
more practical example. In the following there're be a few functions defined to color the
output of Makefiles. Three levels of messages will be used, they read - *info*, *warning* 
and *error*. This time it'll be shown the other way round. 

That's the target to test all three print functions:
```
test_colors:
	$(call print_info, "That\'s an information only.")
	$(call print_warning, "That\'s a warning. Maybe you should do something.")
	$(call print_error, "That\'s an error. Do something! Now!")
```

Three distinct functions are coloring the output based upon the urgency of the message.
```
define print_info
	$(call print, $(1), "gray")
endef

define print_warning
	$(call print, $(1), "yellow")
endef

define print_error
	$(call print, $(1), "red")
endef
```

All those function call another function `print` and passing next to the message itself
another parameter naming the color.
```
define print
	@case ${2} in \
		gray)    echo "\e[90m${1}\e[0m" ;; \
		red)     echo "\e[91m${1}\e[0m" ;; \
		yellow)  echo "\e[93m${1}\e[0m" ;; \
		*)       echo "\e[97m${1}\e[0m" ;; \
	esac
endef
```
This named color is processed by a switch-case-block which matches the human-readable name 
to the corresponding terminal control sequence. A fallback will color everything white, 
should the function called directly.

That's it, a short and direct primer to functions inside Makefiles without too many words
describing probably obvious things. Like always there is much more to write about functions,
but to be frank I even did not check upon further things which I could maybe add to that
blog post here. Used to discover things in passing when I need them, instead of studying 
manuals in advance. But people deal in different ways with learning new things and thats 
another story for another blog post.

# Downloads
- [Makefile-functions.mk]({{ site.url }}/downloads/Makefile-functions.mk) contains both examples

To check both examples, run...
```
make -f Makefile-functions.mk test
make -f Makefile-functions.mk test_colors
```

# Links
- FLOZz' MISC, [Bash tips: Colors and formatting](https://misc.flogisoft.com/bash/tip_colors_and_formatting) by Fabien Loison
- GNU Makefile, [Functions](https://www.gnu.org/software/make/manual/html_node/Functions.html)
- Linuxize, [Bash Case Statement](https://linuxize.com/post/bash-case-statement/)

