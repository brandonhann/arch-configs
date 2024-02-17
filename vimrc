set modelines=0
set nocompatible
set backspace=2
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
au BufWrite /private/etc/pw.* set nowritebackup nobackup
let skip_defaults_vim=1
syntax on
filetype on
filetype plugin on
filetype indent on
set number
set cursorline
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set clipboard=unnamedplus
set list
set listchars=tab:>\ ,trail:-,extends:#,nbsp:+
set mouse=a
vnoremap <C-c> "+y

set scrolloff=998
nnoremap <S-Up> k
nnoremap <S-Down> j
inoremap <S-Up> <Esc>k^i
inoremap <S-Down> <Esc>j^

call plug#begin('~/.vim/plugged')
    Plug 'ghifarit52/tokyonight-vim'
    Plug 'preservim/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()

if (has("termguicolors"))
    set termguicolors
endif

colorscheme tokyonight
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:airline_theme = "tokyonight"

autocmd ColorScheme * hi Normal ctermbg=NONE guibg=NONE
autocmd ColorScheme * hi LineNr ctermbg=NONE guibg=NONE
autocmd ColorScheme * hi EndOfBuffer ctermbg=NONE guibg=NONE

map <F3> :NERDTreeToggle<CR>
set background=dark

let g:airline_powerline_fonts = 1
