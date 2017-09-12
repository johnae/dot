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
    if [ "$age" -gt 600 ]; then
      rm $cache
    fi
  fi
  if [ ! -e "$cache" ]; then
    aws ec2 describe-instances > $cache
  fi
  tmp=$(mktemp /tmp/instances.XXXXXX.json)
  cat $cache | jq -c ".Reservations[].Instances[] | (.Tags[] | select(.Key == \"Name\")).Value, .InstanceId, .PrivateDnsName, .PublicDnsName" | xargs -n4 echo > $tmp
  bastion=$(cat $tmp | grep -i bastion | tail -n1 | awk -F' ' '{print $NF}')
  instance=$(cat $tmp | grep -iv bastion | $(fzfcmd) --bind=ctrl-y:accept --tac | awk -F' ' '{print $NF}')
  rm -f $tmp
  if [[ -n ${instance} ]]; then
    bastion=$EC2USER@$bastion
    instance=$EC2USER@$instance
    zle kill-whole-line
    zle -U "bastion $instance $bastion"
    zle accept-line
  fi
  zle && zle reset-prompt
}

zle -N aws_instance_ssh
bindkey '^a' aws_instance_ssh
