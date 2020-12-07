# A Docker container for Java development

This repository provides a docker container
which allows to run a terminal based development environment
basically consisting of `zsh`, `git`, `mvn`,
and `vim` with plugins for Java development.

More specifically, the container builds the Docker image from [AdoptOpenJDK]
and installs the following software on top of it.

- [Maven] is a software project management and comprehension tool.
- [google-java-format] is a program that reformats Java source code to comply with [Google Java Style].
- [Git] is a free and open source distributed version control system.
- [fzf] is a general-purpose command-line fuzzy finder.
- [ripgrep] is a line-oriented search tool.

- [Zsh] is a UNIX command interpreter (shell) usable as an interactive login shell and as a shell script command processor.
- [Antibody] is a shell plugin manager made from the ground up thinking about performance.
- [Oh My Zsh] is an open source, community-driven framework for managing your zsh configuration.
- [zsh-syntax-highlighting] provides syntax highlighting for zsh.
- [typewritten] is a minimal zsh prompt theme.

- [Vim] is a highly configurable text editor built to make creating and changing any kind of text very efficient.
- [Vim Plug] is a minimalist Vim plugin manager.
- [sensible.vim] is a universal set of default settings for Vim.
- [obsession.vim] automates recording Vim sessions.
- [surround.vim] provides mappings to easily delete, change and add surrounding characters.
- [fugitive.vim] is the premier Vim plugin for Git.
- [lightline.vim] is a light and configurable statusline plugin for Vim.
- [vim-codefmt] is a utility for syntax-aware code formatting.

- [Tmux] is a terminal multiplexer.
- [tpm] is a tmux plugin manager.
- [tmux-sensible] is a set of tmux options that should be acceptable to everyone.
- [tmux-resurrect] can restore the tmux environment after system restarts.
- [tmux-pain-control] adds standard pane navigation bindings to tmux.
- [vim-tmux-focus-events] restores focus events when using vim inside tmux.
- [vim-tmux-clipboard] provides seamless integration fom vim and tmux's clipboard.
- [tmux-themepack] provides various themes for tmux.

[git]: https://git-scm.com/
[fzf]: https://github.com/junegunn/fzf
[ripgrep]: https://github.com/BurntSushi/ripgrep
[zsh]: http://zsh.sourceforge.net/Doc/Release/Introduction.html
[antibody]: https://github.com/getantibody/antibody
[oh my zsh]: https://github.com/ohmyzsh/ohmyzsh
[zsh-syntax-highlighting]: https://github.com/zsh-users/zsh-syntax-highlighting
[typewritten]: https://github.com/reobin/typewritten
[vim]: https://www.vim.org/
[vim plug]: https://github.com/junegunn/vim-plug
[sensible.vim]: https://github.com/tpope/vim-sensible
[obsession.vim]: https://github.com/tpope/vim-obsession
[surround.vim]: https://github.com/tpope/vim-surround
[fugitive.vim]: https://github.com/tpope/vim-fugitive
[lightline.vim]: https://github.com/itchyny/lightline.vim
[tmux]: https://github.com/tmux/tmux/wiki
[tpm]: https://github.com/tmux-plugins/tpm
[tmux-sensible]: https://github.com/tmux-plugins/tmux-sensible
[tmux-resurrect]: https://github.com/tmux-plugins/tmux-resurrect
[tmux-pain-control]: https://github.com/tmux-plugins/tmux-pain-control
[vim-tmux-focus-events]: https://github.com/tmux-plugins/vim-tmux-focus-events
[vim-tmux-clipboard]: https://github.com/roxma/vim-tmux-clipboard
[tmux-themepack]: https://github.com/jimeh/tmux-themepack
[adoptopenjdk]: https://hub.docker.com/_/adoptopenjdk
[maven]: https://maven.apache.org/
[google-java-format]: https://github.com/google/google-java-format
[google java style]: https://google.github.io/styleguide/javaguide.html
[vim-codefmt]: https://github.com/google/vim-codefmt

When building the container a non-root user is created that can be used to develop in it.
To avoid permission issues when mounting local files to a container volume,
you can adjust the build args `UID` and `GID`
to reflect your local setup.
Other possible arguments are `JAVA_VERSION=11` and `MAVEN#_VERISON=3.6.3`.

[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
