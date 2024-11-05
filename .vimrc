" Vim config 2023

" Download vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" +++++++++++++++++++++++++++++++"
" Plugins
call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'preservim/nerdtree'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'vim-scripts/AutoComplPop'
call plug#end()

" +++++++++++++++++++++++++++++++"
set mouse=a
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

"go to center of file whwn press ggg"
nnoremap ggg :execute "normal! " . (line("$") / 2) . "G"<CR>

" +++++++++++++++++++++++++++++++"
" enable color themes
if !has('gui_running')
    set t_Co=256
endif
" enable true color support
set termguicolors
set background=dark
colorscheme gruvbox

" +++++++++++++++++++++++++++++++"
" Grouped autocmds

augroup CustomAutoCommands
    autocmd!
    " Cursorline Highlight
    autocmd ColorScheme * highlight Cursorline cterm=bold ctermbg=black
    " Autosave with a message display
    set updatetime=2000
    autocmd CursorHold * silent! wall | echo "Autosaved at " . strftime("%H:%M:%S")
    autocmd InsertLeave * write | echo "File saved!"
augroup END

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" NerdTree
nnoremap °° :NERDTreeToggle<CR>

"++++++++++++++++++++++++++++++++

" Code templates

"HTML
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
"


"React 
function! InsertReactTemplate()
    call setline('.', "import React from 'react'")
    call append(line('.'), ['', 'function ComponentName() {', '', '  return (', '    <div>ComponentName</div>', '  )', '}', '', 'export default ComponentName'])
    startinsert!
endfunction

command! React call InsertReactTemplate()

