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

alias copy="wl-copy"
alias token="echo $GIT | copy"
alias q="exit"
alias run="dotnet run"
alias bld="dotnet build"
alias rn="bld && run"

# GIT
alias gs="git status"
alias ga="git add ."

export PATH="$PATH:$HOME/.dotnet/tools"

# -----------------------------------------------------
# Load single customization file (if exists)
# -----------------------------------------------------

if [ -f ~/.zshrc_custom ] ;then
    source ~/.zshrc_custom
fi
