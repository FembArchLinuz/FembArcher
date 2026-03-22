#!/usr/bin/bash

set -e

echo "Welcome to the FembArch customization installer!"

check_gnome_version() {
  GNOME_VERSION=`gnome-session --version`
  GNOME_VERSION_NUMBER=${GNOME_VERSION##* }
  GNOME_VERSION_MAJOR=${GNOME_VERSION_NUMBER%%.*}
  if [ "$GNOME_VERSION_MAJOR" -lt 47 ]; then
    echo "You need Gnome version 47 or above."
    exit
  fi
}

check_gnome_is_running() {
  CURRENT_ENV=${XDG_CURRENT_DESKTOP,,}
  if [[ $CURRENT_ENV != *"gnome"* ]]; then
    echo "Gnome isn't running, please launch gnome environment first"
    exit
  fi
}
check_gnome_is_running
check_gnome_version

sleep 1

# Functions

install_lolly() {
    sudo pacman -S lollypop
}

install_shortwave() {
    sudo pacman -S shortwave
}

install_chrome() {
   yay -S google-chrome
}

configure_cutefetch() {
    touch cutefetch
    echo "#!/usr/bin/bash" >> cutefetch
    echo "" >> cutefetch
    echo "uwufetch" >> cutefetch
    chmod +x cutefetch
    sudo rm -rf /usr/bin/cutefetch
    sudo mv cutefetch /usr/bin/cutefetch
    sleep 1
    echo "Configured file... Installing uwufetch"
    sleep 1
    sudo pacman -S uwufetch
}

download_wallpapers() {
    wget https://vk.com/raidyhd?z=photo-144335788_457250123%2F305be7666d4eedc5c0
    wget https://vk.com/raidyhd?z=photo-144335788_457250121%2Fwall-144335788_47053
}

add_pywal() {
  if ! grep -q 'cat \$HOME/.cache/wal/sequences' "$HOME/.bashrc"; then
      echo 'if [[ -f "$HOME/.cache/wal/sequences" ]]; then' >> "$HOME/.bashrc"
      echo '    (cat $HOME/.cache/wal/sequences)' >> "$HOME/.bashrc"
      echo 'fi' >> "$HOME/.bashrc"
      echo "Added pywal hook to ~/.bashrc"
  else
      echo "Pywal hook already present in ~/.bashrc"
  fi
}

install_flatpaks() {
  # Fragments
  flatpak install flathub de.haeckerfelix.Fragments
  # Flatseal
  flatpak install flathub com.github.tchx84.Flatseal
  # Extension Manager
  flatpak install flathub com.mattjakeman.ExtensionManager
  # GearLever
  flatpak install flathub it.mijorus.gearlever

}

# Execute functions and shit :D

echo "install lollypop? (y/n)"
read -p ">.< | " choice

if [[ "$choice" == "y" ]]; then
    install_lolly
elif [[ "$choice" == "n" ]]; then
    echo "Canceled install for lollypop."
fi

echo "install shortwave? (y/n)"    
read -p ">.< | " choice1

if [[ "$choice1" == "y" ]]; then
    install_shortwave
elif [[ "$choice1" == "n" ]]; then
    echo "Canceled install for shortwave."
fi

echo "install chrome? (y/n)"
read -p ">.< | " choice2

if [[ "$choice2" == "y" ]]; then
    install_chrome
elif [[ "$choice2" == "n" ]]; then
    echo "Canceled install for chrome."
fi

echo "configure cutefetch? (y/n)"
read -p ">.< | " choice3

if [[ "$choice3" == "y" ]]; then
    configure_cutefetch 
elif [[ "$choice3" == "n" ]]; then
    echo "Canceled configuration for cutefetch."
fi


echo "Download our wallpapers? (y/n)"
read -p ">.< | " choice4

if [[ "$choice4" == "y" ]]; then
    download_wallpapers
elif [[ "$choice4" == "n" ]]; then
    echo "Canceled downloads."
fi

echo "add pywal hook to ~/.bashrc? (y/n)"
read -p ">.< | " choice5

if [[ "$choice5" == "y" ]]; then
    add_pywal
elif [[ "$choice5" == "n" ]]; then
    echo "Canceled."
fi

echo "Add flatpaks? (y/n)"
read -p ">.< | " choice6

if [[ "$choice6" == "y" ]]; then
    install_flatpaks
elif [[ "$choice6" == "n" ]]; then
    echo "Canceled installing flatpaks."
fi

echo "Done! Logout and Login and see the results."
exit 0

