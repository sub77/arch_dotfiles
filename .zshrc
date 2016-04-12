##PATHS
zsh_config=$HOME/.config/zsh
zsh_plugins=$HOME/.config/zsh/plugins
zsh_themes=$HOME/.config/zsh/themes

source $zsh_config/antigen.zsh

source $zsh_config/aliases/archlinux.zsh
source $zsh_config/aliases/btrfs.zsh
source $zsh_config/aliases/filesystem.zsh
source $zsh_config/aliases/nmap.zsh
source $zsh_config/aliases/rsync.zsh
source $zsh_config/aliases/workstation.zsh

source $zsh_plugins/extract.plugin.zsh
source $zsh_plugins/systemd.plugin.zsh
source $zsh_plugins/systemadmin.plugin.zsh

source $zsh_config/shortcuts.zsh
source $zsh_config/functions.zsh

##THEME
source $zsh_themes/own-agnosta-light.zsh

##ENV
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR='vim'
export PYTHONIOENCODING=utf-8
export PATH=/usr/local/bin:$PATH

##HISTORY
setopt APPEND_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY
setopt HIST_REDUCE_BLANKS
export HISTSIZE=1000000 SAVEHIST=1000000 HISTFILE=~/.zsh_history

##BINDINGS
bindkey "\eOc" forward-word
bindkey "\eOd" backward-word
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
bindkey "\e[5C" forward-word
bindkey "\e[5D" backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "^[[3^" delete-word
bindkey "^H" backward-kill-word

PATH="/home/timo/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/timo/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/timo/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/timo/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/timo/perl5"; export PERL_MM_OPT;
