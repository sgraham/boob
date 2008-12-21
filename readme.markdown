Boob is a Boo-based build system.

> It's named in the tradition of "Git". (I mean, seriously, who writes yet
> another build system unless they're a complete boob.)

It's designed for complex builds of C, C++, C#, and assembler targeting game
development. This means no-overhead incremental builds, knowledge of how to
run tests on consoles, and distributed, cached builds.

Boob encourages simple build files. No more insane build scripts that build
many different ways. Users are encouraged to follow the standard conventions
for say, putting files in sensible places, rather than overriding the defaults
(of course, that's possible when it's really necessary.)

It's well-integrated with:
- Git [http://git.or.cz/]
- XGE [http://www.xoreax.com/]
- GTest [http://code.google.com/p/googletest/]
- SN/Visual Studio
- and of course, Boo [http://boo.codehaus.org/] which is used to create the DSL
  that the build files are written in.

The minimal build file "HelloWorld.module" looks like:

    Program

Yup, that's it. This builds a static executable program, pulling source files
from src/\*.cpp in the manner than makes sense for the platform. There's
support for the official tools for Win32, Win64, Xbox 360, PS3, and Wii out of
the box.

See [GettingStarted] for more info.
