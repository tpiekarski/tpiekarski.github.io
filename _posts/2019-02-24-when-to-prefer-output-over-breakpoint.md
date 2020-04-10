---
layout: post
title: When to prefer output over breakpoints
categories: [blog, office]
tags: [debugging, experience]
---

*When do you prefer raw console output over using a debugger and setting breakpoints?*

At work in the office I recently been a part of a mob debugging session where a few developers came together to analyze
and hopefully solve a bug in Frontend validation. We ventured a few times through the code, talked about this and about
that. Dived into the callstack and wondered where this false validation is coming from.

Very keen to solve this puzzle we used the debugger and started to set up breakpoints, soon that points have been all
over the place. But the bug managed to avoid us, our breakpoints and all of our countermeasures and hid very well.

Only one little detail we missed. With all those breakpoints in place we did not see that the validation ran twice.

The first validation succeeded, but the second validation, triggered by something failed. Between this two validations
the field was modified in a way that first of all triggered the second validation and then altered the field value in
such a way that this second validation failed.

By coincidence another developer dropped by and saw that second validation.
So now another puzzle occurred how we did not see this two rounds of validation right from the start.

**The learning I took from this experience is to be not too keen about debuggers and breakpoints.
Sometimes a simple log of values to the console can make the trick.**  
(or just another dev dropping by :))
