# install tmux
brew install tmux          # on mac
sudo apt-get install tmux  # on debian

# run it
tmux

# split the screen vertically using this shortcut
CTRL+B %

# split the screen horizontally using this shortcut
CTRL+B "

# switch between screens using this shortcut
CTRL+B o

# create new window
CTRL+B+c

# detach
CTRL+B d

tmux list-sessions
tmux attach-session -t 0

# kill window
CTRL+B & 

# show time
CTRL+B t

# kill all tmux
killall tmux