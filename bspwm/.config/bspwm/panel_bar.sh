#!/usr/bin/env bash

. $(dirname $0)/theme.cfg
. $(dirname $0)/panel.cfg

while read -r line ; do
    MONITORS=();
    case $line in
        C*)
            # clock output
            #clock="%{A:gsimplecal:}%{T3}%{B#$HL_COLOR}  ${line#?}  %{T-}%{A}%{F-}%{B-}" # if use padding here - clock icon has double Oo
            clock="${PADDING}$(echo -e '\uf017')${PADDING2}${line#?}${PADDING}"
            ;;

        D*)
            # clock output
            date="%{A:dzen2_cal:}${PADDING}$(echo -e '\uf073')${PADDING2}${line#?}${PADDING}%{A}"
            ;;

       V*)
              # volume output
              read -ra volume_status <<< "${line#?}"
              volume_color=""
              if [ "${volume_status[1]}" == "off" ]; then
                volume_color="%{F#$FG_DISABLED_COLOR}%{U#$VOL_MUTE_COLOR}%{+o}"
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
              volume="${PADDING}%{F#$FG_MUTED_COLOR}${volume_color}${PADDING}${volume_icon}$padding${volume_status[0]}%${PADDING}%{-o}%{U-}%{F-}%{B-}"
              ;;

       B*)
            # battery
            read percent <<<"${line#?}"
            BATPERC="${percent%?}"
            ADD_WARN=""
            if [ "$BATPERC" -le "10" ]; then
              ADD_WARN="%{U#${BATT_CRIT_COLOR}}%{+o}"
              SYMBOL=$(echo -e '\uf244')
            elif [ "$BATPERC" -le "25" ]; then
              ADD_WARN="%{U#${BATT_WARN_COLOR}}%{+o}"
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
            batt="%{F#$FG_MUTED_COLOR}${PADDING}${ADD_WARN}${PADDING}${SYMBOL}${PADDING}${percent}${PADDING}%{-o}%{U-}%{F-}%{B-}"
            ;;
       W*)
            wm_infos=("")
            IFS=':'
            set -- ${line#?}
            monitor=0
            MONHL_COLOR=$BG_MUTED_COLOR
            ADD_START=""
            while [ $# -gt 0 ] ; do
                item=$1
                name=${item#?}
                case $item in
                    [Mm]*)
                        let monitor++
                        MONITORS+=("${name}")
                        case $item in
                          M*)
                            ADD_START="%{U#$HL_COLOR}%{+o}"
                            ;;
                          m*)
                            ADD_START="%{U#$LL_COLOR}%{+o}"
                            ;;
                        esac
                      ;;
                    [OFU]*)
                        # active desktop
                        wm_infos[$monitor]="${wm_infos[$monitor]}${PADDING}%{B#$MONHL_COLOR}%{F#$FG_MUTED_COLOR}${ADD_START}${PADDING2}$(echo -e "\uf108")${PADDING2}${name}${PADDING2}%{-o}%{U-}%{F-}%{B-}${PADDING}%{F-}"
                        ;;
                    o*)
                        # inactive but occupied desktop
                        wm_infos[$monitor]="${wm_infos[$monitor]}${PADDING}%{A:bspc desktop focused -f $name:}%{F#$FG_MUTED_COLOR}%{U#$LL_COLOR}%{+o}${PADDING2}$(echo -e "\uf108")${PADDING2}${name}${PADDING2}%{-o}%{F-}%{A}${PADDING}%{U-}%{F-}%{B-}"
                        ;;
                    f*)
                        # inactive desktop
                        wm_infos[$monitor]="${wm_infos[$monitor]}${PADDING}%{A:bspc desktop focused -f $name:}%{F#$FG_MUTED_COLOR}${PADDING2}$(echo -e "\uf108")${PADDING2}${name}${PADDING2}%{F-}%{A}${PADDING}%{U-}%{F-}%{B-}"
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

    power="%{A:dzen2_power:}${PADDING}$(echo -e '\uf011')${PADDING}%{A}"

    bar="%{r}${PADDING3}${volume}${PADDING3}${batt}${PADDING3}${date}${PADDING2}${clock}${PADDING3}${power}${PADDING}"
    #bar="%{l}${PADDING2}${wm_infos[1]}%{r}${PADDING3}${volume}${PADDING3}${batt}${PADDING3}${date}${PADDING2}${clock}${PADDING3}${power}${PADDING}"

    #WHOLE_BAR=()

    #IFS="~"
    #for monitor in `bspc query -M`; do
    #  WHOLE_BAR+=($bar)
    #done

    #printf "%s\n" "${WHOLE_BAR[0]}"
    printf "%s\n" "%{l}${PADDING2}${wm_infos[1]}${bar}%{S+}%{l}${PADDING2}${wm_infos[2]}${bar}"
    #printf "%s\n" "%{r} ${clock}"
done
