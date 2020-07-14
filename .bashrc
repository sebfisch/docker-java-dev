HISTCONTROL=ignoreboth
source /etc/bash_completion
source /etc/bash_completion.d/git-prompt
export PS1='\[\e[1;34m\]\W$(__git_ps1 "\[\e[0;33m\] %s")\[\e[m\] \$ '
export PATH=~/bin:$PATH
mvn dependency:resolve -Dclassifier=sources

