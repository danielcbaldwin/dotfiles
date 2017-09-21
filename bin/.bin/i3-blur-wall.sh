#!/bin/bash

CURRWORKSPACE=$(wmctrl -d | grep '*' | cut -d ' ' -f1)
#echo "Current workspace: $CURRWORKSPACE"

WINDOWS=$(wmctrl -l | cut -d ' ' -f3 | grep $CURRWORKSPACE | wc -l)
#echo "Open windows on workspace$CURRWORKSPACE: $WINDOWS"

CURRWALLPAPER=$(tail -n1 ~/.fehbg | cut -d "'" -f2)
#echo "Wallpaper path: $CURRWALLPAPER"

ORIGINAL=/tmp/original-bg
echo $CURRWALLPAPER > $ORIGINAL

COPYBG=/tmp/copied-bg
cp $(cat $ORIGINAL) $COPYBG

BLURBG=/tmp/blured-bg

WINDOWS_PRESENT_FILE=/tmp/windows-present-bg

BLURRED=false

TRANSITION_STEP="0"

STEPS="5"


function blurify {
    convert $1 -blur 24,12 $2
}

function transinit {

    local i="$STEPS"

    if ! [ -d /tmp/transition-bg ]; then
        mkdir /tmp/transition-bg
    fi

    while [ $i -ge "0" ]; do
        A=$(echo "($i + 1) * 4.8" | bc -l)
        B=$(echo "($i + 1) * 2.4" | bc -l)
        convert $COPYBG -blur $A,$B /tmp/transition-bg/trans-$i
        bginit
        echo $i
        i=$[$i-1]
    done
}

function bginit {
  if [ -e $WINDOWS_PRESENT_FILE ]; then
    TRANSITION_STEP=$STEPS
    BLURRED=true
    feh --bg-fill /tmp/transition-bg/trans-$TRANSITION_STEP
  else
    CURRWALLPAPER=$(tail -n1 ~/.fehbg | cut -d "'" -f2)
    [ "$CURRWALLPAPER" != "$(cat $ORIGINAL)" ] && feh --bg-fill $(cat $ORIGINAL)
  fi
}

function transition {


    while [ $TRANSITION_STEP -lt "$STEPS" ]; do
        [ ! -e $WINDOWS_PRESENT_FILE ] && break
        feh --bg-fill /tmp/transition-bg/trans-$TRANSITION_STEP
        echo "Trans: $TRANSITION_STEP"
        TRANSITION_STEP=$[$TRANSITION_STEP+1]
        sleep 0.01
    done
    BLURRED=true
    [ ! -e $WINDOWS_PRESENT_FILE ] && transition_rev
}

function transition_rev {

    while [ $TRANSITION_STEP -ge "0" ]; do
        [ -e $WINDOWS_PRESENT_FILE ] && break
        feh --bg-fill /tmp/transition-bg/trans-$TRANSITION_STEP
        echo "Rev: $TRANSITION_STEP"
        TRANSITION_STEP=$[$TRANSITION_STEP-1]
        sleep 0.01
    done

    [ $TRANSITION_STEP -le "0" ] && TRANSITION_STEP=0

    if [ -e $WINDOWS_PRESENT_FILE ]; then
      transition
    else
      feh --bg-fill $(cat $ORIGINAL)
      BLURRED=false
    fi
}

#$(blurify $COPYBG $BLURBG)

(
while true; do
  CURRWORKSPACE=$(wmctrl -d | grep '*' | cut -d ' ' -f1)
  WINDOWS=$(wmctrl -l | cut -d ' ' -f3 | grep $CURRWORKSPACE | wc -l)
  if [[ $WINDOWS > 0 ]] || [[ $(pidof rofi) > 0 ]]; then
    touch $WINDOWS_PRESENT_FILE
  else
    [ -e $WINDOWS_PRESENT_FILE ] && rm $WINDOWS_PRESENT_FILE
  fi
done
) &

transinit

while true; do

    #CURRWORKSPACE=$(wmctrl -d | grep '*' | cut -d ' ' -f1)
    #WINDOWS=$(wmctrl -l | cut -d ' ' -f3 | grep $CURRWORKSPACE | wc -l)
    CURRWALLPAPER=$(tail -n1 ~/.fehbg | cut -d "'" -f2)

    if [ -e $WINDOWS_PRESENT_FILE ]; then
    #if [[ $WINDOWS > 0 ]] || [[ $(pidof rofi) > 0 ]]; then
#        if [ "$CURRWALLPAPER" != "$BLURBG" ]; then
        if [ $BLURRED == false ]; then
            if [ "$CURRWALLPAPER" != "$(cat $ORIGINAL)" ]; then
                echo $CURRWALLPAPER > $ORIGINAL
                cp $(cat $ORIGINAL) $COPYBG
                echo $(cat $ORIGINAL)
                #$(blurify $COPYBG $BLURBG)
                transinit
            fi
            #feh --bg-fill $BLURBG
            transition
        fi
    else
        if [ "$CURRWALLPAPER" != "$(cat $ORIGINAL)" ]; then
            #feh --bg-fill $(cat $ORIGINAL)
            transition_rev
        fi
    fi

    sleep 0.5
done
