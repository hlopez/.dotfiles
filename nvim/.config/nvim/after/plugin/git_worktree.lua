require("telescope").load_extension("git_worktree")

vim.keymap.set('n', '<leader>ft', function()
  require('telescope').extensions.git_worktree.git_worktrees()
end, { desc = 'Open the [G]it work[T]ree list', silent = true, noremap = true })
-- <Enter> - switches to that worktree
-- <c-d> - deletes that worktree
-- <c-f> - toggles forcing of the next deletion

vim.keymap.set('n', '<leader>ct', function()
  require('telescope').extensions.git_worktree.create_git_worktree()
end, { desc = '[C]reates a new Git work[T]', silent = true, noremap = true })
