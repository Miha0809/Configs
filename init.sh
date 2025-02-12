#!/bin/bash
sudo pacman -S git ranger htop inxi acpi neovim zip unzip telegram-desktop translate-shell zsh xclip ttf-jetbrains-mono-nerd docker docker-compose ttf-jetbrains-mono-nerd curl nodejs npm openssh jdk-openjdk

# setting the docker
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl restart docker
sudo chmod 777 /var/run/docker.sock

# setting the git
git config --global user.email "miha080104@gmail.com"
git config --global user.name "Miha0809"

# install the AUR
mkdir -p ~/Downloads && cd ~/Downloads/
sudo pacman -Syu
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install the vscode and the android-studio from a AUR
yay -S visual-studio-code-bin android-studio

# Install the SDKMan
curl -s "https://get.sdkman.io" | bash
source "/home/mark/.sdkman/bin/sdkman-init.sh"

# Install a kotlin from SDKMan
sdk install kotlin

# Move config files to .config
cd ~/Downloads/
git clone https://github.com/Miha0809/Configs.git
cd Configs
mv nvim ~/.config/
mv ranger ~/.config
mv .zshrc ~/

# Create personal folders
mkdir -p ~/Documents/Mark/Programming/Android
cd ~/Documents/Mark/Programming
git clone https://github.com/Miha0809/AutoSelect.git
git clone https://github.com/Miha0809/react-pizza.git

echo "INSTALL A .NET"
