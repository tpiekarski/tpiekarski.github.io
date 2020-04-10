---
layout: post
title: Testing at CLI level
categories: [blog, tips]
tags: [cli, testing, shell, bash]
---

*Testing can be tedious, testing can be tricky and testing can drive whole development... insane ;)
But it is an important part of professional software development, but sometimes usually late at night only one line can make the trick.
And staying with a shell - the environment devops used to use a lot it gets even more easier to write little one-line tests*

This little blog post is about that. Writing little one-line tests for comparing two values. And either proceeding happily or aborting
sullenly after some change which you hoped to work out.

## The command test

Part of the package coreutils is the executable test which can be used to test simple expressions. It is used quite often inside shell scripts to
check if some file is around or a directory is accessible. This command can be used for the described purpose and thats what will be looked at.
The basic syntax is unambiguous and rather easy to grasp. It consists most of the time of two values which should be compared and an operator.
In the first one of the following examples something stored in VALUE should be equal to 10. The next one tests if the file foo exists and the last
one checks if the contents of this file foo is equal to something (with the help of cat).

```sh
test $VALUE -eq 10
test -f foo
test $(cat foo) = "something"
```

The result of such tests can be concatenate with further actions. And if such a test fails a script or Makefile can abort or if succeeds it can
echo some relief.

## Further actions by concatenation

Within shell scripting such further actions like mentioned before would expect an if; then; (else)...fi. But all of this can be also written
in only one line.

```sh
test $VALUE -eq 10 && echo "Value is indeed 10." || echo "Something broke!"
```

The command test returns a value after the expression was processed. This return value can be passed along and based upon that value
it is possible to take further action. The line above shows how to accomplish such further actions. When the contents of $VALUE is 10
the first one and when it is not the second message is echoed.

## Application inside Makefiles

This simple and easy one-liner can be used inside Makefiles to test if something worked out in our favor.

```sh
@test -f /proc/some_new_proc_file \
  || (echo "New proc file could not be found, aborting."; exit 1)
```

The above example present a possible usage of these one-line tests. Imagine running a test target and after loading a kernel module which
registers a proc entry. The Makefile should make sure if there is this new proc file before attempting to read out some value in the
successive step. This can be established with test and concatenate a group of commands. Here a message is echoed and then the current
target is exited with a non-zero return value.

For concluding this blog post there are many different solutions how to test. There are huge ones, hard to configure and fuzzy to use.
There are modern ones, easy to use but still with some effort and time to spent on. Sometimes the closest solution at hand can come in
convenient when you want to make sure nothing broke after changing things.
