#!/usr/bin/env bash
set -e

source functions

dir=`pwd`
if [ ! -e "${dir}/setup.sh" ]; then
  err "Script not called from within repository directory. Aborting."
  exit 2
fi

distro=`lsb_release -si`
if [ ! -f "dependencies-${distro}" ]; then
  echo "Could not find file with dependencies for distro ${distro}. Aborting."
  exit 2
fi

ask "Install packages?" N && bash ./dependencies-${distro}

dir="${dir%/*}"
echo $dir

ask "Install symlink for .gitconfig?" Y && ln -sfn ${dir}/.gitconfig $HOME/.gitconfig
ask "Install symlink for .bashrc?" Y && ln -sfn ${dir}/.bashrc $HOME/.bashrc && ln -sfn ${dir}/.bash.d $HOME/.bash.d
ask "Install symlink for .zsh?" Y && ln -sfn ${dir}/.zshrc $HOME/.zshrc && mkdir -p $HOME/.config && ln -sfn ${dir}/.config/zsh $HOME/.config/zsh
ask "Install symlink for .colors?" Y && ln -sfn ${dir}/.config/colors $HOME/.config/colors
ask "Install symlink for .vim?" Y && ln -sfn ${dir}/.vim $HOME/.vim && ln -sfn ${dir}/.vimrc $HOME/.vimrc
ask "Install symlink for .Xresources?" Y && ln -sfn ${dir}/.Xresources $HOME/.Xresources
ask "Install symlink for .termite?" Y && ln -sfn ${dir}/.config/termite $HOME/.config/termite

ask "Install symlink for .i3?" Y && ln -sfn ${dir}/.config/i3 $HOME/.config/i3
ask "Install symlink for .i3blocks?" Y && ln -sfn ${dir}/.config/i3blocks $HOME/.config/i3blocks
ask "Install symlink for .compton.conf?" Y && ln -sfn ${dir}/.compton.conf $HOME/.compton.conf
ask "Install symlink for .dunst?" Y && ln -sfn ${dir}/.config/dunst $HOME/.config/dunst
ask "Install symlink for .gsimplecal?" Y && ln -sfn ${dir}/.config/gsimplecal $HOME/.config/gsimplecal
ask "Install symlink for .gtkrc-2.0?" Y && ln -sfn ${dir}/.gtkrc-2.0 $HOME/.gtkrc-2.0
ask "Install symlink for .gtk-3.0?" Y && mkdir -p $HOME/.config/gtk-3.0 && ln -sfn ${dir}/.config/gtk-3.0/gtk.css $HOME/.config/gtk-3.0/gtk.css && ln -sfn ${dir}/.config/gtk-3.0/settings.ini $HOME/.config/gtk-3.0/settings.ini
ask "Install symlink for .caffeine?" Y && ln -sfn ${dir}/.config/caffeine $HOME/.config/caffeine
ask "Install symlink for .redshift?" Y && ln -sfn ${dir}/.config/redshift.conf $HOME/.config/redshift.conf

ask "Install symlink for .atom?" Y && ln -sfn ${dir}/.atom $HOME/.atom
ask "Install symlink for .pcmanfm?" Y && ln -sfn ${dir}/.config/pcmanfm $HOME/.config/pcmanfm
ask "Create folder for your wallpapers?" Y && mkdir -p $HOME/.config/wallpapers/current
