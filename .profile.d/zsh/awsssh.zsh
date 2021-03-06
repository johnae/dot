EC2USER="ec2-user"

function aws_instance_ssh() {
  if [ -z "$AWS_PROFILE" ]; then
    echo "\nPlease select an AWS profile to use first...\n"
    zle && zle reset-prompt
    return 1
  fi
  local instance
  local bastion
  local cache
  local age
  cache=~/.aws/instances-$AWS_PROFILE.json
  if [ -e "$cache" ]; then
    age=$(( $(date +%s) - $(stat -c "%Z" $cache) ))
    ## cache for 10 seconds
    if [ "$age" -gt 10 ]; then
      rm $cache
    fi
  fi
  if [ ! -e "$cache" ]; then
    aws ec2 describe-instances > $cache
  fi
  tmp=$(mktemp /tmp/instances.XXXXXX.json)
  cat $cache | jq -c ".Reservations[].Instances[] | select(.State.Name == \"running\") | (.Tags[] | select(.Key == \"Name\")).Value, .InstanceId, .PrivateDnsName, .PublicDnsName" | xargs -n4 echo > $tmp
  if [ "$(cat $tmp | wc -c)" -le 10 ]; then
    echo "\nNo instances found for profile $AWS_PROFILE...\n"
    rm $cache
    zle && zle reset-prompt
    return 1
  fi
  bastion=$(cat $tmp | grep -i "bastion ssh" | tail -n1 | awk -F' ' '{print $NF}')
  instance=$(cat $tmp | $(fzfcmd) --bind=ctrl-y:accept --tac | awk -F' ' '{print $NF}')
  rm -f $tmp
  if [[ -n ${instance} ]]; then
    bastion=$EC2USER@$bastion
    instance=$EC2USER@$instance
    zle kill-whole-line
    if [ "$instance" = "$bastion" ]; then
      zle -U "ssh $bastion"
    else
      zle -U "bastion $instance $bastion"
    fi
    zle accept-line
  fi
  zle && zle reset-prompt
}

zle -N aws_instance_ssh
bindkey '^a' aws_instance_ssh
