# Authors:
# Reiko Kaps <r31k@k4p5.de> 2016

#############################################
# Helpers

# Use sudo by default if it's installed
if [[ -e $( which -p sudo 2>&1 ) ]]; then
    use_sudo=1
fi

#############################################
# make completions
compdef _gnu_generic lxc-ls lxc-stop lxc-start lxc-info lxc-attach lxc-create
compdef _gnu_generic lxc-destroy lxc-freeze lxc-unfreeze lxc-snapshot lxc-clone

#############################################
# common aliases

if [[ $use_sudo -eq 1 ]]; then

    # list, info containers
    alias lxcls='sudo lxc-ls'
    alias lxcll='sudo lxc-ls --fancy'
    alias lxcinfo='sudo lxc-info -n'

    # start, stop
    alias lxcstart='sudo lxc-start -d -n'
    alias lxcstop='sudo lxc-stop -n'
    
    # create, destroy
    alias lxccreate='sudo lxc-create -n'
    alias lxcdestroy='sudo lxc-destroy -n'
    
    # attach 
    alias lxcat='sudo lxc-attach -n'
fi

#############################################
# functions

function lxcreboot {
    if [[ $1 == '' ]] ; then
	echo 'Container name is missing!'
	return
    fi

    state=$(sudo lxc-info -H -s -n $1)
    echo 'Container '$1' is '${state}
    case ${state} in
	RUNNING)
	    echo 'Restarting ...'
	    sudo lxc-stop -n $1
	    sudo lxc-start -d -n $1
	    ;;

	STOPPED)
	    echo 'Starting ...'
	    sudo lxc-start -d -n $1
	    ;;
	*)
	    echo 'Container state is confused: '$state
	    ;;
    esac
    return
}


# helper: get the list of installed containers
function _containers {
    sudo lxc-ls -1
}
    
   
