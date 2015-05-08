####################################
#  Setup
####################################

if [[ `uname` == "Linux" ]]; then
  DOCKERCMD="sudo docker"
  DOCKERCOMPOSECMD="sudo docker-compose"
else
  DOCKERCMD="docker"
  DOCKERCOMPOSECMD="docker-compose"
fi

####################################
#  Docker
####################################

# Make docker shorter
alias d="$DOCKERCMD"

# Get docker images
alias di="$DOCKERCMD images"

# Pull docker images
alias dl="$DOCKERCMD pull"

# Push docker images
alias dp="$DOCKERCMD push"

# Get container process
alias dps="$DOCKERCMD ps"

# Get container IP
alias dip="$DOCKERCMD inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Stop all containers
dstop() { $DOCKERCMD stop $($DOCKERCMD ps -a -q); }

# Remove all containers
drm() { $DOCKERCMD rm $($DOCKERCMD ps -a -q); }

# Remove all images
dri() { $DOCKERCMD rmi -f $($DOCKERCMD images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test
dbu() {
  if [ -n "$1" ]; then
    IMAGENAME="$1"
  fi

  if [[ -z "$IMAGENAME" && `head -1 ./Dockerfile | grep -c '^#\s\?IMAGE'` = 1 ]]; then
    IMAGENAME=$(head -1 ./Dockerfile | awk '{print $3}')
  fi

  if [ -n "$IMAGENAME" ]; then
    exec 5>&1
    ID=$($DOCKERCMD build -t=$IMAGENAME . | tee >(cat - >&5) | tail -1 | awk '{print $NF}')
    echo -e "Built image: \033[32m$IMAGENAME\033[39m";
  else
    exec 5>&1
    ID=$($DOCKERCMD build . | tee >(cat - >&5) | tail -1 | awk '{print $NF}')
  fi

  for tag in $(cat "./Dockerfile" | grep "^#\s\?TAG" | awk '{print $NF}'); do
    echo -e "Setting tag: \033[32m$tag\033[39m";
    $DOCKERCMD tag -f $ID $tag;
  done
}

# Clean up images
dclean() {
  # $1 Specify search
  if [ -n "$1" ]; then
    search="$1"
  else
    search="<none>"
  fi
  $DOCKERCMD rmi -f $($DOCKERCMD images | grep "^$search" | awk '{print $3}');
}

####################################
#  Docker Compose
####################################

# Make docker-compose shorter
alias dc="$DOCKERCOMPOSECMD"

# Docker compose up
alias dcu="$DOCKERCOMPOSECMD up"

# Docker compose run
alias dcr="$DOCKERCOMPOSECMD run"

# Docker compose start
alias dcs="$DOCKERCOMPOSECMD start"

# Docker compose stop
alias dcp="$DOCKERCOMPOSECMD stop"

# Pull all images in docker-compose.yml
dcpull() {
  if [ -f ./docker-compose.yml ]; then
    echo ""
    echo "Pulling all images listed in the docker-compose.yml file"
    echo ""
    cat ./docker-compose.yml | grep "^\s*image:" | awk '{print $NF}' | uniq | xargs -L1 $DOCKERCMD pull
  else
    echo "No docker-compose.yml file found."
  fi
}


####################################
#  General
####################################

# Show all aliases related to docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
