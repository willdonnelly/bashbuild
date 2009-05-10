BashBuild
=========

BashBuild is a minimalist build system, implemented entirely in a single file of
shell script.


Why Another Build System?
-------------------------

There is clearly a large contingent of people who are dissatisfied with GNU
Autotools, as evidenced by the proliferation of alternative build systems.

But people are still used to Autotools. If you regularly compile programs from
source on Linux, you probably have make installed, and you are probably well
used to the familiar `./configure && make && sudo make install` process. Given
this widespread familiarity, it seems like a waste to make people learn a whole
new system just to compile a program.

BashBuild is vaguely modelled on GNU Autotools, in that it has a configure
script, which generates a makefile, which compiles the program. It is
completely different past that point. BashBuild requires only a handful of
variables, and then gets out of the way to let you develop your program.


Why Shell Script?
-----------------

BashBuild uses shell script for the same reason that authentic Autotools-
generated shell scripts do:

> Shell script is *everywhere*

It is perfectly understandable that a system might be lacking Perl, or
Python, or Ruby, but it is simply unthinkable that a modern, general-use
system could be found that lacks `/bin/sh`.


How Do I Use It?
----------------

Copy the configure script into your project directory. Modify the variables,
setting at least the project name. Everything else is optional. Unused variables
should be set equal to the null string.

The `VERSION` variable is currently unused, but may be used in future versions
of BashBuild to generate a `config.h` file.

The `SOURCES` list, surprisingly, is a list of program source files. These files
should be named relative to the directory holding the script.

The `LIBRARIES` variable holds a list of libraries the program should link to.

The `OUTPUT` variable can select between a shared library, a static library, or
an executable. Any value other than `shared` or `static` will be interpreted as
an executable.

The `SUBPROJECTS` variable lists subprojects contained in subdirectories. In
this way, projects can contain subprojects, which will be recursively
configured, compiled, and installed.

The `LIBDIRS` and `INCDIRS` variables specify nonstandard paths for libraries
and include files.

The `PREFIX` variable specifies the default install root if none is provided.

The `CCFLAGS` and `LDFLAGS` variables specify additional arguments for the
compiler and linker.

Once these variables have been set, building the project is as simple as
running `./configure && make`. 