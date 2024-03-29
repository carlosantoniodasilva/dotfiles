# import shared aliases/functions
source ~/.terminal/aliases
source ~/.terminal/config
source ~/.terminal/functions

# aliases
alias reload='. ~/.bash_profile'
alias ..='cd ..'

# setup completions
export BASH_COMPLETION_COMPAT_DIR="$HOMEBREW_PREFIX/etc/bash_completion.d"
[[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"

# Make g alias for git work with autocomplete.
complete -o default -o nospace -F _git g

C_RED="\[\033[0;31m\]"
C_GREEN="\[\033[0;32m\]"
C_YELLOW="\[\033[01;33m\]"
C_BLUE="\[\033[0;34m\]"
C_MAGENTA="\[\033[0;35m\]"
C_CYAN="\[\033[0;36m\]"
C_WHITE="\[\033[0;37m\]"
C_RESET="\[\033[00m\]"

PS1="$C_GREEN\w$C_RED [\$(__ruby_prompt)]$C_YELLOW\$(__git_ps1)$C_RESET\n\$ "

# Colors for `ls`
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# History list size (also changes HISTFILESIZE).
HISTSIZE=2000
# erasedups: remove older dups and saves the new entry on the history list
HISTCONTROL="erasedups"
# ignore some commands for history
HISTIGNORE="ls:clear:c:exit:e:purge"

# Set up the config path for `bat`: https://github.com/sharkdp/bat.
export BAT_CONFIG_PATH="$HOME/.batconfig"

# REE configs. Specially added to make tests run faster.
# http://smartic.us/2010/10/27/tune-your-ruby-enterprise-edition-garbage-collection-settings-to-run-tests-faster/
# export RUBY_HEAP_MIN_SLOTS=1000000
# export RUBY_HEAP_SLOTS_INCREMENT=1000000
# export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
# export RUBY_GC_MALLOC_LIMIT=1000000000
# export RUBY_HEAP_FREE_MIN=500000

# 37signals config
# export RUBY_GC_MALLOC_LIMIT=250000000
# export RUBY_HEAP_MIN_SLOTS=600000
# export RUBY_FREE_MIN=100000

# Github config
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1.25
export RUBY_HEAP_MIN_SLOTS=800000
export RUBY_FREE_MIN=600000

# Twitter config
# RUBY_HEAP_MIN_SLOTS=500000
# RUBY_HEAP_SLOTS_INCREMENT=250000
# RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
# RUBY_GC_MALLOC_LIMIT=50000000

# Ruby 1.9.3-p327 with falcon patch:
#   rbenv: https://gist.github.com/1688857  rvm: https://gist.github.com/4136373
# Recommended configs
# export RUBY_HEAP_MIN_SLOTS=1000000
# export RUBY_HEAP_SLOTS_INCREMENT=1000000
# export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
# export RUBY_GC_MALLOC_LIMIT=100000000
# export RUBY_HEAP_FREE_MIN=500000

# export RUBY_GC_MALLOC_LIMIT=60000000
# export RUBY_FREE_MIN=200000

# Ruby 2.1 configs
export RUBY_GC_HEAP_FREE_SLOTS=$RUBY_FREE_MIN
export RUBY_GC_HEAP_INIT_SLOTS=$RUBY_HEAP_MIN_SLOTS

# Add firebird home to $PATH so that we can use the command-line programs.
# FIREBIRD_HOME=/Library/Frameworks/Firebird.framework/Resources
# PATH=$PATH:$FIREBIRD_HOME/bin

# Add heroku toolbelt.
# PATH=$HOMEBREW_PREFIX/heroku/bin:$PATH

# Configure rbenv - make sure to do it before adding bundle/bin to the PATH,
# otherwise rbenv's path will be searched first than the current bundle/bin path.
# eval "$(rbenv init -)"

# Use the already installed Ruby versions under rbenv folder.
RUBIES+=(~/.rbenv/versions/*)

# Put .bundle/bin as the first path to lookup executables, to work with bundler binstubs
# Put $HOMEBREW_PREFIX/bin before /usr/bin to avoid issues with lion installation (mainly git now)
PATH=./bin:./.bundle/bin:$HOMEBREW_PREFIX/bin:$PATH

# Setup search path for `cd` command to search in home and projects folders.
CDPATH=".:~:~/dev"

# Setup the location of the go workspace.
GOPATH=$HOME/dev/go
