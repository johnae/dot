if [[ -z $BOOKMARKS_FILE ]] ; then
  export BOOKMARKS_FILE="$HOME/.zsh_bookmarks"
fi

if [[ ! -f $BOOKMARKS_FILE ]]; then
  touch $BOOKMARKS_FILE
fi

function mark() {
  if [ -z "$@" ]; then
    echo "Please name the mark"
    return 1
  fi
  echo $@ : $(pwd) >> $BOOKMARKS_FILE
}

function jump_to_mark() {
  local jumpline
  jumpline=$(cat ${BOOKMARKS_FILE} | $(fzfcmd) --bind=ctrl-y:accept --tac)
  if [[ -n ${jumpline} ]]; then
    local jumpdir
    jumpdir=$(echo "${jumpline}" | sed -n "s/.* : \(.*\)$/\1/p" | sed "s#~#$HOME#")
    perl -p -i -e "s#${jumpline}\n##g" $BOOKMARKS_FILE
    cd "${jumpdir}" && echo ${jumpline} >> $BOOKMARKS_FILE
  fi
  zle && zle reset-prompt
}

function delete_mark()  {
  local marks_to_delete line
  marks_to_delete=$(cat $BOOKMARKS_FILE | $(fzfcmd) -m --bind=ctrl-y:accept,ctrl-t:toggle-up --tac)

  if [[ -n ${marks_to_delete} ]]; then
    while read -r line; do
      perl -p -i -e "s#${line}\n##g" $BOOKMARKS_FILE
    done <<< "$marks_to_delete"

    echo "** The following marks were deleted **"
    echo "${marks_to_delete}"
  fi
}

zle -N jump_to_mark
bindkey '^g' jump_to_mark
