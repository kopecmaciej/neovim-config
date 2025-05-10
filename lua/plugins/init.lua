-- Plugins that don't have a lot of configuration
return {
  {
    'kylechui/nvim-surround',
    version = '^3.0.0', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').set_default_mappings()
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
  {
    'xiyaowong/transparent.nvim',
    config = function()
      require('transparent').clear_prefix 'NeoTree'
    end,
  },
}
