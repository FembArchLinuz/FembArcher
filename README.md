FembArcher is a customization tool (or installer)
To run the file you must chmod the file or just run it with 'bash FembArcher/fembarcher.sh'
If you want to chmod do 'chmod +x FembArcher/fembarcher.sh' and then run with './FembArcher/fembarcher.sh'

What FembArcher does in the background is the code bellow.

# CODE

# Install Lollypop

'sudo pacman -S lollypop'

# Install shortwave

'sudo pacman -S shortwave'

# Install chrome

'yay -S google-chrome'

# Configure Cutefetch

'
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
'

# Add pywal

' if ! grep -q 'cat \$HOME/.cache/wal/sequences' "$HOME/.bashrc"; then
      echo 'if [[ -f "$HOME/.cache/wal/sequences" ]]; then' >> "$HOME/.bashrc"
      echo '    (cat $HOME/.cache/wal/sequences)' >> "$HOME/.bashrc"
      echo 'fi' >> "$HOME/.bashrc"
      echo "Added pywal hook to ~/.bashrc"
  else
      echo "Pywal hook already present in ~/.bashrc"
  fi

  # Fragments
'

'  # Fragments
  flatpak install flathub de.haeckerfelix.Fragments
  # Flatseal
  flatpak install flathub com.github.tchx84.Flatseal
  # Extension Manager
  flatpak install flathub com.mattjakeman.ExtensionManager
  # GearLever
  flatpak install flathub it.mijorus.gearlever
'

# License

This project is released under the MIT license,
Check LICENSE file.
