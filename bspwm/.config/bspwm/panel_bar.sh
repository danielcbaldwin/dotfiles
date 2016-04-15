#!/usr/bin/env bash

. $(dirname $0)/panel.cfg

while read -r line ; do
    case $line in
        C*)
            # clock output
            clock="%{A:gsimplecal:}%{T3}%{B#$HL_COLOR}  ${line#?}  %{T-}%{A}%{F-}%{B-}" # if use padding here - clock icon has double Oo
            ;;

       V*)
              # volume output
              read -ra volume_status <<< "${line#?}"
              volume_color=""
              if [ "${volume_status[1]}" == "off" ]; then
                volume_color="%{F#$HL_COLOR}"
              fi
              if [ "${volume_status[0]}" -lt "10" ]; then
                volume_icon=$(echo -e '\uf026')
              elif [ "${volume_status[0]}" -lt "50" ]; then
                volume_icon=$(echo -e '\uf027')
              else
                volume_icon=$(echo -e '\uf028')
              fi
              padding="${PADDING2}"
              if [ "${volume_status[0]}" -lt "10" ]; then
                padding="${PADDING2}${PADDING2}${PADDING2}"
              elif [ "${volume_status[0]}" -lt "100" ]; then
                padding="${PADDING2}${PADDING2}"
              fi
              volume="${PADDING2}${volume_color}${volume_icon}$padding${volume_status[0]}%$PADDING3%{F-}%{B-}"
              ;;

       B*)
            # battery
            read state percent remaining <<<"${line#?}"
            BATPERC="${percent%?}"
            if [ "$BATPERC" -le "10" ]; then
              SYMBOL=$(echo -e '\uf244')
            elif [ "$BATPERC" -le "25" ]; then
              SYMBOL=$(echo -e '\uf243')
            elif [ "$BATPERC" -le "50" ]; then
              SYMBOL=$(echo -e '\uf242')
            elif [ "$BATPERC" -le "75" ]; then
              SYMBOL=$(echo -e '\uf241')
            else
              SYMBOL=$(echo -e '\uf240')
            fi
            if [ "$state" != "Discharging" ]; then
              SYMBOL=$(echo -e '\uf1e6')
            fi
            batt="${PADDING2}${SYMBOL}${PADDING2}${percent}${PADDING2}%{F-}%{B-}"
            ;;
       W*)
            wm_infos=("")
            IFS=':'
            set -- ${line#?}
            monitor=0
            MONHL_COLOR=$HL_COLOR
            while [ $# -gt 0 ] ; do
                item=$1
                name=${item#?}
                case $item in
                    [Mm]*)
                        let monitor++
                        case $item in
                          M*)
                            MONHL_COLOR=$HL_COLOR
                            ;;
                          m*)
                            MONHL_COLOR=$LL_COLOR
                            ;;
                        esac
                      ;;
                    [OFU]*)
                        # active desktop
                        wm_infos[$monitor]="${wm_infos[$monitor]}${PADDING}%{B#$MONHL_COLOR}%{U#$FG_COLOR}%{+u}${PADDING}${name}${PADDING}%{-u}%{U-}%{B-}${PADDING}%{F-}"
                        ;;
                    o*)
                        # inactive but occupied desktop
                        wm_infos[$monitor]="${wm_infos[$monitor]}${PADDING}%{A:bspc desktop focused -f $name:}%{U#$FG_COLOR}%{+u}${PADDING}${name}${PADDING}%{-u}%{A}${PADDING}%{U-}%{F-}%{B-}"
                        ;;
                    f*)
                        # inactive desktop
                        wm_infos[$monitor]="${wm_infos[$monitor]}${PADDING}%{A:bspc desktop focused -f $name:}${PADDING}${name}${PADDING}%{A}${PADDING}%{U-}%{F-}%{B-}"
                        ;;
                esac
                shift
            done
            unset IFS
            ;;

       T*)
            # window title
            title="${line#?}%{F-}%{B-}"
            ;;
    esac
    printf "%s\n" "%{l}${PADDING2}${wm_infos[1]}%{c}${title}%{r}${volume}${batt}${clock}%{S+}%{l}${PADDING2}${wm_infos[2]}%{c}${title}%{r}${volume}${batt}${clock}"
    #printf "%s\n" "%{r} ${clock}"
done
