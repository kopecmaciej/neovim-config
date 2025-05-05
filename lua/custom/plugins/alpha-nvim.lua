return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      -- Set header
      dashboard.section.header.val = {
        '                                                     ',
        '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
        '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
        '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
        '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
        '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
        '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
        '                                                     ',
      }

      -- Set menu
      dashboard.section.buttons.val = {
        dashboard.button('f', '  Find file', ':Telescope find_files <CR>'),
        dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('r', '  Recent files', ':Telescope oldfiles <CR>'),
        dashboard.button('t', '  Find text', ':Telescope live_grep <CR>'),
        dashboard.button('c', '  Configuration', ':e $MYVIMRC <CR>'),
        dashboard.button('p', '  Update plugins', ':Lazy sync <CR>'),
        dashboard.button('q', '  Quit Neovim', ':qa<CR>'),
      }

      -- Set footer
      local function footer()
        local version = vim.version()
        local nvim_version = 'v' .. version.major .. '.' .. version.minor .. '.' .. version.patch
        return 'Neovim ' .. nvim_version
      end

      dashboard.section.footer.val = footer()

      -- Set layout
      dashboard.config.layout = {
        { type = 'padding', val = 2 },
        dashboard.section.header,
        { type = 'padding', val = 2 },
        dashboard.section.buttons,
        { type = 'padding', val = 1 },
        dashboard.section.footer,
      }

      -- Setup dashboard
      alpha.setup(dashboard.config)

      -- Auto open alpha when no arguments and no buffers
      vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
          local args = vim.fn.argv()
          local buffers = vim.api.nvim_list_bufs()

          if #args == 0 and #buffers == 1 and vim.api.nvim_buf_get_name(buffers[1]) == '' then
            require('alpha').start(true)
          end
        end,
      })
    end,
  },
}
