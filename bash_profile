[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/config

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f ~/.localrc ]; then
  . ~/.localrc
fi
