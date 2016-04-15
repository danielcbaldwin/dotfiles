#!/bin/bash

if [ "$(bspc query -M | wc -l)" -eq "3" ]; then
  bspc monitor 1 -d 01 04 07
  bspc monitor 2 -d 02 05 08
  bspc monitor 3 -d 03 06 09
elif [ "$(bspc query -M | wc -l)" -eq "2" ]; then
  bspc monitor 1 -d 01 03 05 07 09
  bspc monitor 2 -d 02 04 06 08 10
else
  bspc monitor 1 -d 01 02 03 04 05 06 07 08 09
fi
# i=1
# for monitor in $(bspc query -M); do
#     bspc monitor $monitor \
#         -n "$i" \
#         -d {01,02,03,04,05,06,07,08,09}
#     let i++
# done
# unset i


exit 1

bspc subscribe all | while read line; do
  echo $line
done
