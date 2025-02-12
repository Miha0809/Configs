# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="amuse"
# ZSH_THEME="dpoggi"
# ZSH_THEME="fletcherm"
# ZSH_THEME="jaischeema"

# Docker
alias up="docker-compose up --build"
alias down="docker-compose down --rmi all"

# System
alias copy='xclip -sel clip'
alias q="exit"
alias off="shutdown now"

# IDE
alias n="nvim ."

# Translate
alias en="trans :en"
alias ua="trans :uk"
alias pl="trans :pl"

# dotnet
alias run="dotnet run"
alias bld="dotnet build"
alias rn="bld && run"

# GIT
alias token='echo $GIT | copy'
alias gs="git status"
alias ga="git add ."

export PATH="$PATH:$HOME/.dotnet/tools"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)
