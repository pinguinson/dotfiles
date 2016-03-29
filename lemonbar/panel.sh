#! /bin/zsh

PANEL_FIFO=/tmp/panel-fifo
PANEL_HEIGHT=25
PANEL_FONT_FAMILY="Ubuntu:size=11"

if [[ $(pgrep -cx panel) -gt 1 ]]; then
	printf "%s\n" "The panel is already running." >&2
	exit 1
fi

trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"

bspc config top_padding $PANEL_HEIGHT
bspc control --subscribe > "$PANEL_FIFO" &

# time
while true; do
	echo D$(date +%A | sed 's/\(.*\)/\U\1/') $(date +"%d"), $(date +"%H:%M")
	sleep 5
done > $PANEL_FIFO &

# music controls
while true; do
	if [[ -z $(mpc status | grep n/a) ]]; then
		SONG_NAME=$(mpc current -f %title% | sed 's/\(.*\)/\U\1/' | sed 's/(.*//' | sed 's/ -.*//' | sed 's/$//')
		ARTIST_NAME=$(mpc current -f %artist% | sed 's/\(.*\)/\U\1/' | sed 's/(.*//' | sed 's/ -.*//' | sed 's/$//')
		if [[ -n $(mpc status | grep playing) ]]; then
			echo RP$ARTIST_NAME - $SONG_NAME
		else
			echo Rp$ARTIST_NAME - $SONG_NAME
		fi
	else
		echo R
	fi
	sleep 0.1
done > $PANEL_FIFO &


. panel_colors

cat "$PANEL_FIFO" | panel_bar | lemonbar -g x$PANEL_HEIGHT -f "$PANEL_FONT_FAMILY" -F "$COLOR_ON" -B "$COLOR_BACKGROUND" -u 2 | zsh &

wait
