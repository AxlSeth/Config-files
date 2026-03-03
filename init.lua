vim.opt.runtimepath:append("~/.local/share/nvim/site")

-- Telescope setup
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ['<CR>'] = require('telescope.actions').select_default,
        ['<C-j>'] = require('telescope.actions').move_selection_next,
        ['<C-k>'] = require('telescope.actions').move_selection_previous,
        ['<Esc>'] = require('telescope.actions').close,
      },
      n = {
        ['<CR>'] = require('telescope.actions').select_default,
        ['<Esc>'] = require('telescope.actions').close,
        ['q'] = require('telescope.actions').close,
      },
    },
  },
})

-- Manually load the C parser
vim.opt.runtimepath:append(vim.fn.stdpath('data') .. '/site')

-- Enable Tree-sitter highlighting
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'c',
  callback = function()
    vim.treesitter.start()
  end,
})

-- Enable Tree-sitter highlighting for Python
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.treesitter.start()
  end,
})

-- Load the Scarlet Protocol colorscheme
dofile(vim.fn.stdpath('config') .. '/lua/colors/scarlet-protocol.lua')

-- Setup nvim-notify
require("notify").setup({
  background_colour = "#0a0e14",
  fps = 60,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = ""
  },
  level = 2,
  minimum_width = 50,
  render = "default",
  stages = "fade_in_slide_out",
  timeout = 3000,
  top_down = true
})

-- Dashboard
require("dashboard").setup({
  theme = "doom",
  config = {
    header = {
      "",
      " ⣿⢸⣿⣿⣿⣿⣿⢹⣿⣿⣿⣿⣿⢿⣿⡇⡇⣿⣿⡇⢹⣿⣿⣿⣿⣿⣿⠄⢸⣿ ",
      " ⡟⢸⣿⣿⣭⣭⡭⣼⣶⣿⣿⣿⣿⢸⣧⣇⠇⢸⣿⣿⠈⣿⣿⣿⣿⣿⣿⡆⠘⣿ ",
      " ⡇⢸⣿⣿⣿⣿⡇⣻⡿⣿⣿⡟⣿⢸⣿⣿⠇⡆⣝⠿⡌⣸⣿⣿⣿⣿⣿⡇⠄⣿ ",
      " ⢣⢾⣾⣷⣾⣽⣻⣿⣇⣿⣿⣧⣿⢸⣿⣿⡆⢸⣹⣿⣆⢥⢛⡿⣿⣿⣿⡇⠄⣿ ",
      " ⣛⡓⣉⠉⠙⠻⢿⣿⣿⣟⣻⠿⣹⡏⣿⣿⣧⢸⣧⣿⣿⣨⡟⣿⣿⣿⣿⡇⠄⣿ ",
      " ⠸⣷⣹⣿⠄⠄⠄⠄⠘⢿⣿⣿⣯⣳⣿⣭⣽⢼⣿⣜⣿⣇⣷⡹⣿⣿⣿⠁⢰⣿ ",
      "  ⢻⣷⣿⡄⢈⠿⠇⢸⣿⣿⣿⣿⣿⣿⣟⠛⠲⢯⣿⣒⡾⣼⣷⡹⣿⣿⠄⣼⣿ ",
      " ⡄⢸⣿⣿⣷⣬⣽⣯⣾⣿⣿⣿⣿⣿⣿⣿⣿⡀⠄⢀⠉⠙⠛⠛⠳⠽⠿⢠⣿⣿ ",
      " ⡇⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⢄⣹⡿⠃⠄⠄⣰⠎⡈⣾⣿⣿ ",
      " ⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣭⣽⣖⣄⣴⣯⣾⢷⣿⣿⣿ ",
      " ⣧⠸⣿⣿⣿⣿⣿⣿⠯⠊⠙⢻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⣾⣿⣿⣿ ",
      " ⣿⣦⠹⣿⣿⣿⣿⣿⠄⢀⣴⢾⣼⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣾⣿⣿⣿⣿ ",
      " ⣿⣿⣇⢽⣿⣿⣿⡏⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⡿⣿⣛⣻⠿⣟⣼⣿⣿⣿⣿⢃ ",
      " ⣿⣿⣿⡎⣷⣽⠻⣇⣿⣿⣿⡿⣟⣵⣿⣟⣽⣾⣿⣿⣿⣿⢯⣾⣿⣿⣿⠟⠱⡟ ",
      " ⣿⣿⣿⣿⢹⣿⣿⢮⣚⡛⠒⠛⢛⣋⣶⣿⣿⣿⣿⣿⣟⣱⠿⣿⣿⠟⣡⣺⢿  ",
      "",
    },
    center = {
      { action = "Telescope find_files", desc = " Find file",    icon = " ", key = "f" },
      { action = "Telescope oldfiles",   desc = " Recent files", icon = " ", key = "r" },
      { action = "Telescope live_grep",  desc = " Find text",    icon = " ", key = "g" },
      { action = "qa",                   desc = " Quit",         icon = " ", key = "q" },
    },
    footer = { "", "This is NeoVIM btw" },
  },
})

