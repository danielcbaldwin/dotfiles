#!/bin/bash

walls="${HOME}/Pictures/wallpaper/random"
arrWalls=()

for wall in $(find $walls -type f); do
  arrWalls+=( $wall )
done

arrWalls=( $(shuf -e "${arrWalls[@]}") )

randIndex=$(( RANDOM % ${#arrWalls[*]} ))

feh --bg-scale ${arrWalls[randIndex]}
