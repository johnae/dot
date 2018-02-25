function jump_to_project(){
    DIR=$(project-select get-dir)
    if [ "$DIR" != "" ]; then
        cd $DIR
    fi
    zle && zle reset-prompt
}

zle -N jump_to_project
bindkey '^g' jump_to_project
