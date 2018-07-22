# Setting up and using Inform 6 in Linux

Most Inform 6 documentation assumes a creative-type that doesn't use Linux, and
is thus geared towards Windows or OSX. This is fine, but there are Linux geeks
like me interested in creating IF, too!

This is the process I used to get a working Inform 6 compiler and libraries on
Linux. Hopefully it will help someone other than myself (or myself at a later
date once I've forgotten all this ephemera...)

This guide assumes a half-decent shell, so please don't whinge at me if you use
`dash` or something that doesn't support `~` expansion 😉

It's also best viewed rendered as HTML (i.e. visited on GitHub), or in GNU Emacs
with markdown-mode, to make the links clicky.

## Compiler

The Inform 6 compiler is, unsurprisingly, called Inform. It was feature complete
way back in 1999 and its next major update was in 2004. It has since been
updated to include Glulx support.

So, pick your poison:

1. [Stable compiler][1]
2. [David Kinder's bleeding edge repo][2]
3. [Andrew Plotkin's haemorrhaging edge repo][3]

Once you have it downloaded, the instructions should be the same for each one
(though I'm not certain of this! I used option 3, so if these instructions don't
produce a working compiler for 1 or 2, let me know.)

First, make sure you're sitting in the source directory. Then you can run The
Most Galaxy Brain Build Command Ever:

	gcc *.c -o inform

No, I'm not joking. They don't even have a makefile!

Anyways, once it's built, it's time to test it. Let's use the venerable "hello
world" example:

	echo '[ Main; "Hello World!^"; ];' > hello.inf
	./inform hello.inf

If all went well Inform will print its version number and nothing else. It will
also (hopefully) return 0 and create `hello.z5` which you can play with your
favourite interpreter.

Now all that's left to do is install it. tl;dr put it somewhere on your path.

If you're like me and have a ~/bin/:

	ln -s $PWD/inform $HOME/bin/

If you're a Normal-Ass Losenix User and want to put it in /usr/local/:

	sudo mkdir -p /usr/local/bin
	sudo install inform /usr/local/bin

Or if you're a real nutter you can set your `$PREFIX` to whatever and run this
bad boy:

	sudo mkdir -p $PREFIX/bin
	sudo install inform $PREFIX/bin

Once this is done, `cd` back home or to `/tmp` and try to run `inform` with no
path. If all went well, it should give you some usage information and return 0.

## Libraries

The Inform compiler by itself isn't very useful. You see, the system is really
split into a compiler and a bunch of header files. Of course you'll actually
need the header files if you want to compile any interesting games...

So let's grab a copy from upstream:

	mkdir -p ~/builds/
	git clone https://github.com/DavidGriffith/inform6lib ~/builds/inform6lib

Now there's a little bit of a gotcha here - these files are all lowercase, but
most examples will assume Capitalcase or CamelCase for some of the standard
library files. This means that on Linux, inform won't be able to find them. [An
issue for this has been filed upstream,][4] but for now let's just use a simple,
hacky workaround.

	cd ~/builds/inform6lib
	ln -s $PWD/english.h English.h
	ln -s $PWD/grammar.h Grammar.h
	ln -s $PWD/parser.h Parser.h
	ln -s $PWD/verblib.h VerbLib.h

Now you're ready to test compilations of libraries. Let's go ahead and use a
boring but practical example. Cd into a clean directory (I'll use
~/devel/inform/ruins) and create `ruins.inf`; give it the following content:

```
Constant Story "RUINS";
Constant Headline "^An Interactive Worked Example^
			 Copyright (c) 1999 by Angela M. Horns.^";
Include "Parser";
Include "VerbLib";
Object Forest "~Great Plaza~"
 with description
		  "Or so your notes call this low escarpment of limestone,
		  but the rainforest has claimed it back. Dark olive
		  trees crowd in on all sides, the air steams with the
		  mist of a warm recent rain, midges hang in the air.
		  ~Structure 10~ is a shambles of masonry which might
		  once have been a burial pyramid, and little survives
		  except stone-cut steps leading down into darkness below.",
has  light;
[ Initialise;
  location = Forest;
  "^^^Days of searching, days of thirsty hacking through the briars of
  the forest, but at last your patience was rewarded. A discovery!^";
];
Include "Grammar";
```

Now you should be able to run the build commands! For a z-machine file
`ruins.z5`:

	inform +$HOME/builds/inform6lib ruins.inf

For a glulx file `ruins.ulx`, just add `-G` to the flags:

	inform +$HOME/builds/inform6lib ruins.inf

Test the files with your interpreter(s). If all goes well, you're done! Have fun
with Inform!

## Documentation/Further Reading

The official documentation can be found [here.][5] I've read both the IBG and
DM4.

A good beginner's guide (that doesn't assume too much programming knowledge) is
the [Inform Beginner's Guide (IBG).][6] It takes you through building a game, from
both a technical and game designer's standpoint. The install instructions are
only for OSX and Windows, though, so thank goodness you have this document ;)

The Inform equivalent of K&R is the [Inform Designer's Manual.][7] Version 4
(the current version) is referred to as DM4.

If you plan on building larger works or works that take advantage of Glulx
features you can't go wrong with reading [the documentation][8] on [the Glulx
page.][9]

## Interpreters

Picking an interpreter is up to taste. Personally I like reading IF in the
terminal, so I use Frotz for Z-Machine files, and Glulxe for Glulx files. The
former should be in your distro's official repos, the latter can be built from
source as follows:

- Grab [a GLK implementation][10], build and install.
- [Grab Glulxe sources from the official repo.][11]
- Point the Makefile towards the location of your GLK header and library files.
- Run `make`, cross your fingers!

## Extensions to inform

Check out the [extensions page on the inform 6 site](http://inform-fiction.org/extensions/index.html)
or [Emily Short's guide to extensions.](http://inform-fiction.org/extensions/index.html)
The standard in the Inform 6 community seems to be for single-header libraries,
which you can either bundle with your project's source code, copy in manually,
or throw in an `include` directory of your choosing.

## Editing Inform source code

[A GNU Emacs mode exists.](https://www.rupert-lane.org/inform-mode/index.html)

I've written [a YAML syntax definition][12] which should roughly syntax
highlight Inform buffers for you in compatible editors. You can use this with
[Micro][13] or you can download [my emacs clone, gomacs,][14] which has it built
in! If you're feeling brave you could even modify it to port it to your
favourite editor.

**Happy hacking!**

[1]: http://inform7.com/sources/i6n/
[2]: https://github.com/DavidKinder/Inform6
[3]: https://github.com/erkyrath/inform6
[4]: http://inform7.com/mantis/view.php?id=2064
[5]: http://inform-fiction.org/manual/index.html
[6]: http://www.ifarchive.org/if-archive/infocom/compilers/inform6/manuals/IBG.pdf
[7]: http://inform-fiction.org/manual/html/contents.html
[8]: https://www.eblong.com/zarf/glulx/inform-guide.txt
[9]: https://www.eblong.com/zarf/glulx/
[10]: https://www.eblong.com/zarf/glk/index.html
[11]: https://github.com/erkyrath/glulxe
[12]: https://github.com/japanoise/gomacs/blob/master/syntax_files/inform6.yaml
[13]: https://micro-editor.github.io/
[14]: https://github.com/japanoise/gomacs
