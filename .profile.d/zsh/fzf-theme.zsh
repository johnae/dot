if [ -d "$THEMESDIR" ]; then
    if [ -e "$THEMESDIR/templates/fzf/bash/base16-$THEME.config" ]; then
        source "$THEMESDIR/templates/fzf/bash/base16-$THEME.config"
    fi
fi
