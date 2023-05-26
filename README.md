# custom-NvChad

My custom config for NvChad, enhancing neovim experience

## Issue

(0) 能够完美适配 nvim 的终端, 目前 tabby 表现不好.

[done] (1) 让 goto ref 的功能可视化效果更好
将原来的 vim.lsp.buf.references() 改为 require("telescope.builtin").lsp_references() 即可

(2) 自己实现一个 darcula theme，效果和 clion 尽可能保持一致

[done] (3) 列举出所有诊断
:Telescope diagnostics

[done] (4) 当前打开同一个文件，它记不住上次的位置
修改 custom/init.lua, 使用 vim.cmd 函数

[done] (5) C-p 打开 Telescope keymaps

[done] (6) 自动补全默认不要选中,按 tab 后选中第一个
修改 nvim-cmp 配置,加上 noselect

(7) 按 l 的时候,到行尾后继续按 l,不要自动切到下一行. 按 h 同理

(8) 进入插入模式时, 光标不要变成竖线,这样看不清光标在哪.这个貌似是 nvim 的默认配置

(9) 想多次按下 tab 进行多次缩进,但此时 nvim-cmp 也会进行自动补全,导致第二次tab不是缩进,而是选择items
可能要修改 nvim-cmp, 不是很好解决

[done] (10) 按 goto def 的时候,会出现 warning
```sh
warning: multiple different client offset_encodings detected for buffer, this is not supported yet
:LspInfo 如下
 Language client log: /home/nightn/.local/state/nvim/lsp.log
 Detected filetype:   cpp

 2 client(s) attached to this buffer:

 Client: null-ls (id: 1, bufnr: [1, 13])
 	filetypes:       markdown, jsonc, typescript, typescriptreact, javascriptreact, javascript, json, css, html, luau, lua, cuda, proto, c, java, cpp, cs
 	autostart:       false
 	root directory:  /home/nightn/maple/OpenArkCompiler
 	cmd:             <function>

 Client: clangd (id: 2, bufnr: [1, 13])
 	filetypes:       c, cpp, objc, objcpp, cuda, proto
 	autostart:       true
 	root directory:  /home/nightn/maple/OpenArkCompiler
 	cmd:             /home/nightn/.local/share/nvim/mason/bin/clangd

 Configured servers list: cssls, tsserver, lua_ls, clangd, html
```

[done] (11) 安装 clang-format 失败, 提示 no module named 'wheel'
```sh
  Failed
     󰚌 clang-format
      ▼ Displaying full log
        Collecting clang-format==16.0.3
          Using cached https://pypi.tuna.tsinghua.edu.cn/packages/4d/07/df31f6c79403f1d64869e6cac05079a2b120f84b0892a90294f90c8d151d/clang-format-16.0.3.tar.gz
            Complete output from command python setup.py egg_info:
            Traceback (most recent call last):
              File "<string>", line 1, in <module>
              File "/tmp/pip-build-t_chdwrb/clang-format/setup.py", line 2, in <module>
                from wheel.bdist_wheel import bdist_wheel as _bdist_wheel
            ModuleNotFoundError: No module named 'wheel'

            ----------------------------------------
        Command "python setup.py egg_info" failed with error code 1 in /tmp/pip-build-t_chdwrb/clang-format/
        spawn: /home/nightn/.local/share/nvim/mason/packages/clang-format/venv/bin/python failed with exit code 1 and signal 0.
```
[解决方案] 手动安装 clang-format, 使用 pip3 install clang-format, 然后再用 mason 安装即可成功.
<leader>fm 可用, 但是它是对整个 buf 进行 format

[done] (12) auto fix
map <leader>fi to vim.lsp.buf.code_action({ apply = true })

[done] (13) Git preview/undo 快捷键
<leader>hp -> hunk preview
<leader>hu -> hunk undo

(14) NvChad 的 buffer next 快捷键默认配置为 <tab>, 但 <tab> 和 <C-I> 是映射关系,导致在 <C-I> 的时候出现问题
目前将 <tab> 和 <S-tab> 快捷键都取消了

