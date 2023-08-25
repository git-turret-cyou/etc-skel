export GTK_THEME=Adwaita:dark
if command -v dbus-launch >/dev/null && test -z "${DBUS_SESSION_BUS_ADDRESS}"; then
       eval $(dbus-launch --sh-syntax --exit-with-session)
fi
# Ensure XDG_RUNTIME_DIR is set
unset XDG_RUNTIME_DIR
export XDG_RUNTIME_DIR=$(mktemp -d /tmp/$(id -u)-runtime-dir.XXX)
gentoo-pipewire-launcher &
unclutter &
(while true; do xprop -root -set WM_NAME "VOL:$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d ':' -f 2) | BAT: $(cat /sys/class/power_supply/BAT0/capacity)% | $(date +"%a %D %I:%M:%S %p")"; sleep .5; done) &
feh --bg-scale /home/turret/.background

exec dwm
