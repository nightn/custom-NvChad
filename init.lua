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

" clear jump list
" autocmd VimEnter * :clearjumps

" copy current file name (relative/absolute) to system clipboard (Linux version)
if has("gui_gtk") || has("gui_gtk2") || has("gui_gnome") || has("unix")
  " relative path (src/foo.txt)
  nnoremap <leader>cf :let @+=expand("%")<CR>

  " absolute path (/something/src/foo.txt)
  nnoremap <leader>cF :let @+=expand("%:p")<CR>

  " filename (foo.txt)
  nnoremap <leader>ct :let @+=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <leader>ch :let @+=expand("%:p:h")<CR>

  " filename:linenumber (foo.txt:42)
  nnoremap <leader>cg :let @+=expand("%:t") . ":" . line(".")<CR>
endif
]])

