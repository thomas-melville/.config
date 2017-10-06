# JUMP Utility
export MARKPATH=$HOME/.marks
function jump { 
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark { 
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark { 
    rm -i "$MARKPATH/$1"
}
function marks {
    ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

# Additions to Classpath
NODE_HOME=/home/ethomev/Masters/Thesis/node-v5.9.1-linux-x64/
PATH=$PATH:$NODE_HOME/bin
JAVA_HOME=/usr/lib/jvm/jdk1.8.0_74/bin/
PATH=$PATH:$JAVA_HOME
MY_SCRIPTS=/home/ethomev/Work/gitrepos/myScripts/
PATH=$PATH:$MY_SCRIPTS
JBOSS_HOME=/home/ethomev/Work/Software/wildfly-11.0.0.Alpha1/

# GO Setup
## execute go from anywhere
#GO_HOME=/usr/local/go/bin
#PATH=$PATH:$GO_HOME
## execute compiled go commands from anywhere
#GOPATH=$(go env GOPATH)
#PATH=$PATH:$GOPATH/bin

# This file updates the prompt when in a git repo
PATH_TO_GIT_COMPLETION=/home/ethomev/Work/gitrepos/git/contrib/completion
[[ -f "$PATH_TO_GIT_COMPLETION/.git_prompt.sh" ]] && source "$PATH_TO_GIT_COMPLETION/.git_prompt.sh"
export PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'

# allow moving forward in interactive search
stty -ixon

# Alias for idea
alias idea='/opt/idea-IC-172.4343.14/bin/idea.sh &'

# Change default shell
exec fish
