function jump_to_project(){
    local jumpline
    jumpline=$(find $PROJECTS -type f -name "config" | grep "\.git\/config" | sed 's|/\.git/config||g' | $(fzfcmd) --bind=ctrl-y:accept --tac)
    if [[ -n ${jumpline} ]]; then
      cd $jumpline
    fi
    zle && zle reset-prompt
}

zle -N jump_to_project
bindkey '^g' jump_to_project
