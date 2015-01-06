# Load rvm (if installed)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

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

fixssh() {
  for key in SSH_AUTH_SOCK SSH_CONNECTION SSH_CLIENT; do
    if (tmux show-environment | grep "^${key}" > /dev/null); then
      value=`tmux show-environment | grep "^${key}" | sed -e "s/^[A-Z_]*=//"`
      export ${key}="${value}"
    fi
  done
}

# Set prompt
PS1=$PS1" $ "
export PS1

function be {
  bundle check || bundle install && bundle exec $@
}

# Aliases
alias ll='ls -Fls'
alias vi='vim'
alias g='git'
alias gdc='git diff --cached'
alias gs='git status'
alias ga='git add'
alias gco='git checkout'

# sha256sum
alias sha256sum='shasum -a 256'

# json pretty-print
alias pp='python -mjson.tool'

# Colorize grep by default
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="1;37;41"

function rt {
  if [ -e .zeus.sock ]; then

bundle check || bundle install && bundle exec zeus test $@

  elif grep -q "spring-commands-testunit" Gemfile; then

bundle check || bundle install && bundle exec spring testunit $@

  else
bundle check || bundle install && bundle exec ruby -Itest $@

  fi
}
