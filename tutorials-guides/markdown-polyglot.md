# Polyglot Markdown

The favourite "diss" on Markdown at the moment is lack of standards. However,
this is a bit of an urban legend. So long as you don't go crazy on extensions,
you'd be surprised how much you can get away with.

## General Tips

1. Always put spaces between first-character specifiers (`#` for headers, `>`
   for blockquotes, etc). Some implementations don't accept e.g. `#h1`, so use
   `# h1` instead, which works in all implementations.
2. Don't get too aggressive with nesting.
3. Lean towards stuff that's in the [original "standard"][orig]. Sure, most
   implementations support fenced blocks, but they *all* support four-space
   blocks.

## Headers

Use atx style headers, not setext style.

Do this:

	# my header goes here

	## my h2 goes here

Not this:

	my header goes here
	===================

	my h2 goes here
	---------------

The reason being it's easier to implement, so less likely to be dropped by a
future standard. Furthermore it's easier to tell the indentation level at a
glance.

## Tables

While tables aren't part of the "standard", most markdowns support them in some
form.

The *lingua franca* form is as follows:

	header 1 | header 2 | header 3
	---------|----------|---------
	cell 1   | cell 2   | cell 3

Confirmed to work in:

- Github's Markdown
- Kramdown
- Hoedown (with `--tables` option)
- Pandoc

Test it here!

header 1 | header 2 | header 3
---------|----------|---------
cell 1   | cell 2   | cell 3

[orig]: https://daringfireball.net/projects/markdown/syntax
