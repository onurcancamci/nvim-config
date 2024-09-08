rm -rf ~/.config/alacritty
ln -s "$(readlink -f .)/alacritty" ~/.config/alacritty

# rm -rf ~/.config/.tmux.conf
# ln -s "$(readlink -f .)/.tmux.conf" ~/.config/.tmux.conf

rm -rf ~/.config/.global_gitignore
ln -s "$(readlink -f .)/.global_gitignore" ~/.config/.global_gitignore

