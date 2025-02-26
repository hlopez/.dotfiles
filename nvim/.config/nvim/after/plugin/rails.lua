-- set keymaps
local keymap = vim
    .keymap
keymap.set("n", "<Leader><Up>", "<cmd>Econtroller<CR>", { desc = "Rails: Goto controller" })
keymap.set("n", "<Leader><Down>", "<cmd>Eview<CR>", { desc = "Rails: Goto view" })
keymap.set("n", "<Leader><Left>", "<cmd>Emodel<CR>", { desc = "Rails: Goto model" })
keymap.set("n", "<Leader><Right>", "<cmd>Ehelper<CR>", { desc = "Rails: Goto Helper" })
-- disable autocmd set filetype=eruby.yaml
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost' },
  {
    pattern = { '*.yml' },
    callback = function()
      vim.bo.filetype = 'yaml'
    end

  }
)
