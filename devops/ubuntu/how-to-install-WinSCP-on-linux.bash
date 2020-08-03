
##################################################################################################
# how-to-install-WinSCP-on-linux
##################################################################################################

https://github.com/thecotne/sublime-WinSCP/wiki/how-to-install-WinSCP-on-linux
apt install wine icoutils imagemagick
wget http://sourceforge.net/projects/winscp/files/WinSCP/5.11.3/WinSCP-5.11.3-Portable.zip/download -O winscp.zip
mkdir /opt/WinSCP
unzip winscp.zip -d /opt/WinSCP
chmod +x /opt/WinSCP/WinSCP.exe
chmod +x /opt/WinSCP/WinSCP.com

touch /usr/share/applications/WinSCP.desktop

cat <<EOF > /usr/share/applications/WinSCP.desktop
[Desktop Entry]
Name=WinSCP
Exec=WinSCP
Icon=WinSCP
Type=Application
Categories=GTK;GNOME;Utility;
EOF

ln -s /opt/WinSCP/WinSCP.exe /bin/WinSCP

wrestool -x -n MAINICON /opt/WinSCP/WinSCP.exe > /opt/WinSCP/WinSCP.ico
convert /opt/WinSCP/WinSCP.ico\[0\] /usr/share/icons/WinSCP.png
rm winscp.zip -f
