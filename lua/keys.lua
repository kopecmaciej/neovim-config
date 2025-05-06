local map = vim.keymap.set

-- General mappings {{{
map('i', 'jj', '<ESC>')
map('i', '<C-c>', '<Esc>')
map('n', '<leader>A', 'ggVG', { desc = 'highlight all' })
map('n', '<leader>vf', 'va{oV', { desc = 'highlight bracket function' })
map('n', 'J', 'mzJ`z', { desc = 'Move line up without moving cursor' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Go down and with middle cursor' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Go up and with middle cursor' })
map('n', 'n', 'nzzzv', { desc = 'Go next with middle cursor' })
map('n', 'N', 'Nzzzv', { desc = 'Go back with middle cursor' })
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move highlighted down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move highlighted up' })
-- Swap p and P behavior
map('v', 'p', 'P', { desc = 'Paste before cursor (keep register)' })
map('v', 'P', 'p', { desc = 'Paste after cursor (keep register)' })
-- Window resize
map('n', '<C-Up>', '<cmd> resize +5 <CR>', { desc = 'Resize window up' })
map('n', '<C-Down>', '<cmd> resize -5 <CR>', { desc = 'Resize window down' })
map('n', '<C-Left>', '<cmd> vertical resize +5 <CR>', { desc = 'Resize window left' })
map('n', '<C-Right>', '<cmd> vertical resize -5 <CR>', { desc = 'Resize window right' })
-- Buffers
map('n', '<leader>X', '<cmd> %bd|e# <cr>', { desc = 'Close all buffers except current' })
-- }}}

-- NeoTree
map('n', '<C-n>', ':Neotree toggle<CR>', { desc = 'NeoTree toggle' })
map('n', '<leader>e', ':Neotree reveal<CR>', { desc = 'NeoTree focus' })

-- Git
map('n', '<leader>gg', '<cmd> LazyGit <CR>', { desc = 'Lazygit' })

-- Terminal
map('n', '<A-i>', '<cmd>ToggleTerm direction=float<CR>', { desc = 'Toggle floating terminal' })
map('t', '<A-i>', '<cmd>ToggleTerm<CR>', { desc = 'Toggle floating terminal' })

-- Spectre {{{
map('n', '<leader>S', "<cmd> lua require('spectre').open()<CR>", { desc = 'Open Spectre' })
map('n', '<leader>sf', "<cmd> lua require('spectre').open_file_search()<CR>", { desc = 'Search' })
map('n', '<leader>sw', "<cmd> lua require('spectre').open_visual({select_word=true})<CR>", { desc = 'Replace word' })
map('n', '<leader>ss', "<cmd> lua require('spectre').open_visual()<CR>", { desc = 'Replace visual' })
map('v', '<leader>sw', "<cmd> lua require('spectre').open_visual({select_word=true})<CR>", { desc = 'Replace word' })
map('v', '<leader>ss', "<cmd> lua require('spectre').open_visual()<CR>", { desc = 'Replace visual' })
-- }}}

-- Harpoon {{{
local status, harpoon = pcall(require, 'harpoon')
if status then
  map('n', '<C-t>', function()
    Toggle_telescope(harpoon:list())
  end, { desc = 'Open harpoon window' })
end
-- }}}

-- Telescope {{{
local builtin = require 'telescope.builtin'
map('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
map('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
map('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
map('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
map('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
map('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
map('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
map('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
-- Slightly advanced example of overriding default behavior and theme
map('n', '<leader>/', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })
-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
map('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })
-- Shortcut for searching your Neovim configuration files
map('n', '<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })
-- life grep visually highlighted words
map('v', '<leader>fv', function()
  vim.cmd 'normal! y'
  local search = vim.fn.getreg('"'):gsub(' ', [[\ ]])
  require('telescope.builtin').live_grep { default_text = search }
end, { desc = 'Live grep (visual)' })
-- }}}
