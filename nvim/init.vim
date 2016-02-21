set nocompatible
set t_Co=16

" plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'rking/ag.vim'
Plug 'chrisbra/csv.vim'
Plug 'KabbAmine/zeavim.vim'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

call plug#end()

" set leader to comma
let mapleader = ","

" color
set background=light
colorscheme solarized

" ui
set number
set cursorline
set colorcolumn=80

" indention
function! Indention(width)
    let &l:tabstop = a:width
    let &l:softtabstop = a:width
    let &l:shiftwidth = a:width
endfunction
call Indention(4)

" expand tabs
set expandtab

" make uses real tabs
au FileType make set noexpandtab

" disable code folding
set nofoldenable

" search related settings
set hlsearch
set ignorecase
set smartcase
nnoremap <silent> <leader>l :noh<CR>

" split
set splitbelow
set splitright

" allow hidden
set hidden

" suffixes that get lower priority when doing tab completion for filenames
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg

" enable spell check, textwidth and format paragraph shortcut
autocmd FileType text,markdown,gitcommit setlocal spell
autocmd FileType text,markdown,gitcommit setlocal textwidth=79
autocmd FileType text,markdown,gitcommit noremap <F2> gwap

" use 2 spaces in markdown
autocmd FileType markdown,html call Indention(2)

" *.dsl files are groovy
autocmd BufRead,BufNewFile *.dsl set filetype=groovy

" backup, swap and undo
if !isdirectory($HOME.'/.config/nvim/swap')
    call mkdir($HOME.'/.config/nvim/swap', 'p')
    call mkdir($HOME.'/.config/nvim/backup', 'p')
    call mkdir($HOME.'/.config/nvim/undo', 'p')
endif
set directory=~/.config/nvim/swap/
set backupdir=~/.config/nvim/backup/
set undofile
set undodir=~/.config/nvim/undo

"" plugin config

" airline
let g:airline_powerline_fonts = 1

" better whitespace
let g:strip_whitespace_on_save = 1

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "active_filetypes": [],
        \ "passive_filetypes": ["java"] }

" ultisnips
let g:UltiSnipsExpandTrigger="<C-k>"
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"

" nerdtree
noremap <F9> :NERDTreeToggle<CR>

" you complete me
let g:ycm_rust_src_path = '/usr/src/rust/src'
nnoremap <Leader>] :YcmCompleter GoTo<CR>
