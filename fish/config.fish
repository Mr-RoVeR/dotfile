source $HOME/.config/fish/cfgs/Greet.fish
source $HOME/.config/fish/cfgs/CusFunction.fish
source $HOME/.config/fish/cfgs/History.fish
source $HOME/.config/fish/cfgs/CusAlias.fish

alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'
alias update-arch='paru'
alias update-mirrors='sudo reflector --verbose --score 100 --latest 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist && sudo pacman -Syyu'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias reinstall-all-pkg='sudo pacman -Qq | sudo pacman -S -'
alias clean-arch='paru -Sc && paru -c'
