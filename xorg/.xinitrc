# update urxvt config
xrdb ~/.Xresources

# set background
feh --bg-scale ~/images/wallpapers/Lakeside_SunRise_1920x1080.jpg &

# set cursor
xsetroot -cursor_name left_ptr &

# start WM
sxhkd &
exec bspwm