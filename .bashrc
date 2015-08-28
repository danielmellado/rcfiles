# .bashrc
# User specific aliases and functions
source /usr/share/git-core/contrib/completion/git-prompt.sh
if [ "$TERM" == "xterm" ] || [ "$TERM" == "screen" ] || [ $TERM == "screen-256color" ]; then
    #TERM=xterm-256color
    export PROMPT_COMMAND='printf "\033]0;%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    FGBLK=$( tput setaf 0 ) # 000000
    FGRED=$( tput setaf 1 ) # ff0000
    FGGRN=$( tput setaf 2 ) # 00ff00
    FGYLO=$( tput setaf 3 ) # ffff00
    FGBLU=$( tput setaf 4 ) # 0000ff
    FGMAG=$( tput setaf 5 ) # ff00ff
    FGCYN=$( tput setaf 6 ) # 00ffff
    FGWHT=$( tput setaf 7 ) # ffffff
    BGBLK=$( tput setab 0 ) # 000000
    BGRED=$( tput setab 1 ) # ff0000
    BGGRN=$( tput setab 2 ) # 00ff00
    BGYLO=$( tput setab 3 ) # ffff00
    BGBLU=$( tput setab 4 ) # 0000ff
    BGMAG=$( tput setab 5 ) # ff00ff
    BGCYN=$( tput setab 6 ) # 00ffff
    BGWHT=$( tput setab 7 ) # ffffff
    RESET=$( tput sgr0 )
    BOLDM=$( tput bold )
    UNDER=$( tput smul )
    REVRS=$( tput rev )
    export PS1="\[$FGGRN\][\u@\h \[$FGBLU\] \W\[$FGRED\]\$(__git_ps1 \(%s\))\[$FGGRN\]]\$ \[$RESET\]"
else
    export PS1="[\u@\h \W\$(__git_ps1 \(%s\))]\$ "
fi
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
source /usr/bin/virtualenvwrapper.sh
alias ll="ls -l"
export EDITOR=vim
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export TERM="xterm-256color"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
