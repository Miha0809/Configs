#!/bin/bash
sudo pacman -S git ranger htop inxi acpi neovim zip unzip telegram-desktop translate-shell zsh xclip ttf-jetbrains-mono-nerd docker docker-compose curl nodejs npm openssh jdk-openjdk dotnet-runtime dotnet-sdk aspnet-runtime go

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

# Install the vscode and the zoom
yay -S visual-studio-code-bin zoom

# Move config files to .config
cd ~/Downloads/
git clone https://github.com/Miha0809/Configs.git
cd Configs
mv nvim ~/.config/
mv ranger ~/.config
mv .zshrc ~/

# Create personal folders
cd ~/Documents/Mark/Programming
git clone https://github.com/Miha0809/AutoSelect.git
git clone https://github.com/Miha0809/react-pizza.git

# setting oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
