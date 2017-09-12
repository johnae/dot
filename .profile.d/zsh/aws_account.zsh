function choose_aws_profile() {
  local profile
  profile=$(cat ~/.aws/config | grep -E "\[profile " | sed 's/.//;s/.$//;' | awk '{print $2}' | $(fzfcmd) --bind=ctrl-y:accept --tac)
  if [[ -n ${profile} ]]; then
    export AWS_PROFILE=$profile
  fi
  zle && zle reset-prompt
}

zle -N choose_aws_profile
bindkey '^p' choose_aws_profile
