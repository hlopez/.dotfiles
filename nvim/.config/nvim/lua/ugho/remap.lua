-- based on https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/remap.lua#L1C1-L31C27

vim.g.mapleader = ' '
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-f>", "<cmd>silent !~/.local/bin/tmux-windowizer %:p<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<Up>", "<C-W>k")
vim.keymap.set("n", "<Down>", "<C-W>j")
vim.keymap.set("n", "<Left>", "<C-W>h")
vim.keymap.set("n", "<Right>", "<C-W>l")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/ugho/packer.lua<CR>");

-- remove search highlighting
vim.keymap.set("n", "<leader>h", ":noh<cr>")

-- Expand %% to current directory http://vimcasts.org/e/14
vim.keymap.set("c", "%%", "<C-R>=expand('%')<cr>")

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "<leader>tt","<cmd>%s/\\s\\+$//e<cr>")

-- For spell checking
vim.keymap.set("n", "<silent> <leader>scs", "<cmd>set spell! spelllang=es<CR>")
vim.keymap.set("n", "<silent> <leader>sce", "<cmd>set spell! spelllang=en_us<CR>")
vim.keymap.set("n", "<silent> <leader>nsc", "<cmd>set nospell<CR>")

-- For development
vim.keymap.set("n","<leader>ds", "<cmd>cd ~/Development/sisne<CR>:e.<CR>:pwd<CR>")
vim.keymap.set("n","<leader>di", "<cmd>cd ~/Development/intranet_gna/develop/<CR>:e.<CR>:pwd<CR>")
vim.keymap.set("n","<leader>db", "<cmd>cd ~/Development/intranet_gna/neurobank/<CR>:e.<CR>:pwd<CR>")
vim.keymap.set("n","<leader>dco", "<cmd>cd ~/Development/intranet_gna/develop/apps/core/<CR>:e.<CR>:pwd<CR>")
vim.keymap.set("n","<leader>dcl", "<cmd>cd ~/Development/intranet_gna/develop/apps/clinical/<CR>:e.<CR>:pwd<CR>")
vim.keymap.set("n","<leader>df", "<cmd>cd ~/Development/intranet_gna/develop/apps/financial/<CR>:e.<CR>:pwd<CR>")
vim.keymap.set("n","<leader>da", "<cmd>cd ~/Development/intranet_gna/develop/apps/admin/<CR>:e.<CR>:pwd<CR>")
vim.keymap.set("n","<leader>dh", "<cmd>cd ~/Development/intranet_gna/develop/apps/hrm/<CR>:e.<CR>:pwd<CR>")

