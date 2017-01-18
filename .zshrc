export PATH=$PATH:/usr/local/bin
ZSH=$HOME/dotfiles/.zsh
#export ZSH_THEME="miloshadzic"
#export ZSH_THEME="norm"
#export ZSH_THEME="funky"
#export ZSH_THEME="dogenpunk"
#export ZSH_THEME="jreese"
#export ZSH_THEME="afowler"
export ZSH_THEME="tj"


# settings
# --------------------------------------------
plugins=(git vim github svn brew osx)

source $ZSH/oh-my-zsh.sh

# alias
alias ll='ls -alF --color=auto'
alias l='ls -l --color=auto'
alias la='ls -A'
alias cr='clear'
alias ..='cd ..'
alias cd..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias ports='netstat -tulanp'
alias vi='vim'
#alias lh='l -h'
alias dirsize='ls -l | grep ^d | awk "{print $9}" | xargs du -sh | sort -n'
alias rsync_icoding='rsync -vaz --delete ~/icoding/ ~/Dropbox/icoding/'
alias rsync_Mix='rsync -vaz --delete ~/Mix/ ~/Dropbox/Mix/'
alias gramcheck='java -jar ~/Dropbox/LanguageTool/LanguageTool.jar'
alias memleak='valgrind --tool=memcheck --leak-check=yes'
alias showleak='valgrind --tool=memcheck --leak-check=full --show-reachable=yes'
alias hfs='python2 -m SimpleHTTPServer'
alias server='ssh tj@192.168.77.8'
alias server2='ssh tj@192.168.77.228'  # pw: tj
alias hw='ssh tj@140.117.176.180'
alias trace_code='ctags -R && cscope -R'
alias sl='ls'
#alias tmux='tmux -2'
export TERM=xterm
alias tmux='TERM=xterm-256color tmux -2'
alias gitlog='git log --oneline --decorate=full --graph --remotes'
alias gs='git status -uno'
#alias gd='git diff -w'
alias gd='git diff --color | diff-so-fancy | less'
alias gb='git branch'
alias finch='screen -S finch finch'
alias astyle='astyle -n --style=allman --indent-switches --indent=tab --indent-labels --indent-preprocessor -p -U'
alias sh142='ssh root@192.168.13.142'
alias sh143='ssh root@192.168.13.143'
alias sh144='ssh root@192.168.13.144'
alias sh145='ssh root@192.168.13.145'
alias sh146='ssh root@192.168.13.146'
alias sh149='ssh root@192.168.13.149'
alias ranger='~/ztest/ranger-stable/ranger.py'
alias py='python2.7'
alias python='python2.7'
alias pip='pip2.7'
alias prevmd='function _prevmd(){ grip $1 192.168.13.1:6419  };_prevmd'
alias ag='ag --path-to-agignore=~/.agignore'   # ag -G <file_name> <string>
alias make='colormake'
alias mc='make clean'
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

#autoload predict-on
#predict-on
autoload -U incremental-complete-word predict-on
zle -N incremental-complete-word
zle -N predict-on

# Moxa Usage
PATH=$PATH:/usr/local/arm-linux/bin:~/bin
export PATH
LD_LIBRARY_PATH=/usr/local/arm-linux/tools/lib:/usr/lib:/usr/local/bin/gcc-linaro-5.1-2015.08-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/libc/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH
PATH=/usr/local/bin/gcc-linaro-5.1-2015.08-x86_64_arm-linux-gnueabihf/bin:$PATH
export PATH

# Ccache usage
#export PATH="/usr/lib/ccache/bin/:$PATH"
#export CCACHE_PATH='/usr/bin'
## Colorgcc usage
#export PATH="/usr/lib/colorgcc/bin/:$PATH"
## Colormake usage
#export PATH="~/bin/:$PATH"

#./.broadcast-user.sh

# AutoJump is already included in Debian/Arch Linux distro repositories
#[[ -s ~/.autojump/etc/profile.d/autojump.zsh  ]] && . ~/.autojump/etc/profile.d/autojump.zsh



function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# this one is very nice:
# cursor up/down look for a command that started like the one starting on the command line
function history-search-end {
    integer ocursor=$CURSOR

    if [[ $LASTWIDGET = history-beginning-search-*-end  ]]; then
          # Last widget called set $hbs_pos.
          CURSOR=$hbs_pos
      else
          hbs_pos=$CURSOR
      fi

      if zle .${WIDGET%-end}; then
          # success, go to end of line
          zle .end-of-line
      else
          # failure, restore position
          CURSOR=$ocursor
          return 1
      fi
  }
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# some keys
#bindkey "\e[A" history-beginning-search-backward #cursor up
#bindkey "\e[B" history-beginning-search-forward  #cursor down
bindkey "OA" history-beginning-search-backward-end #cursor up
bindkey "OB" history-beginning-search-forward-end  #cursor down

bindkey 'OB'  beginning-of-line
bindkey '[4~]' end-of-line

watch=()
# Keypad
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[On" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * / =
bindkey -s "^[Ok" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"
bindkey -s "^[OX" "="

# don't create .pyc and .pyo files
PYTHONDONTWRITEBYTECODE=True
export PYTHONDONTWRITEBYTECODE
