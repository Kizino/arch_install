#!/usr/bin/env bash
#-------------------------------------------------------------------------
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo
echo "INSTALLING SOFTWARE"
echo

PKGS=(
        'wget'                  # Network utility to retrieve files from the Web
        'python'                # Python
        'python-pip'            # Pip
        'tk'                    # Python interface to the Tcl/Tk GUI toolkit (matplotlib graph)
        'cronie'                # Cron job
        'base-devel'            # Tools needed for building (compiling and linking)
        'git'                   # git
        'docker'                # Docker
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

sudo systemctl enable cronie.service
sudo systemctl start cronie.service
sudo systemctl enable docker
sudo systemctl start docker

# Install yay
cd ~/
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si


AUR_PKGS=(
        'google-chrome'                 # Chrome
        'postman-bin'                   # Postman
        'visual-studio-code-bin'        # Visual studio
)

for PKG in "${AUR_PKGS[@]}"; do
    echo "INSTALLING ${AUR_PKGS}"
    yay -S "$AUR_PKGS" --noconfirm --needed
done


