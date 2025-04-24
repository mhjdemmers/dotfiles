return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  -- 'rebelot/kanagawa.nvim',
  -- 'vague2k/vague.nvim',
  -- 'scottmckendry/cyberdream.nvim',
  -- 'bluz71/vim-moonfly-colors',
  -- 'miikanissi/modus-themes.nvim',
  'rose-pine/neovim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    -- require('kanagawa').setup {
    --   transparent = true,
    --   commentStyle = { italic = true },
    --   colors = {
    --     palette = {
    --       sumiInk0 = '#000000', -- Background color
    --       sumiInk1 = '#000000', -- Background color
    --       sumiInk2 = '#000000', -- Background color
    --       sumiInk3 = '#000000', -- Background color
    --       sumiInk4 = '#000000', -- Background color
    --       sumiInk5 = '#000000', -- Background color
    --     },
    --     theme = {
    --       all = {
    --         ui = {
    --           bg_gutter = 'none',
    --         },
    --         syn = {
    --           -- comment = '#6A9955', -- Comment color
    --         },
    --       },
    --     },
    --   },
    -- }
    --
    -- require('cyberdream').setup {
    --   transparent = true,
    --   italic_comments = true,
    --   borderless_telescope = false,
    -- }
    --
    -- require('vague').setup {
    --   transparent = true,
    -- }
    --
    require('rose-pine').setup {
      variant = 'main',
      styles = {
        transparency = true,
      },
    }
    --
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    -- vim.cmd.colorscheme 'kanagawa'
    -- vim.cmd.colorscheme 'cyberdream'
    -- vim.cmd.colorscheme 'modus_vivendi'
    -- vim.cmd.colorscheme 'moonfly'
    -- vim.cmd.colorscheme 'vague'
    vim.cmd.colorscheme 'rose-pine'

    -- Scrollbar
    -- vim.api.nvim_set_hl(0, 'Scrollbar', { bg = '#000000', fg = '#ffffff' })

    -- Visual selection
    -- vim.api.nvim_set_hl(0, 'Visual', { bg = '#222222' })

    -- Floating windows
    -- vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#000000', fg = '#9c9c9c' })

    -- Popups and tooltips
    -- vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#000000', fg = '#ffffff' })
    -- vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#222222', fg = '#ffffff' })

    -- You can configure highlights by doing something like:
    -- vim.cmd.hi 'Comment gui=none'
  end,
}
