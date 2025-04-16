local function lsp_client_names()
  local buf_clients = vim.lsp.get_clients { bufnr = 0 }
  if next(buf_clients) == nil then
    return ''
  end
  local names = {}
  for _, client in ipairs(buf_clients) do
    table.insert(names, client.name)
  end
  return '  ' .. table.concat(names, ', ')
end

return { -- Status line lualine
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- For icons in the status line
  config = function()
    require('lualine').setup {
      options = {
        theme = 'auto', -- "auto" will set the theme dynamically based on the colorscheme
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { lsp_client_names, 'encoding', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
