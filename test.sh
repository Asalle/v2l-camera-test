#!/bin/bash

# Define your command here
CMD="gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-raw,format=UYVY,width=2592,height=1944,framerate=15/1 ! videoconvert ! video/x-raw,format=YUY2,width=2592,height=1944 ! waylandsink display=${WAYLAND_DISPLAY" 
COUNTER_FILE=count.txt

for i in {1..500}
do
    echo "Iteration $i: Starting command..."
    
    # Run the command in the background
    $CMD &
    
    # Get the Process ID (PID) of the last command
    PID=$!
    
    # Wait for 6 seconds
    sleep 6
    
    # Check if the process is still running
    if kill -0 $PID 2>/dev/null; then
        echo "Command still running. Canceling PID $PID..."
        kill $PID
    else
        echo "Command finished on its own within 6 seconds."
	COUNT=$(cat "$COUNTER_FILE")
        echo $((COUNT + 1)) > "$COUNTER_FILE"
    fi
    
    echo "---"
done

echo "Done."
