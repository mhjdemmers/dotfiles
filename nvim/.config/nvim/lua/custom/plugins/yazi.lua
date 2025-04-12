--@type LazySpec
return {
  'mikavilpas/yazi.nvim',
  event = 'VeryLazy',
  dependencies = {
    'folke/snacks.nvim',
  },
  keys = {
    {
      '<leader>mf',
      mode = { 'n', 'v' },
      '<cmd>Yazi<cr>',
      desc = 'Open yazi file [M]anager at the current [F]ile',
    },
    {
      -- open the current working directory
      '<leader>md',
      '<cmd>Yazi cwd<cr>',
      desc = "Open the file [M]anager in nvim's current working [D]irectory",
    },
    {
      '<leader>mt',
      '<cmd>Yazi toggle<cr>',
      desc = 'Resume the last yazi session',
    },
  },
  --@type YaziConfig | {}
  opts = {
    -- if you want to open yazi instead of netrw, see below fot more info
    open_for_directories = true,
    keymaps = {
      show_help = '<f1>',
    },
  },
  -- if you use `open_for_directories = true`, this is recommended
  init = function()
    -- More details: https://github.com/milkavilpas/yazi.nvim/issues/802
    -- vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
}
