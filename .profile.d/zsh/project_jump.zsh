function jump_to_project(){
    local jumpline
    jumpline=$(find $PROJECTS -type f -path "*.git/config" -maxdepth 8 | sed 's|/\.git/config||g' | sed "s|$HOME/||g" | $(fzfcmd) --bind=ctrl-y:accept --tac)
    if [[ -n ${jumpline} ]]; then
      cd $HOME/$jumpline
    fi
    zle && zle reset-prompt
}

zle -N jump_to_project
bindkey '^g' jump_to_project
