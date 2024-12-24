return { -- Status line lualine
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- For icons in the status line
  config = function()
    require('lualine').setup {
      options = {
        theme = 'auto', -- "auto" will set the theme dynamically based on the colorscheme
        --   theme = {
        --     normal = {
        --       a = { fg = '#000000', bg = '#7e9cd8', gui = 'bold' },
        --       b = { fg = '#c8c093', bg = '#2a2a37' },
        --       c = { fg = '#c8c093', bg = '#000000' },
        --     },
        --     insert = {
        --       a = { fg = '#000000', bg = '#98bb6c', gui = 'bold' },
        --     },
        --     visual = {
        --       a = { fg = '#000000', bg = '#957fb8', gui = 'bold' },
        --     },
        --     replace = {
        --       a = { fg = '#000000', bg = '#ffa066', gui = 'bold' },
        --     },
        --     command = {
        --       a = { fg = '#000000', bg = '#c0a36e', gui = 'bold' },
        --     },
        --     inactive = {
        --       a = { fg = '#9c9c9c', bg = '#000000' },
        --       b = { fg = '#9c9c9c', bg = '#000000' },
        --       c = { fg = '#9c9c9c', bg = '#000000' },
        --     },
        --   },
        --   section_separators = '',
        --   component_separators = '',
      },
      -- sections = {
      --   lualine_a = { 'mode' },
      --   lualine_b = { 'branch', 'diff', 'diagnostics' },
      --   lualine_c = {
      --     {
      --       'buffers',
      --       icons_enabled = false,
      --       -- buffers_color = {
      --       --   active = { fg = '#c0a36e', bg = '#000000' }, -- Off-white for active buffer
      --       --   inactive = { fg = '#9c9c9c', bg = '#000000' }, -- Gray for inactive buffers
      --       -- },
      --     },
      --   },
      --   lualine_x = { 'encoding', 'fileformat', 'filetype' },
      --   lualine_y = { 'progress' },
      --   lualine_z = { 'location' },
      -- },
      -- inactive_sections = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = { 'filename' },
      --   lualine_x = { 'location' },
      --   lualine_y = {},
      --   lualine_z = {},
      -- },
    }
  end,
}
