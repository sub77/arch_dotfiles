Here are my dotfiles for my i3-WM setup.

```
git clone --recursive https://github.com/broedli/dotfiles.git
```

To install this set of dotfiles cd into `dotfiles/setup` and execute the installation script `setup.sh`.

> For a basic Arch Linux installation on _encrypted_ `BTRFS`  check my notes [here](https://gist.github.com/broedli/5604637d5855bef68f3e) and [here](https://gist.github.com/broedli/4f401e0097f185ba34eb).

Wallpaper is from [vladstudio](http://www.vladstudio.com/wallpaper/?dali).

![i3-WM Setup](http://i.imgur.com/1W0z7fq.jpg)

# Installation Notes

## SDDM

I use SDDM to control logins and WM. To enable:

```
systemctl start sddm.service
systemctl enable sddm.service
```

To enable the theme `sddm-numix-theme-git` edit `/etc/sddm.conf`

```
[Theme]
Current=numix
```

To autologin your user add:

```
#/etc/sddm.conf
...
[Autologin]
User=username
Session=i3
```

## Atom

To sync your Atom dotfiles edit your `~/.atom/config.cson` and restart.

```
"sync-settings":
  ...
  gistId: "<ID of your Gist, containing Atom's dotfiles>"
  personalAccessToken: "<Github access token for Gist>"
```

## i3blocks

To get the email check working edit `$HOME/.config/i3blocks/blocklets/passfile.py`

```
acc1_user = 'username'
acc1_password = 'password'
acc1_smtp = 'smtp.server.xy'
acc2_user = 'username2'
...
```

To get the sensor reading right, execute:

```
sudo sensors-detect
```

## i3

Config looks for random file in `~/.config/wallpapers/current`

```
ln -sfn /path/to/wallpapers/*.jpg ~/.config/wallpapers/current
```

## Use script for other users

This might help with keeping dotfiles up to date.

Keep in mind, that users actually need access to your dotfiles. May want to `chown` the dotfiles to the `users` group.

```

chown -R :users dotfiles
```
