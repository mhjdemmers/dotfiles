-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostics message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostics message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'show diagnostic [E]rror message' })

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

-- Toggle Line Wrap keymap
vim.keymap.set('n', '<leader>tw', function()
  vim.wo.wrap = not vim.wo.wrap
  print('Line wrap: ' .. (vim.wo.wrap and 'Enabled' or 'Disabled'))
end, { desc = '[T]oggle line [W]rap' })

-- Toggle Transparency
vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTransparent<CR>', { desc = '[T]oggle [T]ransparency' })

-- Buffer keymaps
-- Switch to the alternative buffer
vim.keymap.set('n', '<leader>bb', '<C-^>', { desc = '[B]uffer Alternative [B]uffer' })

-- Switch to the next buffer
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', { desc = '[B]uffer [N]ext' })

-- Switch to the previous buffer
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<CR>', { desc = '[B]uffer [P]revious' })

-- Close the current buffer
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = '[B]uffer [D]elete' })
