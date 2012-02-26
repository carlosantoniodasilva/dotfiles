source ~/.bash/aliases
source ~/.bash/functions
source ~/.bash/completions
source ~/.bash/config

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f ~/.localrc ]; then
  . ~/.localrc
fi
