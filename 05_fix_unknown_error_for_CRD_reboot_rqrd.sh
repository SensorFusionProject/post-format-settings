/opt/google/chrome-remote-desktop/chrome-remote-desktop --stop
sudo apt-get remove chrome-remote-desktop
sudo rm -rf /opt/google/chrome-remote-desktop/
sudo rm -rf ~/.config/chrome-remote-desktop/
sudo rm -rf ~/.cache/
sudo dpkg -i chrome-remote-desktop_current_amd64.deb
sudo apt-get install -f -y
mkdir -p ~/.config/chrome-remote-desktop
