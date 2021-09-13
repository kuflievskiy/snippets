```
sudo apt install mplayer -y
mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0 -fps 30

sudo apt install mencoder -y
mencoder tv:// -tv driver=v4l2:width=320:height=240:device=/dev/video0 -ovc lavc -o webcam.avi
padsp mencoder tv:// -tv driver=v4l2:width=320:height=240:device=/dev/video0 -ovc lavc -o webcam.avi

```
