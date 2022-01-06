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
#JAVA_HOME=/usr/lib/jvm/java-15-oracle/
#JAVA_HOME=/usr/lib/jvm/java-11-oracle/
JAVA_HOME=/usr/lib/jvm/java-8-oracle/
#JAVA_HOME=/usr/lib/jvm/java-17-oracle/
PATH=$PATH:$JAVA_HOME
MY_SCRIPTS=/home/ethomev/Work/gitrepos/myScripts/
PATH=$PATH:$MY_SCRIPTS
GO_HOME=/usr/local/go/bin
PATH=$PATH:$GO_HOME

# GO Setup
## execute go from anywhere
#GO_HOME=/usr/local/go/bin
#PATH=$PATH:$GO_HOME
## execute compiled go commands from anywhere
#GOPATH=$(go env GOPATH)
#PATH=$PATH:$GOPATH/bin

export PATH="/home/ethomev/.linuxbrew/bin:$PATH"

# This file updates the prompt when in a git repo
PATH_TO_GIT_COMPLETION=/home/ethomev/Work/gitrepos/git/contrib/completion
[[ -f "$PATH_TO_GIT_COMPLETION/.git_prompt.sh" ]] && source "$PATH_TO_GIT_COMPLETION/.git_prompt.sh"
export PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'

# allow moving forward in interactive search
stty -ixon

DOCKER_CERT_PATH=/etc/docker/certs.d/
source <(kubectl completion bash)
source <(helm completion bash)
# Change default shell
exec fish
