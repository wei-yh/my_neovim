cat .bashrc_nvim >> ~/.bashrc
source ~/.bashrc
chmod +x $NVIM_TOOLS_LUALS/bin/*
chmod +x $NVIM_TOOLS_TOOLS/bin/*
chmod +x $NVIM_TOOLS_CLANGD/bin/*
chmod +x $NVIM_TOOLS_LUALS/bin/*
find ~/.local/share/nvim/lazy/ -type f -print0 | xargs -0 dos2unix --
cp $NVIM_TOOLS_PATH/linux_parser/* ~/.local/share/nvim/lazy/nvim-treesitter/parser/
