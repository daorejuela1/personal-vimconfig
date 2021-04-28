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
	Plugin 'honza/vim-snippets'
	Plugin 'dense-analysis/ale'
	Plugin 'airblade/vim-gitgutter'
	Plugin 'Yggdroot/indentLine'
	Plugin 'prettier/vim-prettier'
	Plugin 'tpope/vim-endwise'
	Plugin 'tpope/vim-surround'
	Plugin 'tpope/vim-dispatch'
	Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plugin 'junegunn/fzf.vim'
	Plugin 'christoomey/vim-tmux-navigator'
	Plugin 'mattn/emmet-vim'
	Plugin 'jiangmiao/auto-pairs'
	Plugin 'tpope/vim-commentary'
	Plugin 'ycm-core/YouCompleteMe'
	Plugin 'tpope/vim-rails'
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
let g:ale_lint_on_text_changed = 'always'
let g:ale_c_cc_options = '-std=c11 -Wall -Werror -Wextra -pedantic'
let g:ale_ruby_rubocop_executable = 'bin/rubocop'
let g:ruby_indent_assignment_style = 'variable'
set tabstop=4
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2

autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2
" vim-ruby
let g:ruby_indent_access_modifier_style = 'normal'
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_indent_block_style = 'do'
let g:fzf_action = {
  \ 'ctrl-m': 'tabedit',
  \ 'ctrl-o': 'e',
  \ 'ctrl-t': 'tabedit',
  \ 'ctrl-x':  'botright split',
  \ 'ctrl-i':  'vertical botright split' }
:nnoremap <C-s> :Files<CR>

let g:ale_linters = {
      \   'ruby': ['rubocop', 'ruby'],
      \   'python': ['flake8', 'pylint'],
      \   'javascript': ['eslint'],
      \}

let g:ale_fixers = {
      \    'ruby': ['standardrb'],
      \}
let g:ale_fix_on_save = 1

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? ' all good ' : printf(
        \   ' %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
nnoremap <F2> :set paste<CR>
nnoremap <F3> :set nopaste<CR>

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}
