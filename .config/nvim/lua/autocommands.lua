-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Custom Commands ]]
-- Add custom commands or autocommands here

-- Toggle transparency command
local is_transparent = false
local function toggle_transparency()
  if is_transparent then
    -- Restore Kanagawa custom black theme background
    vim.api.nvim_set_hl(0, 'Normal', { bg = '#000000', fg = '#c8c093' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#000000', fg = '#c8c093' })
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = '#000000' })
    vim.api.nvim_set_hl(0, 'LineNr', { bg = '#000000', fg = '#9c9c9c' })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = '#000000', fg = '#ffffff' })
    vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#363646' })
    vim.api.nvim_set_hl(0, 'GitSignsAdd', { bg = '#000000', fg = '#98c379' })
    vim.api.nvim_set_hl(0, 'GitSignsChange', { bg = '#000000', fg = '#e5c07b' })
    vim.api.nvim_set_hl(0, 'GitSignsDelete', { bg = '#000000', fg = '#e06c75' })
    vim.api.nvim_set_hl(0, 'WinSeparator', { bg = '#000000', fg = '#444444' })
    vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = '#000000', fg = '#444444' })
    print 'Transparency disabled'
  else
    -- Make background transparent
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none', fg = '#c8c093' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none', fg = '#c8c093' })
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none', fg = '#9c9c9c' })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'none', fg = '#ffffff' })
    vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'GitSignsAdd', { bg = 'none', fg = '#98c379' })
    vim.api.nvim_set_hl(0, 'GitSignsChange', { bg = 'none', fg = '#e5c07b' })
    vim.api.nvim_set_hl(0, 'GitSignsDelete', { bg = 'none', fg = '#e06c75' })
    vim.api.nvim_set_hl(0, 'WinSeparator', { bg = 'none', fg = '#444444' })
    vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = 'none', fg = '#444444' })
    print 'Transparency enabled'
  end
  is_transparent = not is_transparent
end

vim.api.nvim_create_user_command('ToggleTransparent', toggle_transparency, {})
