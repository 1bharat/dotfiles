local commands = {}

function commands.setup()
  vim.cmd("command! Gcd lua require('utils').goToRoot()")
  vim.cmd("command! Config :e $MYVIMRC")
  vim.cmd("command! Reload :so $MYVIMRC")
  vim.cmd("command! Tcc lua require('utils').toggleColorColumn()")
  vim.cmd("command! Scratch lua require('utils').scratchGenerator()")

  -- git
  vim.cmd("command! GA execute ':silent !git add %'")
  vim.cmd("command! GR execute ':silent !git reset %'")
  vim.cmd("command! GG lua require'gitsigns'.refresh()")

  -- Term
  vim.cmd("command! -bang Term terminal<bang> /usr/local/bin/fish")
  vim.cmd("command! -nargs=* T split | Term <args>")
  vim.cmd("command! -nargs=* VT vsplit | Term <args>")

  -- Session
  vim.cmd("command! -nargs=* SS lua require('utils').saveSession(vim.fn.expand('<args>'))")
  vim.cmd("command! -nargs=* -complete=file SR lua require('utils').restoreSession(vim.fn.expand('<args>'))")
  vim.cmd("command! -nargs=* -complete=file SD lua require('utils').deleteSession(vim.fn.expand('<args>'))")

  -- whitepace
  vim.cmd("command! DisableTrailingWhitespace hi link EndOfLineSpace Normal")
  vim.cmd("command! EnableTrailingWhitespace hi link EndOfLineSpace ErrorMsg")

  -- Json format
  vim.cmd("command! FJ %!jq")

  vim.cmd("command! CD cd %:h")
  vim.cmd("command! BD bufdo bd")

  vim.cmd('command! -nargs=* W w')
end

return commands
