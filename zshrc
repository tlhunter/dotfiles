# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lambda"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git golang node npm postgres redis-cli tmux vagrant)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/go/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.bin:$PATH"

pid_using_port () {
	lsof -i tcp:"$1" | sed "1 d" | awk '{print $2}' | tail -n 1
}

ports_by_pid () {
	lsof -Pan -p "$1" -i 2> /dev/null | grep LISTEN | awk '{ print $9 }'
}

alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gca='git commit --amend'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
#alias ag='/usr/bin/ag --path-to-agignore .agignore'

# Usage: gwho Thomas, gets list of all commits over past year
function gwho() {
	git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short --since 1.year | grep "$1" | grep -v Merge | less
}

# $ download-web http://www.example.com/path/to/files
function download-web() {
	wget --user-agent="Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:64.0) Gecko/20100101 Firefox/64.0" -e robots=off -r -nH --no-parent --reject='index.html*' "$@" ;
}

alias yc='links https://news.ycombinator.com'

# if [ -d "/home/tlhunter/Desktop" ]; then
#     rmdir /home/tlhunter/Desktop
# fi
# if [ -d "/home/tlhunter/desktop" ]; then
#     rmdir /home/tlhunter/desktop
# fi

alias scrape='wget -e robots=off -r -nH --cut-dirs=2 --no-parent --reject="index.html*"'

alias epoch='date +%s'

alias o='xdg-open'

alias docker-stop-all='docker stop $(docker ps -a -q)'

# If not running tmux, run tmux and attach to a session named "main"
if [ "$TMUX" = "" ]; then
	# tmux attach -t main || tmux new -s main;
else
	alias clear='clear && tmux clear-history'
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
