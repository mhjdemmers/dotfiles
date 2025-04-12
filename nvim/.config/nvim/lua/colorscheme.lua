return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  -- 'rebelot/kanagawa.nvim',
  'scottmckendry/cyberdream.nvim',
  -- 'miikanissi/modus-themes.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    -- require('kanagawa').setup {
    --   commentStyle = { italic = true },
    --   colors = {
    --     theme = {
    --       all = {
    --         ui = {
    --           bg = '#000000', -- Editor background
    --           bg_gutter = '#000000', -- Gutter background
    --           bg_sidebar = '#000000', -- Sidebar background
    --           bg_statusline = '#000000', -- Statusline background
    --           bg_float = '#000000', -- Floating windows background
    --           bg_popup = '#000000', -- Popups background
    --           bg_visual = '#222222', -- Visual selection background
    --         },
    --         syntax = {
    --           -- comment = '#6A9955', -- Comment color
    --         },
    --       },
    --     },
    --   },
    --   overrides = function(colors)
    --     return {
    --       LineNr = { bg = '#000000', fg = '#9c9c9c' }, -- Line number color
    --       CursorLineNr = { bg = '#000000', fg = '#ffffff' }, -- Current line number color
    --       SignColumn = { bg = '#000000' }, -- Gutter background
    --       NormalFloat = { bg = '#000000' }, -- Floating window background
    --       VertSplit = { fg = '#222222' }, -- Split line color
    --       WinSeparator = { fg = '#222222' }, -- Window separator
    --       StatusLine = { bg = '#000000', fg = '#ffffff' }, -- Status line
    --       StatusLineNC = { bg = '#000000', fg = '#9c9c9c' }, -- Inactive status line
    --       -- Comment = { fg = '#6A9955', italic = true }, -- Comment color
    --     }
    --   end,
    -- }
    require('cyberdream').setup {
      transparent = true,
      italic_comments = true,
      borderless_telescope = false,
    }

    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    -- vim.cmd.colorscheme 'kanagawa'
    vim.cmd.colorscheme 'cyberdream'
    -- vim.cmd.colorscheme 'modus_vivendi'

    -- Scrollbar
    vim.api.nvim_set_hl(0, 'Scrollbar', { bg = '#000000', fg = '#ffffff' })

    -- Visual selection
    vim.api.nvim_set_hl(0, 'Visual', { bg = '#222222' })

    -- Floating windows
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#000000', fg = '#9c9c9c' })

    -- Popups and tooltips
    vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#000000', fg = '#ffffff' })
    vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#222222', fg = '#ffffff' })

    -- You can configure highlights by doing something like:
    -- vim.cmd.hi 'Comment gui=none'
  end,
}
