set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'
" Track the engine.
"Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"

" Homemade Shortcuts
" add a require 'pry' and binding.pry at current cursor location
map <leader>bp :s/\(^.*\n\)/require 'pry'\rbinding.pry\r\1/g<cr>:noh<cr>3k==2.2j
" clean up require 'pry' and binding.pry in file mapped to undo-binding-pry ubp
map <leader>ubp :g/require 'pry'\_s\+binding.pry\_s\+/,+1d<cr>
" map Silver Searcher
map <leader>s :Ack --smart-case -w<space>
" search for word under cursor with Silver Searcher
map <leader>a :Ack --smart-case -w <C-r>=expand('<cword>')<CR>
map <Leader>r :%s/\<<C-r><C-w>\>/
" paste contents from clipboard
map <leader>p :r !pbpaste<CR><CR>
" copy current line to clipboard
map <leader>c :.w !pbcopy<CR><CR>
" copy selected/highlighted lines to clipboard
vmap <leader>c :w !pbcopy<CR><CR>
" run current rspec file
map <leader>t :!bundle exec rspec %:p<CR>
map <leader>y :!bundle exec rspec -fd %:p<CR>
" clear highlighting with space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" toggle NERDTree
map <leader>] :NERDTreeToggle<cr>

syntax on

" Load Plugins from ./vim/bundle and ./vim/plugins
execute pathogen#infect()

"" Rubocop Settings
let g:vimrubocop_config = '/Users/rebeccachapin/HealthBase/.rubocop.yml'
let g:vimrubocop_keymap = 0

"" Spellchecker (becuase me flail ingrish)
set spell spelllang=en_us

"" Autoswitch abs/rel number scheme
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

"" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_loc_list_height = 2
let g:syntastic_auto_loc_list = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

" My preferences
colorscheme lucius
set relativenumber
set tabstop=2
set expandtab
set shiftwidth=2
set hlsearch
set backspace=2

" color column settings 
highlight ColorColumn ctermbg=235 
let &colorcolumn="81,".join(range(101,999),",")

" Settings for vim-indent-guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_levl = 3
let g:indent_guides_guide_size = 2
let g:indent_guides_enable_on_vim_startup = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd    ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven   ctermbg=235
