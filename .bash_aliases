# Set Editor
if which vim &>/dev/null; then
  export EDITOR="vim"
else
  export EDITOR="nano"
fi


alias editaliases="vim ~/.bash_aliases"
alias reloadaliases="source ~/.bash_aliases"

alias v=vim

alias p="pipenv shell"
alias pi="pipenv install"

alias gipy="wget -q -O .gitignore 'https://www.gitignore.io/api/python,jupyternotebooks,visualstudiocode'"

alias g=git
alias Gcl="git clone"
alias Gs="git status"
alias Gd="git diff"
alias Gc="git commit -m"
alias Gcm="git commit -m"
alias Ga="git add"
alias Ga.="git add ."
alias Gac="git add . && git commit -m" # + commit message

alias Gi="git init && git add . && git commit -m 'Hello commit'"

alias Gamend="git add -A && git commit --amend --no-edit" # amend last commit
alias Gpush="git push origin $(git rev-parse --abbrev-ref HEAD)" # remote branch

alias Gb="git branch"
alias Gco="git checkout"
alias Gcob="git checkout -b" # + branch name

alias Glog='git log --graph --all --decorate'

# Docker
alias Dps='docker ps'
alias Dc='docker container'
alias Dcls='docker container ls'
alias Di='docker image'
alias Dis='docker images'
alias Dl='docker logs -f'
alias De='docker exec -it'
alias Dsl='docker service logs -f'
alias Dsls='docker service ls'


alias ..='cd ..'
alias ...='cd ../../'

alias python=python3
alias jl='jupyter lab'

# Faster apt-get
alias agi='sudo apt-get install'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
 
# Better directory transversal with .. and autocorrect dir spelling
shopt -s autocd cdspell

# Auto install suggestions
# "The program x is not installed.  You can install it by typing sudo apt-get install x"
# Suggests "Do you want to install it now? (y/N)"
export COMMAND_NOT_FOUND_INSTALL_PROMPT=1


# Extract Archives
# $ extract package.zip
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjvf $1    ;;
      *.tar.gz)    tar xzvf $1    ;;
      *.bz2)       bzip2 -d $1    ;;
      *.rar)       unrar2dir $1    ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1    ;;
      *.tgz)       tar xzf $1    ;;
      *.zip)       unzip2dir $1     ;;
      *.Z)         uncompress $1    ;;
      *.7z)        7z x $1    ;;
      *.ace)       unace x $1    ;;
      *)           echo "'$1' cannot be extracted via extract()"   ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


# Compress files\
# $ compress <foo.tar.gz> ./foo ./bar
compress() {
      if [[ -n "$1" ]]; then
        FILE=$1
        case $FILE in
        *.tar ) shift && tar cf $FILE $* ;;
    *.tar.bz2 ) shift && tar cjf $FILE $* ;;
     *.tar.gz ) shift && tar czf $FILE $* ;;
        *.tgz ) shift && tar czf $FILE $* ;;
        *.zip ) shift && zip $FILE $* ;;
        *.rar ) shift && rar $FILE $* ;;
        esac
      else
        echo "usage: compress <foo.tar.gz> ./foo ./bar"
      fi
    }
