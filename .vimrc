" Vim config 2023

" Download vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" +++++++++++++++++++++++++++++++"
" Plugins
call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'preservim/nerdtree'
Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production' }
Plug 'vim-scripts/AutoComplPop'
call plug#end()

" +++++++++++++++++++++++++++++++"
set mouse=v
syntax on
set number
set cursorline
set hlsearch
set ignorecase
set smartcase
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set showmatch
set shortmess+=c
inoremap { {<CR>}<Esc>ko
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap ' ''<Left>
inoremap " ""<Left>

" Go to center of file when pressing ggg
nnoremap ggg :execute "normal! " . (line("$") / 2) . "G"<CR>

" +++++++++++++++++++++++++++++++"
" Enable color themes
" Make sure to enable true color support and set background

" Enable 256-color mode if GUI is not running
if !has('gui_running')
    set t_Co=256
endif

" Enable true color support
set termguicolors

" Set background to dark for gruvbox compatibility
set background=dark

" Set colorscheme after configuring color settings
colorscheme gruvbox

" +++++++++++++++++++++++++++++++"
" Grouped autocmds

augroup CustomAutoCommands
    autocmd!
    " Cursorline Highlight
    autocmd ColorScheme * highlight Cursorline cterm=bold ctermbg=black
augroup END

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" NerdTree
nnoremap °° :NERDTreeToggle<CR>

" Yank to system clipboard
vnoremap <C-c> "+y
nnoremap <C-c> "+yy

" ++++++++++++++++++++++++++++++++
" Code templates

" HTML
function! InsertHTMLTemplate()
    call setline('.', '<!DOCTYPE html>')
    call append(line('.'), [
    \ '<html lang="en">',
    \ '  <head>',
    \ '    <meta charset="UTF-8">',
    \ '    <meta name="viewport" content="width=device-width, initial-scale=1.0">',
    \ '    <title>Document</title>',
    \ '  </head>',
    \ '  <body>',
    \ '',
    \ '  </body>',
    \ '</html>'
    \ ])
    startinsert!
endfunction

command! HTML call InsertHTMLTemplate()

" React 
function! InsertReactTemplate()
    call setline('.', "import React from 'react'")
    call append(line('.'), [
    \ '',
    \ 'function ComponentName() {',
    \ '',
    \ '  return (',
    \ '    <div>ComponentName</div>',
    \ '  )',
    \ '}',
    \ '',
    \ 'export default ComponentName'
    \ ])
    startinsert!
endfunction

command! React call InsertReactTemplate()
