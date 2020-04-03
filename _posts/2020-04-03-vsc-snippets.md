---
layout: post
title: Snippets for Visual Studio Code
categories: [blog, tips]
tags: [code, toolchain]
---

*Typing 'for', 'if', 'main'... and hitting tab to expand a snippet can save some time.*

*Snippets in any editor or environment saves time typing, as well as sometimes
the devs sanity - preventing dull repetitive tasks. In Visual Studio Code
it is straight forward to write snippets for different files and subsequently
the basic syntax gets shown. Sometimes I wish I had a snippet for those little articles,
but there's none, so have to keep writing ;)*

# A first simple snippet
Snippets are stored in JSON files and can be created within Visual Studio Code by Menu
*File >> Preferences >> User snippets*. The dialog will offer either to edit present 
snippets or to create new global or workspace ones with predefined scopes. Scopes are 
definitions for which files snippets should be available. In this first simple snippet 
common keys are presented and it looks like that here...
```
{
	"First snippet": {
		"scope": "markdown",
		"prefix": [
			"snip"
		],
		"body": "That's a snippet to get that post going...",
		"description": "First example snippet"
	},
}
```

Snippets consists of an JSON object with key-value pairs and the common four keys are...
1. scope [optional] - defines the files/filetypes for which a snippet should be available
2. prefix - defines the keyword to trigger snippet selection
3. body - contains what should be inserted for that snippet
4. description [optional] - a description about what a snippet is or could be good for

# Jumping through snippets
When such a snippet is expanded - the prefix turn to the body it is possible to control
the location of subsequent tab key strokes. In doing so it will be like fast forwarding 
through the body of the snippet and entering the important and custom pieces.
```
{
    "Second snippet": {
		"scope": "markdown",
		"prefix": [
			"snap"
		],
		"body": [
			"That's a snippet to get that post going and showing how to control tab...",
			"1. ${1}",
			"2. ${2:Second point}",
			"3. ${3|Third point,3rd point,another point|}",
			"${0}"
		],
		"description": "Second example snippet"
	}
}
```
When this snippet gets expanded the second tab key stroke will get you to `${1}` and all 
subsequent tabs to subsequent `${n}`. It will end at `{0}` which marks the exit point
of the snippet, so to say. The second `${2}` provides a default value when there could be
something used over and over again. And the last and third one `${3}` offers two options
to choose from.

That is a starter about creating snippets to ease writing code and can be used also
to scaffold files in a much faster way than copy/pasting things around. Sure there is
more about snippets, but for writing more about them I'd really need a snippet to 
expand :P

# Downloads
- [examples.code-snippets]({{ site.url }}/downloads/examples.code-snippets) containing 
  both example snippets

# Links
- [Snippets in Visual Studio Code](https://code.visualstudio.com/docs/editor/userdefinedsnippets)
