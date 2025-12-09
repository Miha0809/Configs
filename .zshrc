# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="amuse"
# ZSH_THEME="dpoggi"
# ZSH_THEME="fletcherm"
# ZSH_THEME="jaischeema"

# Docker
alias up="docker-compose up --build"
alias down="docker-compose down --rmi all"
alias stp='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# System
alias copy='xclip -sel clip'
alias q="exit"
alias off="shutdown now"
alias server="echo 2a02:a312:a1f1:2d00:1a31:bfff:fe6d:5734 | copy"

# IDE
alias n="nvim ."

# Translate
alias en="trans :en"
alias ua="trans :uk"
alias pl="trans :pl"

# SSH_CONNECTION
alias nighly="ssh -R 77.42.23.111:443:localhost:8443 root@77.42.23.111"
alias dev="ssh -R 65.109.171.201:443:localhost:8443 root@65.109.171.201"

# dotnet
alias run="dotnet run"
alias bld="dotnet build"
alias rn="bld && run"

# Golang
alias mig="migrate create -ext sql -dir openbp/modules/db/namespaceMigrations/"

# GIT
alias token='echo $GIT | copy'
alias gs="git status"
alias ga="git add ."

export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:$(go env GOPATH)/bin"


plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)
