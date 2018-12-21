# The Rules of C Style

A simple style guide for C, and languages with C-style syntax.

## Rule 0 - respect the project

If the maintainer already has a style guide in place, respect it. Unless it's 
GNU style`</s>`. This is just good etiquette and is respectful of the maintainer's
wishes. You should endeavour to write new source files in the same style as the 
existing code, and match the style of any existing files you edit.

## Rule 1 - one true brace style

Traditionally there are two styles of brace placement in languages with C-like
syntax, but these days there's a de-facto standard. Do this:

```c
int main() {
	/* ... */
	return 0;
}
```

Don't do this:

```c
int main()
{
	/* ... */
	return 0;
}
```

However some standards (notably kernel) do the latter style for functions, and
the One True Style for everything else.

## Rule 2 - tabs for indentation

Tabs are the best way to indent code.

They are:

1. Semantic - 1 tab = 1 indentation level
2. Consistent - again, 1 tab = 1 indentation level, unlike spaces, where it
   depends on the whim of the maintainer.
3. More compact, as in they use less bytes
4. Easier to deal with in primitive text editors, scripts, etc.

## Rule 3 - avoid long lines

Some luddites still edit their code in 80-character terminals, or narrow editor
windows (such as a vertical split in Emacs or gvim). With this in mind, put a
soft limit/target at 80 characters and a hard limit at 100 characters; i.e.:

```
veryLongFunctionNameBeingCalled(withSeveralEquallyLongArguments, someOfWhichGoOnForever,
	butNotThisOne);
```

When you break a line, indent it once, unless it's a string.

## Rule 4 - don't confuse keywords and function calls

Put a space between a keyword and its parentheses:

```c
for (i = 0; i < 10; i++)
```

but attach a function call to its parentheses:

```c
printf("%i", i);
```

## Rule 5 - prefer to brace loops

Generally you should always put braces around your loops, even if they only
contain one statement, in case you wish to expand them in future:

```c
while (someBoolFunc()) {
	someOtherFunc()
}
```

In Golang, and possibly others, loops only work if you brace them anyway, so 
it's a good habit to get into.

However it's acceptable to do tricks on one line:

```c
while (i) i--;
```
