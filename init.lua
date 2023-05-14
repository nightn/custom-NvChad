-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- Return to last edit position when opening files (You want this!)
vim.cmd([[
autocmd BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal! g`\"" |
   \ endif
]])

-- Other mappings
vim.cmd([[
" find all tailing whitespace
nnoremap <leader>w /\v\s+$<CR>
" delete all tailing whitespace
nnoremap <leader>W :%s/\v\s+$//g \| noh<CR>
]])

