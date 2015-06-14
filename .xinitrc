#wicd-gtk &
#ibus-daemon --xim &
#export XMODIFIERS="@im=ibus"
#export QT_IM_MODULE=ibus
#export GTK_IM_MODULE=ibus
xmodmap .xmodmap
xrdb .Xresources
#fcitx &
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
LC_CTYPE=zh_CN.utf8 emacs --daemon &
exec awesome
#exec ck-launch-session startkde
#exec ck-launch-session gnome-session
