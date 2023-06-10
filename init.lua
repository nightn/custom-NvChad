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

-- Basic options
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

" Disable cursorline
set nocursorline

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

-- options for markdown-preview
vim.cmd([[
" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 1
" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
" TODO set host ip yourself
let g:mkdp_open_ip = '192.168.56.103'
" use a custom port to start server or empty for random
" let g:mkdp_port = 9090
function! g:Open_browser(url)
  let @+=a:url
  exe 'echom a:url'
  " do nothing
  " silent exe '!lemonade open 'a:url
endfunction
let g:mkdp_browserfunc = 'g:Open_browser'
" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 0
]])

-- options for img-paste
vim.cmd([[
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'
]])

-- options for vim-translator
vim.cmd([[
let g:translator_default_engines = [ 'bing' ]
" Display translation in a window
nnoremap <silent> <leader>s <Plug>TranslateW
vnoremap <silent> <leader>s <Plug>TranslateWV
]])

