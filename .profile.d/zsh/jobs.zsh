function listjobs() {
  job=$(jobs | $(fzfcmd) --bind=ctrl-y:accept --tac)
  if [[ -n ${job} ]]; then
    jobnum=$(echo $job | awk '{print $1}' | sed 's|[^0-9]*||g')
    fg %${jobnum}
  fi
  zle && zle reset-prompt
}

zle -N listjobs
bindkey '^j' listjobs
