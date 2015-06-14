#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias emacs="LC_CTYPE=zh_CN.UTF-8 emacs"
#http_proxy="127.0.0.1:8087"
#https_proxy="127.0.0.1:8087"
alias py="python"
#export WORKON_HOME=$HOME/.virtualenvs
#source /usr/bin/virtualenvwrapper.sh
#export PYTHONDOCS=/usr/share/doc/python2/html/

alias grep='grep --color=always'
alias less='less -R'
alias df='df -Th'
alias du='du -h'
alias smth='luit -encoding gbk -- telnet newsmth.org'
alias hkday='luit -encoding big5 -- telnet hkday.net'
