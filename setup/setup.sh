#!/usr/bin/env bash
set -e

source functions

dir=`pwd`
if [ ! -e "${dir}/setup.sh" ]; then
  err "Script not called from within repository directory. Aborting."
  exit 2
fi

ask "install $(textb i3) and it's dependencies?" Y && install_i3wm="yes"
distro=`lsb_release -si`
if [[ $install_i3wm == "yes" ]]; then
    if [ ! -f "dependencies-${distro}" ]; then
      echo "Could not find file with dependencies for distro ${distro}. Aborting."
      exit 2
    fi
    bash ./dependencies-${distro}
fi

dir="${dir%/*}"

msg "Linking dotfiles from $(textb $dir) to $(textb $HOME)."
ask "Install symlink for $(textb .gitconfig)?" Y && ln -sfn ${dir}/.gitconfig $HOME/.gitconfig
ask "Install symlink for $(textb .bashrc)?" Y && ln -sfn ${dir}/.bashrc $HOME/.bashrc && ln -sfn ${dir}/.bash.d $HOME/.bash.d
ask "Install symlink for $(textb .zsh)?" Y && ln -sfn ${dir}/.zshrc $HOME/.zshrc && mkdir -p $HOME/.config && ln -sfn ${dir}/.config/zsh $HOME/.config/zsh
ask "Disable $(textb ssh-agent) on this installation?" N && sed -i 's/antigen bundle ssh-agent/#antigen bundle ssh-agent/g' $HOME/.config/zsh/antigen.zsh
ask "Install symlink for $(textb .vim)?" Y && ln -sfn ${dir}/.vim $HOME/.vim && ln -sfn ${dir}/.vimrc $HOME/.vimrc
ask "Install symlink for $(textb .colors)?" Y && ln -sfn ${dir}/.config/colors $HOME/.config/colors
ask "Install symlink for $(textb .tmux)?" Y && ln -sfn ${dir}/.tmux.conf $HOME/.tmux.conf
ask "Install symlink for $(textb .Xresources)?" Y && ln -sfn ${dir}/.Xresources $HOME/.Xresources
ask "Install symlink for $(textb .termite)?" Y && ln -sfn ${dir}/.config/termite $HOME/.config/termite

if [[ $install_i3wm == "yes" ]]; then
    ask "Install symlink for $(textb .i3)?" Y && ln -sfn ${dir}/.config/i3 $HOME/.config/i3
    ask "Install symlink for $(textb .i3blocks)?" Y && ln -sfn ${dir}/.config/i3blocks $HOME/.config/i3blocks
    ask "Install symlink for $(textb .compton.conf)?" Y && ln -sfn ${dir}/.compton.conf $HOME/.compton.conf
    ask "Install symlink for $(textb .dunst)?" Y && ln -sfn ${dir}/.config/dunst $HOME/.config/dunst
    ask "Install symlink for $(textb .gsimplecal)?" Y && ln -sfn ${dir}/.config/gsimplecal $HOME/.config/gsimplecal
    ask "Install symlink for $(textb .gtkrc-2.0)?" Y && ln -sfn ${dir}/.gtkrc-2.0 $HOME/.gtkrc-2.0
    ask "Install symlink for $(textb .gtk-3.0)?" Y && mkdir -p $HOME/.config/gtk-3.0 && ln -sfn ${dir}/.config/gtk-3.0/gtk.css $HOME/.config/gtk-3.0/gtk.css && ln -sfn ${dir}/.config/gtk-3.0/settings.ini $HOME/.config/gtk-3.0/settings.ini
    ask "Install symlink for $(textb .caffeine)?" Y && ln -sfn ${dir}/.config/caffeine $HOME/.config/caffeine
    ask "Install symlink for $(textb .redshift)?" Y && ln -sfn ${dir}/.config/redshift.conf $HOME/.config/redshift.conf
    ask "Install symlink for $(textb .atom)?" Y && ln -sfn ${dir}/.atom $HOME/.atom
    ask "Install symlink for $(textb .pcmanfm)?" Y && ln -sfn ${dir}/.config/pcmanfm $HOME/.config/pcmanfm
    ask "Create folder for your wallpapers?" N && mkdir -p $HOME/.config/wallpapers/currentv
fi
