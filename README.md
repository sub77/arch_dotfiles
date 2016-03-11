Here are my dotfiles for my i3-WM setup.

![i3-WM Setup](http://i.imgur.com/1W0z7fq.jpg)

# Installation Notes

For a basic Arch Linux installation on encrypted `BTRFS`  check my notes [here](https://gist.github.com/broedli/5604637d5855bef68f3e) and [here](https://gist.github.com/broedli/4f401e0097f185ba34eb).

To install this set of dotfiles cd into `setup` and execute the installation script `setup.sh`.

## Atom

To sync your Atom dotfiles edit your `~/.atom/config.cson` and restart.

```
"sync-settings":
  ...
  gistId: "<ID of your Gist, containing Atom's dotfiles>"
  personalAccessToken: "<Github access token for Gists>"
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

## SDDM

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
