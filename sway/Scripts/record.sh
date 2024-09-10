#!/bin/bash

if pgrep -x "wf-recorder" > /dev/null; then
    notify-send "Recording stopped!" "Saved in Videos folder"
    pkill wf-recorder
else
    notify-send "Recording started!" "Press the shortcut again to stop the recording"
    wf-recorder -f "$(xdg-user-dir VIDEOS)/$(date +'video_%Y-%m-%d-%H%M%S.mp4')"
fi

