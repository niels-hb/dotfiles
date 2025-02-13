return {
  'nvim-pack/nvim-spectre',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'folke/trouble.nvim'
  },
  keys = {
    {
      '<leader>fr',
      '<cmd>lua require("spectre").toggle()<CR>',
      mode = 'n',
    }
  }
}
