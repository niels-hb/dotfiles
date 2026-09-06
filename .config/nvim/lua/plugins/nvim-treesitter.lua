return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  lazy = false,
  config = function()
    require('nvim-treesitter').install {
      'bash',
      'dart',
      'fish',
      'go',
      'gomod',
      'html',
      'json',
      'lua',
      'markdown',
      'markdown_inline',
      'toml',
      'yaml',
    }
  end,
}
