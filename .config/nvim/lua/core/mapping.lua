local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_args = bind.map_args

vim.g["@z"] = "f cl<CR><ESC>l"

local def_map = {
  -- normal mode
  ["n|s"]                    = map_cmd("<Nop>"),
  ["n|<M-Down>"]             = map_cmd(":m .+1<CR>=="):with_noremap(),
  ["n|<M-Up>"]               = map_cmd(":m .-2<CR>=="):with_noremap(),
  ["n|<Leader>C"]            = map_cmd(":e %:p:h/"):with_noremap(),
  ["n|s-"]                   = map_cr("bd"):with_noremap(),
  ["n|s_"]                   = map_cr("bd!"):with_noremap(),
  ["n|sp"]                   = map_cmd("\"+p"):with_noremap(),
  ["n|s;"]                   = map_cr("b#"):with_noremap(),
  ["n|sc"]                   = map_cr("nohl"):with_noremap():with_silent(),
  ["n|s#"]                   = map_cmd(":let @/='\\<'.expand('<cword>').'\\>'<CR>cgN"):with_noremap():with_silent(),
  ["n|s*"]                   = map_cmd(":let @/='\\<'.expand('<cword>').'\\>'<CR>cgn"):with_noremap():with_silent(),
  ["n|ss"]                   = map_args("ls<CR>:b"):with_noremap(),
  ["n|s!"]                   = map_cr(":let @+=expand('%')"):with_noremap(),
-- map('n', 'sn', '<cmd>lua require("helpers").toggleNumbers()<CR>', nOpt)
  ["n|sq"]                   = map_cmd("q"):with_noremap(),
  ["n|q"]                    = map_cmd("<Nop>"):with_noremap(),
  ["n|<M-+>"]                = map_cr(":vertical resize +5"):with_noremap():with_silent(),
  ["n|<M-=>"]                = map_cr(":vertical resize -5"):with_noremap():with_silent(),
  ["n|<M-->"]                = map_cr(":resize -5"):with_noremap():with_silent(),
  ["n|<M-_>"]                = map_cr(":resize +5"):with_noremap():with_silent(),
  ["n|!"]                    = map_cmd(vim.g["@z"]):with_noremap(),
  ["n|<C-e>"]                = map_cr("wincmd w"):with_noremap(),

  -- visual mode
  ["v|s"]                    = map_cmd("<Nop>"),
  ["v|<M-Down>"]             = map_cmd(":m '>+1<CR>gv=gv"):with_noremap(),
  ["v|<M-Up>"]               = map_cmd(":m '<-2<CR>gv=gv"):with_noremap(),
  ["v|sy"]                   = map_cmd("\"+y"):with_noremap(),
  ["v|sp"]                   = map_cmd("\"+p"):with_noremap(),
  ["v|s#"]                   = map_cmd("\"sy:let @/=@s<CR>cgN"):with_noremap(),
  ["v|s*"]                   = map_cmd("\"sy:let @/=@s<CR>cgn"):with_noremap(),
}

bind.nvim_load_mapping(def_map)

