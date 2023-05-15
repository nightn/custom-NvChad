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

vim.cmd([[
set fileencodings=ucs-bom,utf-8,gb18030,latin1   " 文件编码
" tab 与缩进
set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
" set cc=120   " 最大行宽
" 仅在真彩色终端下开启
set termguicolors

autocmd FileType def :set ft=cpp
]])

