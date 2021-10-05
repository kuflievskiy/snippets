screen -R

screen -S mainSessionName

# detach from the current session
Ctrl+A d

screen -ls

# reatach the `mainSessionName`
screen -r 268143.mainSessionName

# split window horizontally
Ctrl+A S 

# split window vertically
Ctrl+A |

# kill all screens
killall screen


# start terminal in the window
Ctrl+A c 

# close the window
Ctrl+A X 
