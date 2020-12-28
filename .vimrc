set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'tpope/vim-fugitive'
	Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
	Plugin 'google/vim-maktaba'
	Plugin 'google/vim-codefmt'
	Plugin 'google/vim-glaive'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'preservim/nerdtree'
	Plugin 'embark-theme/vim', { 'as': 'embark' }
	Plugin 'morhetz/gruvbox'
	Plugin 'MarcWeber/vim-addon-mw-utils'
	Plugin 'tomtom/tlib_vim'
	Plugin 'garbas/vim-snipmate'
	Plugin 'honza/vim-snippets'
	Plugin 'dense-analysis/ale'
	Plugin 'airblade/vim-gitgutter'
call vundle#end()
filetype plugin indent on
filetype plugin on
call glaive#Install()
set nu
set relativenumber
autocmd VimEnter * NERDTree | wincmd p
autocmd VimEnter * set colorcolumn=80
highlight ColorColumn ctermbg=darkgray
set termguicolors
set list
set lcs=tab:\|-,trail:.
augroup autoformat_settings
	autocmd FileType bzl AutoFormatBuffer buildifier
	autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format-3.9
	autocmd FileType dart AutoFormatBuffer dartfmt
	autocmd FileType go AutoFormatBuffer gofmt
	autocmd FileType gn AutoFormatBuffer gn
	autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
	autocmd FileType java AutoFormatBuffer google-java-format
	autocmd FileType python AutoFormatBuffer autopep8
	autocmd FileType vue AutoFormatBuffer prettier
augroup END
map <F5> :NERDTreeToggle<CR>
nnoremap <F4> :make!<cr>
set nocompatible
set showcmd
let g:gruvbox_italic=1
set background=dark
colorscheme gruvbox
let g:gruvbox_termcolors=256
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }
let &path.="src/include,/usr/include/AL,"
set tabstop=4
let g:ale_lint_on_text_changed = 'always'
let g:ale_c_cc_options = '-std=c11 -Wall -Werror -Wextra -pedantic'
