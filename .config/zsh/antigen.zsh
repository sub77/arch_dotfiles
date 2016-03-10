# REQUIREMENTS: lsb-release, git, sudo, vim
distro_name=$(lsb_release -is)
if [[ $distro_name = Debian ]]; then
        if [[ -a /usr/share/zsh-antigen/antigen.zsh ]]; then
                source /usr/share/zsh-antigen/antigen.zsh
        else
                if [[ -a ~/.antigen/antigen.zsh ]]; then
                        source ~/.antigen/antigen.zsh
                else
                        git clone https://github.com/zsh-users/antigen.git ~/.antigen
                        source ~/.antigen/antigen.zsh
                fi
        fi
elif [[ $distro_name = Arch ]]; then
        if [[ -a /usr/share/zsh/scripts/antigen/antigen.zsh ]]; then
                source /usr/share/zsh/scripts/antigen/antigen.zsh
        else
                if [[ -a ~/.antigen/antigen.zsh ]]; then
                        source ~/.antigen/antigen.zsh
                else
                        git clone https://github.com/zsh-users/antigen.git ~/.antigen
                        source ~/.antigen/antigen.zsh
                fi
        fi
else
        echo "Could not find the correct Path to your antigen.zsh."
        echo "Please have a look at your configs over at ~/.configs/zsh"
fi

##GENERAL
antigen use oh-my-zsh

##CLI
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
#antigen bundle command-not-found                               # Debian only
antigen bundle colorize                                         # cat with syntax highlight (need python's Pygments)

##COMPLETION
antigen bundle zsh-users/zsh-completions src
zstyle ":completion:*:commands" rehash 1

##GIT
antigen bundle git
antigen bundle github

##UTILITIES
antigen bundle djui/alias-tips
antigen bundle dirhistory
antigen bundle ssh-agent

##BUILD AND DEV TOOLS
#antigen bundle mvn
#antigen bundle gradle
#antigen bundle docker
#antigen bundle vagrant

##THEME
#antigen bundle https://gist.github.com/524455eb1b5d3f8f8348.git

##PLUTIN CONFIGS
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

antigen apply
