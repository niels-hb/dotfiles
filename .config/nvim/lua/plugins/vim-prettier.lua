return {
  'prettier/vim-prettier',
  build = 'yarn install --frozen-lockfile --production',
  config = function()
    vim.g['prettier#autoformat'] = 1
    vim.g['prettier#autoformat_require_pragma'] = 0

    vim.keymap.set('n', '<leader>p', '<cmd>Prettier<CR>', {})
  end
}
