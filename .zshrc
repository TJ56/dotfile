export PATH=$PATH:/usr/local/bin
ZSH=$HOME/dotfiles/.zsh
#export ZSH_THEME="miloshadzic"
#export ZSH_THEME="norm"
#export ZSH_THEME="funky"
#export ZSH_THEME="dogenpunk"
export ZSH_THEME="jreese"

# settings
# --------------------------------------------
plugins=(git vim github svn brew osx)

source $ZSH/oh-my-zsh.sh

# alias
alias ll='ls -alF'
alias l='ls -l'
alias la='ls -A'
alias cr='clear'
#alias lh='l -h'
alias dirsize='ls -l | grep ^d | awk "{print $9}" | xargs du -sh | sort -n'
alias rsync_icoding='rsync -vaz --delete ~/icoding/ ~/Dropbox/icoding/'
alias rsync_Mix='rsync -vaz --delete ~/Mix/ ~/Dropbox/Mix/'
alias gramcheck='java -jar ~/Dropbox/LanguageTool/LanguageTool.jar'
alias memleak='valgrind --tool=memcheck --leak-check=yes'
alias showleak='valgrind --tool=memcheck --leak-check=full --show-reachable=yes'
alias hfs='python -m SimpleHTTPServer'
alias server='ssh tj@192.168.77.8'
alias server2='ssh tj@192.168.77.228'  # pw: tj
alias hw='ssh tj@140.117.176.180'
alias trace_code='ctags -R && cscope -R'
alias sl='ls'
alias tmux='tmux -2'
export LC_CTYPE=zh_TW.utf8
#export LANG=zh_TW.UTF-8
#export LC_ALL=zh_TW.UTF-8



SSH_ENV="$HOME/.ssh/environment"

# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    ssh-agent | sed 's/^echo/#echo/' > "$SSH_ENV"
    echo succeeded
    chmod 600 "$SSH_ENV"
    . "$SSH_ENV" > /dev/null
    ssh-add
}

# test for identities
function test_identities {
    # test whether standard identities have been added to the agent already
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $? -eq 0  ]; then
        ssh-add
        # $SSH_AUTH_SOCK broken so we start a new proper agent
        if [ $? -eq 2  ];then
            start_agent
        fi
    fi
}
    
# check for running ssh-agent with proper $SSH_AGENT_PID
if [ -n "$SSH_AGENT_PID"  ]; then
    ps -ef | grep "$SSH_AGENT_PID" | grep ssh-agent > /dev/null
    if [ $? -eq 0  ]; then
    test_identities
    fi

# if $SSH_AGENT_PID is not properly set, we might be able to load one from
# $SSH_ENV
else
    if [ -f "$SSH_ENV"  ]; then
    . "$SSH_ENV" > /dev/null
    fi
    ps -ef | grep "$SSH_AGENT_PID" | grep -v grep | grep ssh-agent > /dev/null
    if [ $? -eq 0  ]; then
        test_identities
    else
        start_agent
    fi
fi


# autojump settings for zshrc
[[ -s ~/.autojump/etc/profile.d/autojump.zsh  ]] && . ~/.autojump/etc/profile.d/autojump.zsh

autoload -U compinit && compinit












