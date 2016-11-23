# Authors:
# Reiko Kaps <r31k@k4p5.de> 2016
# 
# commandline completion and
# aliases for ansible


#############################################
# make generic completions
compdef _gnu_generic ansible ansible-playbook ansible-galaxy ansible-doc ansible-vault
compdef _gnu_generic ansible-pull ansible-console 

#############################################
# common aliases

alias ansplay_ls_tasks='ansible-playbook --list-tasks'
alias ansplay_ls_taks='ansible-playbook --list-tags'
alias ansplay='ansible-playbook'
    
   
