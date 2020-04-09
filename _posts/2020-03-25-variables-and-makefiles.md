---
layout: post
title: Variables and Makefiles
categories: [blog, tips]
tags: [c, makefiles, toolchain, pipeline]
---

*Makefiles are long, they tend to be complex and we used to have a configure script which built them for us.
Did you ever looked into such generated Makefile, maybe a file of one of a bigger project? 
For me they seem sometimes like one long regexp ;)*

Of course they come in handy and in small projects they seem to stay readable and manageable. At least for some time.

While discovering a little the odds and ends of module development for the Linux Kernel I stumbled upon the need to use a Makefile
in a more advanced way than just to call a compiler. That Makefile grew with every little module I came up with and suddenly I faced 
myself with the urge to introduce variables.

# Variables for multiple targets
The first kind of variables are the one most straightforward and obvious to use. They are usually defined at the top of the Makefile
and can be used in every target. Thats how for example additional things for the include path or some arguments to the compiler are passed. 
See the following example of how such variables for multiple targets are used. The variable *var* with the value *something* will be
available in both targets.
```
var = something

example-1:
    @echo $(var)

example-2:
    @echo $(var)
```

# Variables for single targets
When variables should be used only inside one target, they are going to be defined in another way. For that madder *eval* can be used to define
a variable local inside the current target. In the following little example the variable *var* with the value anything will be only available
inside the target *example-3* and not in the following *example-4*. 
```
example-3:
    $(eval var = nothing)
    @echo $(var)
example-4:
    @echo $(var)
```
In that example target it will be still the value *something* which was defined earlier. If all those example targets are written down in one 
Makefile. That is also one convenient way to overwrite a value defined for multiple targets.

# Variables within variables
In the next example variables will be based upon other variables and mixed within scope of targets.
```
example-5:
    $(eval message = $(var) could be made with that Makefile)
    @echo $(message)
```
So is this Makefile going to do something or nothing? Reviewing once more the above two use cases for variables this target should output
*something could be made with that Makefile*. And it is going to output that. In such a way it is possible to use variables within variables.

# Variables coming from outside
The last thing which comes up to my mind what could be helpful when it comes down to variables is to use values from outside. When make is
executed at CLI it is possible to pass not only the targets name but parameters as well. Imagine calling make in the following way:
```
$ make example-5 var=anything
```
Can be anything done with Makefiles? Yes, it seems so. The output will be *anything could be made with that Makefile* and illustrates how
to overwrite defined variables from outside the Makefile. This procedure is I think is common when for example the include path should be changed
based upon a different environment. Or something optional should be compiled into a project, like debug output. 
At least I used to use it in such a way. In the last example something from outside will be referenced inside another variable.
```
example-6:
    $(eval bottom-line=$(outside) $(message))
    @echo $(bottom-line)
```
When calling this target in the following way the bottom line of the Makefile which was written example-by-example and the bottom line of this
little post will be reached. The output will be build by two variables and will read *with variables can be done in different ways.*
```
$ make example-6 outside-value="with variables can be done in different ways."
```

Sure I am there is much more about Makefiles and variables and there are more different ways to use variables. 
But for a first variable to be defined it will work :)

# Downloads
- [Makefile-variables.mk]({{ site.url }}/downloads/Makefile-variables.mk) containing all six examples

To check examples, run `make -f Makefile-variables.mk example-n`, where n is the number of one of the six examples.

# Links
- GNU make, [Using Variables](https://www.gnu.org/software/make/manual/html_node/Using-Variables.html)
