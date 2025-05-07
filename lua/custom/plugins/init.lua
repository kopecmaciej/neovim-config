-- Plugins that don't have a lot of configuration
return {
  {
    'xiyaowong/transparent.nvim',
    config = function()
      require('transparent').clear_prefix 'NeoTree'
    end,
  },
  {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup {
        style = 'deep',
        -- toggle_style_key = '<leader>ts',
      }
      require('onedark').load()
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = 'LazyGit',
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      -- indent = { char = '|' },
    },
  },
  {
    'windwp/nvim-spectre',
    config = function()
      require('spectre').setup()
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        float_opts = {
          border = 'curved',
          width = function()
            return math.floor(vim.o.columns * 0.9)
          end,
          height = function()
            return math.floor(vim.o.lines * 0.9)
          end,
        },
        direction = 'float',
        shade_terminals = true,
        close_on_exit = true,
      }
    end,
  },
}
