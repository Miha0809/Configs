#            _              
#    _______| |__  _ __ ___ 
#   |_  / __| "_ \| "__/ __|
#  _ / /\__ \ | | | | | (__ 
# (_)___|___/_| |_|_|  \___|
#                           
# -----------------------------------------------------
# ML4W zshrc loader
# -----------------------------------------------------

# DON"T CHANGE THIS FILE

# You can define your custom configuration by adding
# files in ~/.config/zshrc 
# or by creating a folder ~/.config/zshrc/custom
# with copies of files from ~/.config/zshrc 
# -----------------------------------------------------

# -----------------------------------------------------
# Load modular configarion
# -----------------------------------------------------

for f in ~/.config/zshrc/*; do 
    if [ ! -d $f ] ;then
        c=`echo $f | sed -e "s=.config/zshrc=.config/zshrc/custom="`
        [[ -f $c ]] && source $c || source $f
    fi
done

# System
alias copy="wl-copy"
alias q="exit"
alias off="shutdown"

# IDE
alias n="nvim ."

# translate
alias en="trans :en"
alias ua="trans :uk"
alias pl="trans :pl"


# dotnet
alias run="dotnet run"
alias bld="dotnet build"
alias rn="bld && run"


# GIT
alias token="echo $GIT | copy"
alias gs="git status"
alias ga="git add ."

export GIT=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
export PATH="$PATH:$HOME/.dotnet/tools"

# -----------------------------------------------------
# Load single customization file (if exists)
# -----------------------------------------------------

if [ -f ~/.zshrc_custom ] ;then
    source ~/.zshrc_custom
fi
