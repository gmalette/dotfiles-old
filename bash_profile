# Load bashrc (if available)
[[ -s "$HOME/.bashrc" ]] && . "$HOME/.bashrc"

export TZ="Canada/Eastern"

# Heroku
export PATH="/usr/local/heroku/bin:$PATH"

# MySQL
export PATH="/usr/local/mysql/bin:$PATH"
alias mysqld="sudo /Library/StartupItems/MySQLCOM/MySQLCOM"

# ngrok
alias ngrok="/usr/lib/node_modules/ngrok/bin/ngrok-linux"

# NodeJS
export PATH="/usr/local/share/npm/bin:$PATH"

# Prevent iTerm from closing when hitting Control-D
export IGNOREEOF=25
