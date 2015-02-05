#!/usr/bin/env bash
#****************** setup.sh *******************
# created: 2015-Feb-05
# Last Change:2015-Feb-05.
#------------------------------------------------------------
# githubからdotfilesを~/.dotfiles/へclone
# ~.dotfiles/.* のシンボリックリンクをhomeに作成
#************************************************************

# http://orgachem.hatenablog.com/entry/2014/05/13/001100
set -e
set -u

dotfiles=$HOME/.dotfiles

# pull or clone
if [ -d $dotfiles ]; then
    echo 'pull repo ...'
    ( cd $dotfiles && git pull origin master)
else
    echo 'cloe repo ...'
    git clone https://github.com/yyamnk/dotfiles $dotfiles
fi

# symbolic link
[ -e $dotfiles/bin/link_dots.sh ] && \
    echo 'update symbolic links ...' && \
    bash $dotfiles/bin/link_dots.sh
