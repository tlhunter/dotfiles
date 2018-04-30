if [ -f ~/.Xmodmap ]; then
  xmodmap ~/.Xmodmap
fi

if [ -f ~/.Xresources ]; then
  xrdb ~/.Xresources
fi

setxkbmap -option caps:escape
