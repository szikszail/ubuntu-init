#!/usr/bin/env bash

if [ "$EUID" = 0 ]; then
  echo "Please run the script as regular user, not root" >&2
  exit 3
fi

PAUSE=
DECIDE=
EXECUTE=
while getopts pdx flag
do
  case "${flag}" in
    p) PAUSE=1;;
    d) DECIDE=1;;
    x) EXECUTE=1;;
  esac
done

HEADER_WIDTH=40
STEP_N=0

repeat_char() {
  CHARACTER=$1
  L=${#CHARACTER}
  N=$2
  R=$((N/L))
  S=""
  for i in $(seq $R); do
    S="$S$CHARACTER"
  done
  echo "$S"
}

pad_string() {
  STRING=$1
  CHARACTER=$2
  N=$3
  L=${#STRING}
  TO_ADD=$((N - L))
  PADDING=$(repeat_char "$CHARACTER" $TO_ADD)
  echo "$STRING$PADDING"
}

header() {
  MESSAGE=$1
  BORDER=$2
  if [ -z "$BORDER" ]; then
    BORDER="-"
  fi
  echo $(pad_string "" "$BORDER" $HEADER_WIDTH)
  BORDER_L=${#BORDER}
  HEADER=$(pad_string "$MESSAGE" " " $((HEADER_WIDTH - 2 - 2 * BORDER_L)))
  echo "$BORDER $HEADER $BORDER"
  echo $(pad_string "" "$BORDER" $HEADER_WIDTH)
  echo ""
}

prompt_yn() {
  if [ "$DECIDE" = "0" ]; then
    return 0
  fi
  TEXT=$1
  while true; do
    read -p "$TEXT (y/n/x, default: y)" yn
    case $yn in
      [yY] ) return 0;;
      [nN] ) return 1;;
      [xX] ) 
        echo "Interrupting script..."
        exit 1
        ;;
      "") return 0;;
      *) echo "Invalid input, only y/n are supported!";;
    esac
  done
}

pause() {
  if [ "$PAUSE" = "1" ]; then
    read -p "Hit enter to proceed..." e
  fi
}

run_step() {
  NAME=$1
  if [ -f "./steps/$NAME.sh" ]; then
    STEP_N=$((STEP_N+1))
    header "STEP $STEP_N: $NAME.sh" "="
    prompt_yn "Do you want to execute $NAME step?"
    if [ $? = 0 ]; then
      sh -x ./steps/$NAME.sh
      pause
    else
      echo "Skipping $NAME..."
    fi
    echo ""
  else
    echo "Script does not exist: ./steps/$NAME.sh!" >&2
  fi
}

if [ "$EXECUTE" = "1" ]; then
  header "STARTING init.sh" "#"
  run_step "update"
  run_step "general"
  run_step "java"
  run_step "git"
  run_step "node"
  run_step "python"
  run_step "font"
  run_step "terminal"
  run_step "ide"
  run_step "chrome"
  run_step "vlc"
  run_step "docker"
  run_step "jenkins"
  run_step "aws"
  run_step "update"
  run_step "clean"
  header "FINISHED init.sh" "#"
else
  echo "Usage init.sh -x [-p] [-d]" >&2
  echo " -p : Pause between steps" >&2
  echo " -d : Decide individually to run a step" >&2
  exit 3
fi
