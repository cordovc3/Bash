#configs
export CVSROOT="/home/cordovc3/CVSrep"
export VISUAL="gvim"
export EDITOR="vim"

#colored manpages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#aliases
alias rm="rm -i"
alias rf="rm -rfi"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias l="ls"
alias b="cd $OLDPWD"
alias e="emacs -nw"
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

#ssh into cf416 computer with tmux session saved
alias cf="ssh cordovc3@cf416-03.cs.wwu.edu"

#attach default session
alias ta="tmux attach-session -t 0"

#load "to" bookmarking script
#written by Mara Kim 
#https://github.com/resultsreturned/to
. ~/.to.sh

#if on CF416-03 then reattach session
#if on CF416-03 then reattach session
if [[ $(hostname) == "CF416-03" && "$TERM" !=  "screen" ]]
        then ta
fi

#cd and ls
function cd()
{
    builtin cd "${@:-$HOME}" && ls "--color=auto"
}


function mkcd()
{
    mkdir -p "$1" && cd "$1"
}

#say function.
#example usage: say -fr these words translated to french 
function say() { if [[ "${1}" =~ -[a-z]{2} ]]; then local lang=${1#-}; local text="${*#$1}"; else local lang=${LANG%_*}; local text="$*";fi; mplayer "http://translate.google.com/translate_tts?ie=UTF-8&tl=${lang}&q=${text}" &> /dev/null ; }


#depending on exit status, draw green :) or red :(
function exitstatus {

        EXITSTATUS="$?"

        if [ "$EXITSTATUS" -eq "0" ]
        then
                PS1="\[$(tput bold)\]\[$(tput setaf 1)\]\h\[$(tput setaf 6)\]/\W\[$(tput setaf 2)\] :) $\[$(tput sgr0)\] "
        else
                PS1="\[$(tput bold)\]\[$(tput setaf 1)\]\h\[$(tput setaf 6)\]/\W\[$(tput setaf 1)\] :( $\[$(tput sgr0)\] "
        fi

}

PROMPT_COMMAND=exitstatus


function extract()      # Handy Extract Program
{                       # Author unknown
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}
