# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/usr/bin/env bash

export ZSH=~/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"

export DOTFILES="$HOME/.dotfiles"
export GPG_TTY=$TTY # https://unix.stackexchange.com/a/608921

# fzf configurations
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
# Uncomment the following line to disable fuzzy completion
# export DISABLE_FZF_AUTO_COMPLETION="true"
# Uncomment the following line to disable key bindings (CTRL-T, CTRL-R, ALT-C)
# export DISABLE_FZF_KEY_BINDINGS="true"

plugins=(
  asdf
  zsh-autosuggestions
  fzf
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Return time on long running processes
REPORTTIME=2
TIMEFMT="%U user %S system %P cpu %*Es total"

# Source local zshrc if exists
test -f ~/.zshrc.local && source ~/.zshrc.local

# Place to stash environment variables
test -f ~/.secrets && source ~/.secrets

# Load functions
for f in $DOTFILES/functions/*; do source $f; done

# # Load aliases
for f in $DOTFILES/aliases/*.aliases.*sh; do source $f; done

# # Load all path files
# for f in $DOTFILES/path/*.path.sh; do source $f; done

if type fd > /dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fd --type f'
fi

# FZF config and theme
export FZF_DEFAULT_OPTS='--reverse --bind 'ctrl-l:cancel' --height=90% --pointer='▶''

export EXA_ICON_SPACING=2

if [ `uname` = Darwin ]; then
    export ASDF_DOWNLOAD_PATH=bin/install
    source /opt/homebrew/opt/asdf/libexec/asdf.sh
    source /opt/homebrew/share/zsh/site-functions
fi

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

export PATH="/opt/homebrew/bin:$PATH"

# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi