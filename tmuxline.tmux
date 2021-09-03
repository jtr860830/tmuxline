#!/usr/bin/env bash
black="#282c34"
black_light="#50555e"
black_dark="#00000d"
blue="#61afef"
blue_light="#97e1ff"
blue_dark="#1f80bc"
yellow="#e5c07b"
yellow_light="#fff3ab"
yellow_dark="#b1904d"
red="#e06c75"
red_light="#ff9da4"
red_dark="#aa3c4a"
white="#abb2bf"
white_light="#dde4f2"
white_dark="#7c838f"
green="#98c379"
green_light="#caf6a9"
green_dark="#68924c"
visual_grey="#4b5263"
comment_grey="#5c6370"

session_icon=
host_icon=
time_icon=
date_icon=

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "centre"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$white"
set "message-bg" "$black"

set "message-command-fg" "$white"
set "message-command-bg" "$black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "default"
setw "window-status-bg" "default"
setw "window-status-current-fg" "default"
setw "window-status-current-bg" "default"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$black"
setw "window-status-activity-fg" "$black"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$comment_grey"
set "window-active-style" "fg=$white"

set "pane-border-fg" "$white"
set "pane-border-bg" "$black"
set "pane-active-border-fg" "$green"
set "pane-active-border-bg" "$black"

set "display-panes-active-colour" "$yellow"
set "display-panes-colour" "$blue"

set "status-bg" "default"
set "status-fg" "$white"

time_format=$(get "@time_format" "%R")
date_format=$(get "@date_format" "%Y-%m-%d")

set "status-left" "#[fg=$white_light,bg=default]#[fg=$black,bg=$white_light,bold]$session_icon #[fg=$white_light,bg=$white_dark]#[fg=$black,bg=$white_dark] #S #[fg=$white_dark,bg=default] #[fg=$blue_light,bg=default]#[fg=$black,bg=$blue_light,bold]$host_icon #[fg=$blue_light,bg=$blue_dark] #[fg=$black,bg=$blue_dark]#h #[fg=$blue_dark,bg=default]"
set "status-right" "#[fg=$yellow_light,bg=default]#[fg=$black,bg=$yellow_light,bold]$time_icon #[fg=$yellow_light,bg=$yellow_dark]#[fg=$black,bg=$yellow_dark] ${time_format} #[fg=$yellow_dark,bg=default] #[fg=$green_light,bg=default]#[fg=$black,bg=$green_light,bold]$date_icon #[fg=$green_light,bg=$green_dark]#[fg=$black,bg=$green_dark] ${date_format} #[fg=$green_dark,bg=default]"

set "window-status-format" "#[fg=$white_dark,bg=default] #I:#W "
set "window-status-current-format" "#[fg=$black_light,bg=default,bold]#[fg=$white,bg=$black_light]#I#[fg=$black_light,bg=$black_dark]#[fg=$white,bg=$black_dark] #W #[fg=$black_dark,bg=default]"
