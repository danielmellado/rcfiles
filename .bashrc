# .bashrc
# User-specific aliases and functions

# Enable Git prompt support for displaying branch info in the prompt
if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    source /usr/share/git-core/contrib/completion/git-prompt.sh
fi

# Terminal settings
export TERM="xterm-256color"
[ -n "$TMUX" ] && export TERM="screen-256color"

# Set terminal title to "username@hostname:current_directory"
export PROMPT_COMMAND='printf "\033]0;%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'

# Define color variables
FGBLK=$(tput setaf 0) # Black
FGRED=$(tput setaf 1) # Red
FGGRN=$(tput setaf 2) # Green
FGYLO=$(tput setaf 3) # Yellow
FGBLU=$(tput setaf 4) # Blue
FGMAG=$(tput setaf 5) # Magenta
FGCYN=$(tput setaf 6) # Cyan
FGWHT=$(tput setaf 7) # White

BGBLK=$(tput setab 0) # Background Black
BGRED=$(tput setab 1) # Background Red
BGGRN=$(tput setab 2) # Background Green
BGYLO=$(tput setab 3) # Background Yellow
BGBLU=$(tput setab 4) # Background Blue
BGMAG=$(tput setab 5) # Background Magenta
BGCYN=$(tput setab 6) # Background Cyan
BGWHT=$(tput setab 7) # Background White

RESET=$(tput sgr0)    # Reset to default
BOLDM=$(tput bold)     # Bold
UNDER=$(tput smul)     # Underline
REVRS=$(tput rev)      # Reverse colors

# Customize Bash prompt with Git branch information
export PS1="\[$FGGRN\][\u@\h \[$FGBLU\] \W\[$FGRED\]\$(__git_ps1 '(%s)')\[$FGGRN\]]\$ \[$RESET\]"

# Git prompt options
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

# Source virtualenvwrapper if available
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    source /usr/bin/virtualenvwrapper.sh
fi

# Alias for long listing format
alias ll="ls -l"

# Set default editor
export EDITOR="vim"

# Python environment settings
export WORKON_HOME="$HOME/.virtualenvs"
export PROJECT_HOME="$HOME/Devel"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Initialize pyenv if installed
if command -v pyenv >/dev/null; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
