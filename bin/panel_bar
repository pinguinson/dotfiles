#! /bin/sh

. panel_colors

num_mon=$(bspc query -M | wc -l)
PADDING="   "
SEPARATOR=" | "

while read -r line ; do
	case $line in
		D*)
			# time output
			date="%{F$COLOR_UNDERLINE}$SEPARATOR%{F-}${line#?}$PADDING"
			;;
		R*)
			# music info
			ON=${#line}
			if [[ $ON -gt 1 ]]; then
				TRACK=${line:2}
				if [[ "${line:1:1}" == "P" ]]; then
					music="%{F$COLOR_ON}$PADDING${TRACK}%{F-}%{F$COLOR_UNDERLINE}$SEPARATOR%{F-}"
				else
					music="%{F$COLOR_OFF}$PADDING${TRACK}%{F-}%{F$COLOR_UNDERLINE}$SEPARATOR%{F-}"
				fi
			else
				music="$PADDING${line#?}$PADDING"
			fi
			;;

		W*)
			# bspwm internal state
			wm_infos=""
			IFS=':'
			set -- ${line#?}
			while [ $# -gt 0 ] ; do
				item=$1
				name=$PADDING${item#?}$PADDING
				case $item in
					M*)
						# active monitor
						if [ $num_mon -gt 1 ] ; then
							wm_infos="$wm_infos %{F$COLOR_BACKGROUND}{name}%{F-}  "
						fi
						;;
					m*)
						# inactive monitor
						if [ $num_mon -gt 1 ] ; then
							wm_infos="$wm_infos %{F$COLOR_BACKGROUND}${name}%{F-}  "
						fi
						;;
					O*)
						# focused occupied desktop
						wm_infos="${wm_infos}%{F$COLOR_ON}%{U$COLOR_UNDERLINE}%{+u}${name}%{-u}%{F-}"
						;;
					F*)
						# focused free desktop
						wm_infos="${wm_infos}%{F$COLOR_ON}%{U$COLOR_UNDERLINE}%{+u}${name}%{-u}%{F-}"
						;;
					U*)
						# focused urgent desktop
						wm_infos="${wm_infos}%{F$COLOR_ON}%{U$COLOR_UNDERLINE}%{+u}${name}%{-u}%{F-}"
						;;
					o*)
						# occupied desktop
						wm_infos="${wm_infos}%{F$COLOR_OFF}%{A:bspc desktop -f ${name}:}${name}%{A}%{F-}"
						;;
					f*)
						# free desktop
						wm_infos="${wm_infos}%{F$COLOR_OFF}%{A:bspc desktop -f ${name}:}${name}%{A}%{F-}"
						;;
					u*)
						# urgent desktop
						wm_infos="${wm_infos}%{F$COLOR_OFF}${name}%{F-}"
						;;
				esac
				shift
			done
			;;
	esac
	printf "%s\n" "%{l}${music}%{c}${wm_infos}%{r}${date}"
done
