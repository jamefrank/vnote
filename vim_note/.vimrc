" 打开文件类型检测 "
filetype on
" 打开语法高亮显示 "
syntax on
"行号
set nu
set number

"F5
filetype plugin on
" 按 F5 执行当前 Python 代码"
map <F5> :call PRUN()<CR>
func! PRUN()
    exec "w" 
    if &filetype == 'python'
        exec "!python %"
    endif
endfunc

"solarized
syntax enable
syntax on
set background=dark
colorscheme solarized

"文件树
let NERDTreeWinPos="right"
autocmd VimEnter * NERDTree

map <F3> :IndentLinesToggle<cr>
let g:indentLine_enabled = 1
"let g:indentLine_setColors = 0
"let g:indentLine_concealcursor = 'inc'
let g:indentLine_color_term = 239
"let g:indentLine_conceallevel = 4

" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']



"插件
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/davidhalter/jedi-vim.git'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Yggdroot/indentLine'
Plug 'tell-k/vim-autopep8'
Plug 'nvie/vim-flake8'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/rainbow_parentheses.vim'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'ludovicchabant/vim-gutentags'
Plug 'scrooloose/nerdtree'
Plug 'tmhedberg/SimpylFold'
Plug 'seebi/dircolors-solarized'
call plug#end()


