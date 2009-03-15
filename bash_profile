# bash_profile

function parse_git_branch {
  ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")" 
}

PS1="\u@\h:\W\$(parse_git_branch)\$ "

# git shortcuts
export GIT_COMPLETION_PATH="/usr/local/git/contrib/completion/git-completion.bash"
source $GIT_COMPLETION_PATH

alias gst='git status'
alias gr='git remote'
alias gl='git pull'
alias gp='git push'
alias gd='git diff | mate'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gadd='git add'
alias gco='git checkout'
alias gm='git merge'

function gs {
  if [ -z "$1" ]; then
    git stash show stash@{$1}
  else
    git stash
  fi
}

alias gsa='git stash apply'
alias gsl='git stash list'

function compush {
  MSG="update"
  if [ "$1" = "-m" ] ; then
      MSG="$2"
      shift
      shift
  fi

  FLAGS=""
  if [ "$#" = 0 ] ; then
      FLAGS="-a"
  fi

  git commit $FLAGS -m "$MSG" "$@"
  git push origin master
}


# grep colors
alias grep='GREP_COLOR="1;37;41" LANG=C grep --color=auto'
alias ls='ls -G'

# rubygems
alias gemi='sudo gem install'
alias gemu='sudo gem update –no-ri –nor-rdoc'
alias gems='gem search --remote'

# rails
alias ss="./script/server"
alias sc="./script/console"
alias sg="./script/generate"
alias sp="./script/plugin"

#passenger
alias tlog="tail -f log/development.log"
alias rst="touch tmp/restart.txt"

# rspec
alias specc="spec -f s spec/controllers"
alias specm="spec -f m spec/models"
alias specmc="spec -f s spec/controllers; spec -f s spec/models"

# tree command
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
