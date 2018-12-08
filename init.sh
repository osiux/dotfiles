#!/bin/bash
# WIP

CURRENT_DIR=`pwd`

# Stow
if ! [ -x "$(command -v stow)" ]; then
    pacman -S stow
fi

# Git
if ! [ -x "$(command -v git)" ]; then
    pacman -S git && stow git
fi

# AUR helper: yay
if ! [ -x "$(command -v yay)" ]; then
    pacman -S go makepkg wget && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg && pacman -U *.tar.xz && cd "$CURRENT_DIR" && rm -rf yay
fi

# zsh
if ! [ -x "$(command -v zsh)" ]; then
    pacman -S zsh && zsh && git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" && stow zsh && chsh -s /bin/zsh
fi