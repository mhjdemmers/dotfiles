return {
  'rmagatti/auto-session',
  lazy = false,
  keys = {
    { '<leader>wr', '<cmd>SessionSearch<CR>', desc = 'Search session' },
    { '<leader>ws', '<cmd>SessionSave<CR>', desc = 'Save session' },
    { '<leader>wt', '<cmd>SessionToggleAutoSave<CR>', desc = 'Toggle session autosave' },
  },
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
    session_lens = {
      load_on_setup = true,
      previewer = false,
      mappings = {
        delete_session = { 'i', '<C-D>' },
        alternate_session = { 'i', '<C-S>' },
        copy_session = { 'i', '<C-Y>' },
      },
    },
  },
}
