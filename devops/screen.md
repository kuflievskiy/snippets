screen -R

screen -S mainSessionName

# detach from the current session
Ctrl+A d

# reatach the `mainSessionName`
screen -r 123123.mainSessionName

# split window horizontally
Ctrl+A S 

# split window vertically
Ctrl+A |

# kill all screens
killall screen
