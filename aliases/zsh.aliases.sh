#!/usr/bin/env bash

alias rl='source ~/.zshrc; echo ".zshrc reloaded"'

# Main directories
alias .f='cd ~/.dotfiles'

if type exa > /dev/null 2>&1; then
  alias ll='exa -alF --icons --color=always --group-directories-first'
  alias llt='exa -alF --icons --color=always -s=mod --reverse'
else
  alias ll='ls -la'
  alias llt='ls -lat'
fi

# Other bash stuff
alias t="touch"
