-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Customize
vim.keymap.set('v', '<C-c>', '"+y', { desc = 'Copy' })
vim.keymap.set('n', '<C-v>', '"+p', { desc = 'Paste' })
vim.keymap.set('v', '<C-v>', '"+p', { desc = 'Paste' })
vim.keymap.set('n', '<C-a>', 'ggVG', { desc = 'All Select' })
vim.keymap.set('n', '<u>', '<cmd>undo<CR>')
vim.keymap.set('n', '<C-r>', '<cmd>redo<CR>')
vim.keymap.set('n', '<S-h>', '0')
vim.keymap.set('n', '<S-l>', '$')
vim.keymap.set('v', '<S-h>', '0')
vim.keymap.set('v', '<S-l>', '$')

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- markmap
vim.keymap.set('n', '<leader>mm', function()
  vim.notify('Markmap command started...', vim.log.levels.INFO)
  
  local current_file = vim.fn.expand('%:p')
  vim.notify('Current file: ' .. current_file, vim.log.levels.INFO)
  
  if current_file == '' then
    vim.notify('No file is currently open', vim.log.levels.WARN)
    return
  end
  
  local cmd = string.format('markmap "%s" -o /tmp/markmap.html && start C:\\tmp\\markmap.html', current_file)
  vim.notify('Executing command: ' .. cmd, vim.log.levels.INFO)
  
  local output = vim.fn.system(cmd)
  vim.notify('Command output: ' .. output, vim.log.levels.INFO)
  vim.notify('Exit code: ' .. vim.v.shell_error, vim.log.levels.INFO)
  
  if vim.v.shell_error == 0 then
    vim.notify('Markmap generated successfully: /tmp/markmap.html', vim.log.levels.INFO)
  else
    vim.notify('Failed to generate markmap. Exit code: ' .. vim.v.shell_error, vim.log.levels.ERROR)
  end
end, { desc = 'Generate markmap with external markmap command' })

-- vim: ts=2 sts=2 sw=2 et
