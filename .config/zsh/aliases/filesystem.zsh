# Copies the pathname of the current directory to the system or X Windows clipboard
function copydir {
  emulate -L zsh
  print -n $PWD | clipcopy
}

# Copies the contents of a given file to the system or X Windows clipboard
#
# copyfile <file>
function copyfile {
  emulate -L zsh
  clipcopy $1
}

# directory LS
dls () {
    ls -l | grep "^d" | awk '{ print $9 }' | tr -d "/"
}

alias mkdir='mkdir -pv'

# Directory listing
alias ls='ls  --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -AF'
alias l='ls -lhF'		           		        # No hidden
alias ll='ls -lhaF'		                  	        # +Hidden
alias lls='ls -lhaSF'		                	        # +Hidden +Sort by size
alias llt='ls -lhatF'		                	        # +Hidden +Sort by modified time
alias llist='ls -m'                                             # List files in a comma-separated line
alias lllist='ls -ma'                                           # List all files in a comma-separated line
alias tree='tree -AC'                                           # Print pretty lines colourise
alias t='tree -h --du --dirsfirst'
