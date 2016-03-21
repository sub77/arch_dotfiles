# mkdir && cd
function mcd {
    mkdir -pv "$1" && cd "$1"
}
# Create a new SSH key
function gen_rsa-4096 {
    if [ $# -eq 0 ]; then
        echo "Please provide a filename for your key!"
        return
    fi
    ssh-keygen -t rsa -b 4096 -o -a 100 -f $HOME/.ssh/$1;
    echo -n "Your public key is: "
    cat ~/.ssh/$1.pub;
}
function gen-ed25519 {
    if [ $# -eq 0 ]; then
        echo "Please provide a filename for your key!"
        return
    fi
    ssh-keygen -t ed25519 -o -a 100 -f $HOME/.ssh/$1;
    echo -n "Your public key is: "
    cat ~/.ssh/$1.pub;
}
# function zssh {
    # if [[ -z $1 || -z $2 ]]; then
    #         echo "Usage of function $0:\n -->   $0 [USER] [HOSTNAME]"
    # else
    #         ssh -p 34017 $1@$2
    # fi
# }
function termite-ssh {
    if [ -z "$1" ]; then
        echo "Please provide target to connect to!"
        return
    elif [ $1 = "help" ]; then
        echo "USAGE: $0 [TARGET] [OPTIONS]"
        echo "For [OPTIONS] check 'man scp'."
        return
    fi
    scp $2 $3 $4 $6 /usr/share/terminfo/x/xterm-termite $1:/usr/share/terminfo/x/xterm-termite
}
function vcmr () {

        if [[ -n $GIT_DIR && -n $vcmr_COMMAND && -n $vcmr_DIRECTORY && -n $vcmr_REPO_NAME ]]; then
                echo "ERROR: You are in a vcsh chroot. Please exit the chroot first."
                return 0
        fi
        if [[ -z $1 || "$1" = '--help' || $2 = '--help' ]]; then
                read -d '' vcmr_help <<-EOF
$0 - vcsh and MyRepos utility

USAGE:
--------
        $0 [MODE] [OPTION] [REPOSITORY] ['COMMIT_MESSAGE']
MODES:
--------
        create  Add a New repository.
                USE: $0 create [REPOSITORY]
        push    Creates a .gitignore in ~/.gitignore.d/project-name and pushes
                the changes to the given repository.
                USE: $0 push [REPOSITORY] ['COMMIT_MESSAGE']
        delete  Remove repsitory remote in MyRepos.
                If the OPTION [-r] is passed it also deletes the local cache in vcmr.
                USE: $0 delete [-r] [REPOSITORY]
OPTIONS:
--------
        -r      Delete local vcsh repository.
        --help  Display this help.

EOF
                echo $vcmr_help
        fi
        case $1 in
                create)
                        if [[ $2 = -* || $3 = -* ]]; then
                                echo "$(tput bold)$(tput setaf 1)ERROR:$(tput sgr0) $0 $1 unsupported OPTION!"
                                echo "Please refer to the help section. USE: $0 --help"
                        else
                                cp -i ~/.config/mr/available.d/template.vcsh ~/.config/mr/available.d/"$2".vcsh
                                sed -i "s/REPO_NAME/$2/g" ~/.config/mr/available.d/"$2".vcsh
                                cd ~/.config/mr/config.d/ && ln -s ../available.d/"$2".vcsh "$2".vcsh && cd ~/
                                vcsh mr add -A
                                sleep 2
                                vcsh mr commit -m "[$2] Initial commit."
                                vcsh mr push
                                mr update
                                cp -i ~/.gitignore.d/template ~/.gitignore.d/$2
                                sed -i "s/REPO_NAME/$2/g" ~/.gitignore.d/$2
                                vcsh $2 add -f ~/.gitignore.d/$2
                        fi
                ;;
                push)
                        vcmr_protected=$(cat ~/.gitignore.d/$2 | grep "^# FILE_PROTECT" | cut -d '=' -f2)
                        if [[ $2 = -* || $3 = -* || -z $3 ]]; then
                                echo "$(tput bold)$(tput setaf 1)ERROR:$(tput sgr0) $0 $1 unsupported OPTION!"
                                echo "Please refer to the help section. USE: $0 --help"
                        else
                                if [[ -z ~/.gitignore.d/$2 ]]; then
                                        vcsh write-gitignore $2
                                        vcsh $2 add -f ~/.gitignore.d/$2
                                        vcsh write-gitignore $2
                                        vcsh $2 add -f ~/.gitignore.d/$2
                                elif [[ "$vcmr_protected" != yes ]]; then
                                        vcsh write-gitignore $2
                                        vcsh $2 add -f ~/.gitignore.d/$2
                                fi
                                vcsh $2 add -u
                                vcsh $2 commit -a -m $3
                                vcsh $2 push
                        fi
                ;;
                delete)
                        if [[ "$2" = '-r' ]]; then
                                echo -n "Do you really want to delete the complete local copy of your $3.git (yes/no):"
                                read vcmr_answer
                                vcmr_choice=$(echo $vcmr_answer | sed 's/\(.*\)/\L\1/')
                                if [ "$vcmr_choice" = 'yes' ]; then
                                        rm -f ~/.config/mr/available.d/"$3".vcsh
                                        echo "Deleted ~/.config/mr/available.d/"$3".vcsh."
                                        rm -f ~/.config/mr/config.d/"$3".vcsh
                                        echo "Deleted ~/.config/mr/config.d/"$3".vcsh."
                                        rm -rf ~/.config/vcsh/repo.d/"$3".git
                                        echo "Deleted ~/.config/vcsh/repo.d/"$3".git."
                                        rm -f ~/.gitignore.d/$3
                                        echo "Deleted ~/.gitignore.d/$3."

                                fi
                        else
                                if [[ $2 = -* || $3 = -* ]]; then
                                        echo "$(tput bold)$(tput setaf 1)ERROR:$(tput sgr0) $0 $1 unsupported OPTION!"
                                        echo "Please refer to the help section. USE: $0 --help"
                                else
                                        rm -f ~/.config/mr/config.d/"$2".vcsh
                                        echo "Deleted ~/.config/mr/config.d/"$2".vcsh"
                                fi
                        fi
                ;;
                *)
                        if [[ $1 != -* ]]; then
                                echo "$(tput bold)$(tput setaf 1)ERROR:$(tput sgr0) $0 $1 unsupported MODE!"
                                echo "Please refer to the help section. USE: $0 --help"
                        elif [[ $1 != --help ]]; then
                                echo "$(tput bold)$(tput setaf 1)ERROR:$(tput sgr0) $0 $1 unsupported OPTION!"
                                echo "Please refer to the help section. USE: $0 --help"
                        fi
                ;;
        esac
        unset -v vcmr_help
        unset -v vcmr_answer
        unset -v vcmr_choice
        unset -v vcmr_protected
}
