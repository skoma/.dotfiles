export LC_CTYPE="zh_CN.GBK"

export XMODIFIERS=@im=SCIM
export GTK_IM_MODULE=scim
export QT_IM_MODULE=scim
export QTK_IM_MODULE=scim 

#  export XMODIFIERS=@im=ibus
#  export GTK_IM_MODULE=ibus
#  export QT_IM_MODULE=ibus
#  export QT_IMK_MODULE=ibus

# startup script
eval `/usr/bin/dbus-launch --sh-syntax --exit-with-session`
#  source /etc/X11/xinit/xinitrc.d/*
exec /usr/bin/ck-launch-session startfluxbox
