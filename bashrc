# Load rvm (if installed)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export PATH="$HOME/.rbenv/bin:$PATH"
# Load rbenv (if installed)
[[ -s "$HOME/.rbenv" ]] && eval "$(rbenv init -)"

# Set vim as default editor
export EDITOR="vim"

# Set the base PS1
PS1="\[\033[1;30m\]\w\[\033[00m\]"

# Source the git bash completion file
if [ -f ~/.git-completion.sh ]; then
    source ~/.git-completion.sh
    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWUNTRACKEDFILES=true
    PS1=$PS1'\[\033[32m\]$(__git_ps1 " (%s)")\[\033[00m\]'
fi

# Set prompt
PS1=$PS1" $ "
export PS1

# Aliases
alias ll='ls -Fls'
alias vi='vim'
alias gd='git diff'
alias gdc='git diff --cached'
alias gs='git status'
alias ga='git add'
alias gco='git checkout'
alias gp='git push'
alias be='bundle exec'

# sha256sum
alias sha256sum='shasum -a 256'

# json pretty-print
alias pp='python -mjson.tool'

# Colorize grep by default
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="1;37;41"

function rt {
  if [ -e .zeus.sock ]; then

bundle exec zeus test $@

  elif grep -q "spring-commands-testunit" Gemfile; then

bundle exec spring testunit $@

  else
bundle exec ruby -Itest $@

  fi
}
