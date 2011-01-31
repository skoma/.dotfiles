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
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session startfluxbox
