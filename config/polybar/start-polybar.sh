#!/usr/bin/env sh

# Get the current PID of an existing polybar instance
if pgrep -x polybar > /dev/null; then
    echo "Polybar is already running. Killing..."
    killall -q polybar
    sleep 1
fi

# Wait for all polybar processes to exit
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar with a specific log to avoid overlap issues
echo "Launching Polybar..."
polybar bar 2>&1 | tee -a /tmp/polybar.log & disown
