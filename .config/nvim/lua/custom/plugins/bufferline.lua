return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',

  config = function()
    vim.opt.mousemoveevent = true
    vim.opt.termguicolors = true
    require('bufferline').setup {
      options = {
        indicator = {
          style = 'underline',
        },
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' },
        },
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match 'error' and ' ' or ' '
          return ' ' .. icon .. count
        end,
      },
    }
  end,
}