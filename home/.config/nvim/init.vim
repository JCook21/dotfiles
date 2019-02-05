""""""""""""""""""""
" Plugin config
" Uses vim-plug to manage plugins
"""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
	" Plugins
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-unimpaired'
	Plug 'tpope/vim-repeat'
	Plug 'w0rp/ale'
	Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php'}
	Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php'}
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'pangloss/vim-javascript', { 'for': 'js' }
	Plug 'mxw/vim-jsx', { 'for': ['js', 'jsx'] }
	" Syntax highlighting
	Plug 'iCyMind/NeoSolarized'
	Plug 'StanAngeloff/php.vim', { 'for': 'php'}
	Plug 'vim-ruby/vim-ruby', { 'for': 'ruby'}
	Plug 'tmux-plugins/vim-tmux'
	Plug 'othree/html5-syntax.vim'
	Plug 'elzr/vim-json', { 'for': 'json' }
	" Vim-Devicons should be loaded last to avoid issues with otherplugins.
	Plug 'ryanoasis/vim-devicons'
call plug#end()

"""""""""""""""
" Set various options
"""""""""""""""
set mouse=a
" Stops vim from displaying --INSERT-- at the bottom of the window.
set noshowmode
set linebreak
set nolist
" Set the hidden option to enable moving through args and buffers without
" saving them first
set hidden
" Show line numbers by default
" This displays the absolute line number for the current line and relative
" numbers for all others.
set number relativenumber
" Clear relative numbers under some circumstances, specifically entering
" insert mode.
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave,CmdwinLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter,CmdwinEnter * set norelativenumber
augroup END

" Auto indent after a {
set smartindent
" Enable folding by fold markers
set foldmethod=marker
" Autoclose folds, when moving out of them
set foldclose=all
" Jump 5 lines when running out of the screen
set scrolljump=5
" Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=3
" Show large "menu" with auto completion options
set wildmode=list:longest
" Fugitive vertical splits in diffs
set diffopt+=vertical
" Clear search highlights when pressing esc
nnoremap <esc> :noh<return><esc>

" Use filetype plugins
filetype on
filetype plugin on

" Colorscheme
colorscheme NeoSolarized

" Highlight current line in insert mode.
autocmd InsertLeave * set nocursorline
autocmd InsertEnter * set cursorline

" Save files as root
cnoremap w!! w !sudo tee % >/dev/null

" load the man plugin for a nice man viewer
runtime! ftplugin/man.vim

" Filetype settings
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType markdown set spell
autocmd FileType crontab setlocal nobackup nowritebackup

au BufRead,BufNewFile *.txt set filetype=txt

au BufRead,BufNewFile *.phps set filetype=php

" Associate .md files with markdown.
au BufRead,BufNewFile *.md set filetype=markdown

" Source templates for filetype
augroup templates
	autocmd BufNewFile *.php 0r ~/.vim/skeletons/skeleton.php
augroup END

" Switch paste mode off whenever insert mode is left
autocmd InsertLeave <buffer> set nopaste

" Highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Plugin settings " ================================================================================
" ALE settings
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_fixers = {
\	'*': ['remove_trailing_lines', 'trim_whitespace'],
\	'ruby': ['rubocop', 'standardrb'],
\	'javascript': ['eslint', 'prettier'],
\}
let g:ale_fix_on_save = 1

" Ultisnips settings
let g:UltiSnipsExpandTrigger = "<leader><Tab>"
let g:UltiSnipsListSnippets = "<leader><C-Tab>"
let g:UltiSnipsSnippetsDir = $HOME . "/.vim/snippets"
let g:UltiSnipsSnippetDirectories = ["mysnippets", "templates_snip"]

" Airline plugin
let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1
let g:airline_inactive_collapse=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type= 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = ' '
let g:airline#extensions#ale#warning_symbol = '  '
let g:airline#extensions#fugitiveline#enabled = 1

" CtrlP Plugin
let g:ctrlp_show_hidden = 1

" JSON syntax plugin
let g:vim_json_syntax_conceal = 0

" Deoplete
let g:deoplete#enable_at_startup = 1

" NERDTree
" Close NERDTree when opening a file
let NERDTreeQuitOnOpen = 1
" When deleting a file with NERDTree also delete the buffer in vim
let NERDTreeAutoDeleteBuffer = 1
" Use CTRL-t to toggle NERDTree
map <C-t> :NERDTreeToggle<CR>
" Open NERDTree automatically if vim is started with no arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif
" Open NERDTree automatically if vim is opened with a path which is a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Automatically quit vim if the last tab open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