-- Dashboard colors (Scarlet Protocol themed)
vim.api.nvim_set_hl(0, "DashboardHeader",      { fg = "#c792ea", bold = true })
vim.api.nvim_set_hl(0, "DashboardCenter",      { fg = "#d4d4dc" })
vim.api.nvim_set_hl(0, "DashboardCenterIcon",  { fg = "#00f5ff" })
vim.api.nvim_set_hl(0, "DashboardShortcut",    { fg = "#ff2f6a" })
vim.api.nvim_set_hl(0, "DashboardFooter",      { fg = "#c792ea", italic = true })

vim.notify = require("notify")

-- Setup noice.nvim
require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
})

-- Noice and Notify colors
vim.api.nvim_set_hl(0, "NoiceCmdline", { fg = "#d4d4dc", bg = "#111722" })
vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { fg = "#ff2f6a" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { fg = "#d4d4dc", bg = "#111722" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#bd93f9" })

vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = "#ff004d" })
vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = "#ffff00" })
vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = "#00f5ff" })
vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = "#6272a4" })
vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = "#bd93f9" })

vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = "#ff004d" })
vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = "#ffff00" })
vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = "#00f5ff" })
vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { fg = "#6272a4" })
vim.api.nvim_set_hl(0, "NotifyTRACETitle", { fg = "#bd93f9" })

-- Setup Snacks.nvim
require("snacks").setup({
  indent = {
    enabled = true,
    animate = {
      enabled = true,
      duration = {
        step = 20,
        total = 300,
      },
      easing = "outQuad",
    },
    scope = {
      enabled = true,
      char = "│",
      underline = false,
      only_scope = false,
      only_current = false,
    },
    chunk = {
      enabled = false,
      char = {
        corner_top = "",
        corner_bottom = "",
        horizontal = "",
        vertical = "│",
        arrow = "",
      },
    },
  },
  scroll = {
    enabled = true,
    animate = {
      duration = { step = 15, total = 150 },
      easing = "linear",
    },
  },
  scope = {
    enabled = true,
    animate = {
      enabled = true,
      duration = { step = 20, total = 200 },
      easing = "outQuad",
    },
  },
})

-- Snacks Scarlet Protocol colors
vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#3d1b1b" })
vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#ff2f6a", bold = true })
vim.api.nvim_set_hl(0, "SnacksIndentChunk", { fg = "#ff6ac1" })

-- nvim-autopairs (replaces pear-tree, no CR conflicts, Telescope safe)
require('nvim-autopairs').setup({
  disable_filetype = { 'TelescopePrompt' },
})

-- 42 C Formatter
require("42-formatter").setup({
  formatter = 'c_formatter_42',
  filetypes = { c = true, h = true },
})

-- Format on save for C files
local formatgrp = vim.api.nvim_create_augroup("C_format_42", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.c", "*.h" },
  command = "CFormat42",
  group = formatgrp,
})

-- Optional: format with F2
vim.api.nvim_set_keymap('n', '<F2>', ':CFormat42<CR>', { noremap = true, silent = true })

-- 42 Header
require("42header").setup({
  default_map = true,  -- <F1> in normal mode to insert/update header
  auto_update = true,  -- Auto-update header on save
  user = "seramaro",
  mail = "seramaro@student.42antananarivo.mg", -- update to your campus email
})

-- Setup nvim-cmp
local cmp = require'cmp'

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})

-- Setup LSP with nvim-cmp capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'c',
  callback = function()
    vim.lsp.start({
      name = 'clangd',
      cmd = { 'clangd' },
      capabilities = capabilities,
      root_dir = vim.fs.dirname(vim.fs.find({'.git', 'compile_commands.json'}, { upward = true })[1]),
    })
  end,
})

vim.diagnostic.config({
  signs = false, -- ← this is what turns it off
  ...
})

-- LSP Keybindings
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  end,
})

-- Telescope keybindings
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Telescope recent files' })
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = 'Telescope fuzzy find in buffer' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Telescope git files' })

-- Terminal keybindings
vim.keymap.set('n', '<leader>th', ':split | terminal<CR>', { desc = 'Terminal horizontal' })
vim.keymap.set('n', '<leader>tv', ':vsplit | terminal<CR>', { desc = 'Terminal vertical' })
vim.keymap.set('n', '<leader>tt', ':tabnew | terminal<CR>', { desc = 'Terminal new tab' })

vim.keymap.set('n', '<leader>tf', function()
  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  vim.cmd('terminal')
end, { desc = 'Terminal floating' })

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Terminal go left' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { desc = 'Terminal go down' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { desc = 'Terminal go up' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { desc = 'Terminal go right' })

-- Native cursorline with Scarlet Protocol colors
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#1a1f2e' })

-- Toggle cursorline keybinding
vim.keymap.set('n', '<leader>lh', ':set cursorline!<CR>', { desc = 'Toggle cursor line' })

-- Transparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
