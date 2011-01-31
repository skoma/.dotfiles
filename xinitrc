# startup script

# deamons
#exec irexec &

# wm start
#DISPLAY=":0" exec startfluxbox


export LC_CTYPE="zh_CN.GBK"

export XMODIFIERS=@im=SCIM
export GTK_IM_MODULE=scim
export QT_IM_MODULE=scim
export QTK_IM_MODULE=scim 

exec startfluxbox
