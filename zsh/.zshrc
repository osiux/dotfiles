#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias ping='ping -c 5'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias nano='nano -Sw'
alias homestead='function __homestead() { (cd ~/Homestead && vagrant $*); unset -f __homestead; }; __homestead'
alias vvv='function __vvv() { (cd ~/dev/wordpress && vagrant $*); unset -f __vvv; }; __vvv'
alias gumgum='function __gumgum() { (cd ~/dev/gumgum/vagrants && vagrant $*); unset -f __gumgum;  }; __gumgum'
alias assume-role='function(){eval $(command assume-role $@);}'

read_dom () {
    local IFS=\>
    read -d \< ENTITY CONTENT
    local RET=$?
    TAG_NAME=${ENTITY%% *}
    ATTRIBUTES=${ENTITY#* }
    return $RET
}

function fixperm() {
    if [ -z "$1" ]; then
        DIR=`pwd`
    else
        DIR=`realpath $1`
    fi

    if [ ! -d "$DIR" ]; then
        echo "Parameter must be a directory."
        return 1
    fi

    echo -n "Fixing permissions on $DIR..."

    find "$DIR" -type f -exec chmod 0644 {} \; && find "$DIR" -type d -exec chmod 0755 {} \;

    echo " done."
}

ytmp3() {
    youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 -f 'bestaudio' "$1"
}

#todo.sh & effitask
alias todo=todo.sh

if [[ -s "${HOME}/.todo/config" ]]; then
  source "${HOME}/.todo/config"
fi
