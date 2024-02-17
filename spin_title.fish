#!/usr/bin/fish

# Characters to simulate spinning
set chars '|' '/' '-' '\\'

# Index to keep track of the spinning animation frame
set i 1

# Update interval in seconds
set interval 0.1

while true
    # Print the current character for the spinning animation
    echo $chars[$i]

    # Update the index to the next character, wrapping around if necessary
    set i (math "($i % 4) + 1")

    # Sleep for a short interval before updating the character
    sleep $interval

    # Use Polybar's hook mechanism to update the module's content
    polybar-msg hook title 1 >/dev/null 2>&1
end

