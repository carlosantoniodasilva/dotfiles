# A lot of the configs here are based on https://scriptingosx.com/2019/06/moving-to-zsh/

# Setup homebrew first.
if [ -d /opt/homebrew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/usr/local/bin/brew shellenv)"
fi

# import shared aliases/functions
source ~/.terminal/aliases
source ~/.terminal/config
source ~/.terminal/functions

# case-insensitive globbing
setopt NO_CASE_GLOB

# prevent tab from substituting completions in the command.
setopt GLOB_COMPLETE

# auto-cd without having to type `cd`, for example ".." instead of "cd .."
setopt AUTO_CD

# save command history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=2000
SAVEHIST=1000
# ignore some commands for history
HISTORY_IGNORE="(ls|l|clear|c|exit|e|purge|..|cd -)"

# store timestamp in unix epoch time with the history commands
setopt EXTENDED_HISTORY
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
setopt HIST_IGNORE_DUPS
# do not store commands prefixed with a space
setopt HIST_IGNORE_SPACE
# ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

# enable correction suggestions.
# setopt CORRECT
# setopt CORRECT_ALL

# turn more advanced autocompletion on.
if type brew &>/dev/null; then
  # include brew autocompletion scripts.
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi
# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
# zstyle ':completion:*' menu select=long
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# prompt:
#   - show current folder with home as ~/
#   - show [ruby version]
#   - show (git version)
#   - prompt % for normal user, # for sudo
setopt prompt_subst
PROMPT='%F{green}%~%f %F{red}[$(echo $(__ruby_prompt))]%f %F{yellow}$(echo $(__git_ps1))%f'$'\n''%# '

# right prompt
# RPROMPT=''

# Map up/down keys for bash history search.
bindkey '^[[A' up-line-or-search # up arrow bindkey
bindkey '^[[B' down-line-or-search # down arrow

# Setup search path for `cd` command to search in home and projects folders.
cdpath=(. ~ ~/dev)
