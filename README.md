# A Docker container for Java development

This repository provides a docker container
which allows to run a terminal based development environment
basically consisting of `zsh`, `git`, `mvn`,
and `vim` with plugins for Java development.

More specifically, the container builds on the latest Docker image from [AdoptOpenJDK]
and installs the following software on top of it.

  * [Zsh] is a UNIX command interpreter (shell) usable as an interactive login shell and as a shell script command processor.
  * [Oh My Zsh] is an open source, community-driven framework for managing your zsh configuration.
  * [typewritten] is a minimal zsh prompt theme.
  * [Git] is a free and open source distributed version control system.
  * [Maven] is a software project management and comprehension tool.
  * [google-java-format] is a program that reformats Java source code to comply with [Google Java Style].
  * [Vim] is a highly configurable text editor built to make creating and changing any kind of text very efficient.
  * [Vim Plug] is a minimalist Vim plugin manager.
  * [sensible.vim] is a universal set of default settings for Vim.
  * [vim-airline] is a lean & mean status/tabline for vim that's light as air.
  * [vim-codefmt] is a utility for syntax-aware code formatting.

[AdoptOpenJDK]: https://hub.docker.com/_/adoptopenjdk
[Zsh]: http://zsh.sourceforge.net/Doc/Release/Introduction.html
[Oh My Zsh]: https://github.com/ohmyzsh/ohmyzsh
[typewritten]: https://github.com/reobin/typewritten
[Git]: https://git-scm.com/
[Maven]: https://maven.apache.org/
[google-java-format]: https://github.com/google/google-java-format
[Google Java Style]: https://google.github.io/styleguide/javaguide.html
[Vim]: https://www.vim.org/
[Vim Plug]: https://github.com/junegunn/vim-plug
[sensible.vim]: https://github.com/tpope/vim-sensible
[vim-airline]: https://github.com/vim-airline/vim-airline
[vim-codefmt]: https://github.com/google/vim-codefmt

When building the container a non-root user is created that can be used to develop in it.
To avoid permission issues when mounting local files to a container volume,
you can adjust the build args `HOME`, `USER`, `UID`, `GROUP`, and `GID`
to reflect your local setup.

[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)

