"""""""""""""""
" Set various options
"""""""""""""""
set mouse=a
set nocompatible
set noshowmode
set shell=/usr/local/bin/zsh
set showtabline=2
syntax on
set linebreak
set nolist
" Set the hidden option to enable moving through args and buffers without
" saving them first
set hidden
" Show line numbers by default
set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,CmdwinLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter,CmdwinEnter * set norelativenumber
:augroup END

" Auto indent after a {
set autoindent
set smartindent
" Enable folding by fold markers
set foldmethod=marker
" Autoclose folds, when moving out of them
set foldclose=all
" Use incremental searching
set incsearch
" Jump 5 lines when running out of the screen
set scrolljump=5
" Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=3
" Repair wired terminal/vim settings
set backspace=start,eol,indent
" Allow file inline modelines to provide settings
set modeline
" Toggle paste with <ins>
set pastetoggle=<ins>
" Show large "menu" with auto completion options
set wildmenu
set wildmode=list:longest
set ttyfast
" Save more commands in history
set history=200
set laststatus=2
set encoding=utf-8
" Fugitive vertical splits in diffs
set diffopt+=vertical
set background=dark
" Keep all swapfiles in a central location
set directory^=$HOME/.vim/swapfiles//

""""""""""""""
" tmux fixes "
" """"""""""""""
" Handle tmux $TERM quirks in vim
if $TERM =~ '^screen-256color'
	map <Esc>OH <Home>
	map! <Esc>OH <Home>
	map <Esc>OF <End>
	map! <Esc>OF <End>
endif

""""""""""""""""""""
" Vundle config
" Plugins installed by Vundle
"""""""""""""""""""
" Vundle requires filetype plugin to be off while plugins are loaded
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	" Plugins
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'SirVer/ultisnips'
	Plugin 'tobyS/pdv'
	Plugin 'tobyS/vmustache'
	Plugin 'tobyS/skeletons.vim'
	Plugin 'tpope/vim-fugitive'
	Plugin 'tpope/vim-surround'
	Plugin 'scrooloose/syntastic'
	Plugin 'tpope/vim-unimpaired'
	Plugin 'arnaud-lb/vim-php-namespace'
	Plugin 'stephpy/vim-php-cs-fixer'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	" Syntax highlighting
	Plugin 'puppetlabs/puppet-syntax-vim'
	Plugin 'StanAngeloff/php.vim'
	Plugin 'KohPoll/vim-less'
	Plugin 'vim-ruby/vim-ruby'
	Plugin 'altercation/vim-colors-solarized'
	Plugin 'smerrill/vcl-vim-plugin'
	Plugin 'tmux-plugins/vim-tmux'
	Plugin 'othree/html5-syntax.vim'
	Plugin 'elzr/vim-json.git'
	" Vim-Devicons should be loaded last to avoid issues with
	" otherplugins.
	Plugin 'ryanoasis/vim-devicons'
call vundle#end()

" Use filetype plugins
filetype on
filetype plugin on
filetype indent on

" Colorscheme
colorscheme solarized
call togglebg#map("<F12>")

" Highlight current line in insert mode.
autocmd InsertLeave * set nocursorline
autocmd InsertEnter * set cursorline

" Save files as root
cnoremap w!! w !sudo tee % >/dev/null

" load the man plugin for a nice man viewer
runtime! ftplugin/man.vim

" Use pman for manual pages
setlocal keywordprg=pman

" Use built in matchit plugin
runtime macros/matchit.vim

" Filetype settings
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType twig setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType markdown set spell
autocmd filetype crontab setlocal nobackup nowritebackup
autocmd FileType ruby compiler ruby

au BufRead,BufNewFile *.phps set filetype=php

" Associate .md files with markdown.
au BufRead,BufNewFile *.md set filetype=markdown

" Switch paste mode off whenever insert mode is left
autocmd InsertLeave <buffer> set nopaste

" Reads the skeleton php file
" TODO: How can this be moved out of this file?
" Note: The normal command afterwards deletes an ugly pending line and moves
" the cursor to the middle of the file.
autocmd BufNewFile *.php 0r ~/.vim/skeleton.php | normal Gdda

" Highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" Trims whitespace in a file.
function! TrimWhiteSpace()
	%s/\s\+$//e
endfunction
autocmd BufWritePre *.{php,twig} call TrimWhiteSpace()

" Use python to pretty format json.
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

" Plugin settings " ================================================================================
" Syntastic settings
let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_php_checkers=['php', 'phpmd', 'phpcs']

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
let g:airline#extensions#syntastic#enabled = 1

" JSON syntax plugin
let g:vim_json_syntax_conceal = 0

