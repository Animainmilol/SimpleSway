
if pgrep -x "wf-recorder" > /dev/null; then
    notify-send "Recording stopped!" "Saved in Videos folder"
    pkill wf-recorder
else
    notify-send "Recording will start after area selection!" "Press escape NOW or press the shortcut again to stop the recording"
    wf-recorder -g "$(slurp)" -f "$(xdg-user-dir VIDEOS)/gif_not_converted.mp4"
    ffmpeg -i "$(xdg-user-dir VIDEOS)/$(date +'gif_not_converted.mp4')" "$(xdg-user-dir VIDEOS)/$(date +'gif_%Y-%m-%d-%H%M%S.gif')"
    rm "$(xdg-user-dir VIDEOS)/gif_not_converted.mp4"
fi
