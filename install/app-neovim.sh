sudo apt install -y neovim

if [ ! -d "$HOME/.config/nvim" ]; then
	git clone https://github.com/LazyVim/starter ~/.config/nvim
	rm -rf ~/.config/nvim/.git
	mkdir -p ~/.config/nvim/plugin/after

	# Enable default extras
	cp ~/.local/share/omakub-wsl/configs/neovim/lazyvim.json ~/.config/nvim/lazyvim.json
fi
