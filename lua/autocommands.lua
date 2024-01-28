vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd BufRead,BufNewFile *.cls,*.trigger,*.apex set filetype=apex
  augroup end
]])

vim.cmd([[
    augroup _neoformat
        autocmd!
        autocmd BufWritePre * undojoin | Neoformat
    augroup end
]])
