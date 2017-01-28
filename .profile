if [ "$0" = "/etc/gdm/Xsession" -a "$DESKTOP_SESSION" = "i3" ]; then
  export PATH=$HOME/Local/bin:$PATH
fi
