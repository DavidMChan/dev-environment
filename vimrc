set nocompatible
filetype off

" Vundle Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'w0rp/ale'
Plugin 'davidhalter/jedi-vim'
Plugin 'nvie/vim-flake8'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'dracula/vim'
Plugin 'rmrao/python-syntax'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Konfekt/FastFold'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()

" Change python indentation to better match PEP8
let g:pyindent_open_paren = '&sw'
let g:pyindent_nested_paren = '&sw'
let g:pyindent_continue = '&sw'

" Change python syntax highlighting to ignore space errors
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0

" Tell airline about the other extensions being used so it can incorporate
" them
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" ALE settings
let g:ale_linters_explicit = 1
let g:ale_echo_msg_format = '[%linter%% - code%] %s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" Disable most of Jedi so you only get the call signatures
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#goto_assignments_command = "<leader>pa"
let g:jedi#goto_command = "<leader>pd"
let g:jedi#documentation_command = "<leader>pk"
let g:jedi#usages_command = "<leader>pu"
let g:jedi#rename_command = "<leader>pr"

" YCM settings
let g:ycm_confirm_extra_conf = 0
let g:ycm_always_populate_location_list = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" Navigate buffers with tabs
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>

" Open/close folds with <Space>
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" YCM shortcuts
nnoremap <leader>d :YcmCompleter GoTo<CR>
nnoremap <S-k> :YcmCompleter GetDoc<CR>
nnoremap <Leader>f :YcmCompleter FixIt<CR>

" Vim Settings

set backspace=2
set number
set mouse=a
syntax on
silent! color dracula

set shiftwidth=4
set tabstop=4
set expandtab
set fdm=syntax
set termguicolors
set autoindent
filetype plugin indent on

set background=dark

au BufNewFile,BufRead *.cuh set ft=cuda
au BufEnter *.cc set ft=cpp
au FileType * set fo=tcql
au FileType python setlocal completeopt-=preview
set nofoldenable    " disable folding

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
  endif

