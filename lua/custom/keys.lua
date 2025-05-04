local map = vim.keymap.set

-- General mappings
map('i', 'jk', '<ESC>')
map('n', '<leader>A', 'ggVG', { desc = 'highlight all' })
map('n', '<leader>vf', 'va{oV', { desc = 'highlight bracket function' })
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move highlighted down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move highlighted up' })
map('n', 'J', 'mzJ`z', { desc = 'Move line up without moving cursor' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Go down and with middle cursor' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Go up and with middle cursor' })
map('n', 'n', 'nzzzv', { desc = 'Go next with middle cursor' })
map('n', 'n', 'Nzzzv', { desc = 'Go back with middle cursor' })
map('i', '<C-c>', '<Esc>', { desc = 'Fast esc for visual highlight' })

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

-- Git
map('n', '<leader>gg', '<cmd> LazyGit <CR>', { desc = 'Lazygit' })

-- Telescope
map('n', '<leader>ff', '<cmd> Telescope find_files <CR>', { desc = 'Live grep' })
map('n', '<leader>fg', '<cmd> Telescope live_grep <CR>', { desc = 'Live grep' })
map('n', '<leader>fs', '<cmd> Telescope grep_string <CR>', { desc = 'Grep string' })
map('n', '<leader>fr', '<cmd> Telescope resume <CR>', { desc = 'Resume last picker' })
map('n', '<leader>fd', '<cmd> Telescope diagnostics <CR>', { desc = 'Diagnostic' })

-- life grep visually highlighted words
map('v', '<leader>fv', function()
  vim.cmd 'normal! y'
  local search = vim.fn.getreg('"'):gsub(' ', [[\ ]])
  require('telescope.builtin').live_grep { default_text = search }
end, { desc = 'Live grep (visual)' })
