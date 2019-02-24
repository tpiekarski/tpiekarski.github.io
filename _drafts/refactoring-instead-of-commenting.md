---
layout: post
title: Refactoring instead of commenting
categories: [blog, c]
tags: [refactoring, clean code]
---
# Introduction

A few days ago I happen to came across an article about documentation as well as commenting. In this article the 
following code was used to illustrate a solution:

{% highlight c %}
int v,i,j,k,l,s,a[99];

main() {
 for(scanf("%d",&s);*a-s;v=a[j*=v]-a[i],k=i<s,j+=(v=j<s&&(!k&&!!printf(2+"\n\n%c"-(!l<<!j)," #Q"[l^v?(l^j)&1:2])&&++l||a[i]<s&&v&&v-i+j&&v+i-j))&&!(l%=s),v||(i==j?a[i+=k]=0:++a[i])>=s*k&&++a[--i]);
}

{% endhighlight %}

For sure at a first glance you won't have any clue what this is doing at all. But that won't change that fast, would it.
By skimming over this code you'll see a bunch of integers, an array and a for loop using 
[scanf](https://en.cppreference.com/w/cpp/io/c/fscanf) to read some data. But what data exactly and for what purpose?

The article shed light by just adding a comment explaining it and offered that as a solution. The comment read:
```
//Prints the N-Queens solution to the console
```
So this code is about solving N-Queen-Problem, a rather complex chess problem to solve. I think like with a 
*broken window*, complexity attracts complexity but
solving that with just a comment is not the way to go.

Although that one is a very extreme example and most probably chosen for illustration, but nevertheless it is welcome 
for refactoring. I want to show how to deal with something like that in a different way. If the way I am about to 
present and discuss is better is up for you to decide. I at least made up my mind already and want to rehearse my 
refactoring and C skills :)

To outline the rest of this article I'll briefly outline the steps to take. I guess first I want to see if this is 
compiling and running at all. Let's hope it'll compile, because I want to refactor not to fix that code. In the next 
step there should be a unit test written to make sure the code won't break during coming steps. Making the code more 
readable by breaking this long line. Introducing well-named variables if possible for v, i, j, k, l, s and perhaps a 
as well and extracting the result into an own function. Naming things is hard most of the time and sometimes even 
pointless like with variables used for iteration. There are different opinions about naming things well. But that 
should not be a reason not to try at least. At the very bottom I describe further ideas and conclude if that 
refactoring worked out.

# Running the code

# Writing a unit test

# Breaking long lines

# Introducing well-named variables

# Extracting to separate well-named function

# Further ideas and conclusion
