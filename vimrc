if has('python3')
  silent! python3 1
endif

set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set tags=tags;/
set lazyredraw

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Keep Plugin commands between vundle#begin/end.
" General Plugins
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/Syntastic'
Plugin 'godlygeek/tabular'
Plugin 'tomtom/tcomment_vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'Lokaltog/vim-powerline'
Plugin 'christoomey/vim-tmux-navigator'

" Markdown Plugins
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'gabrielelana/vim-markdown'

" Go Plugins
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'SirVer/ultisnips'
Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Kotlin plugins
Plugin 'udalov/kotlin-vim'

" React plugins
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'mattn/webapi-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mattn/emmet-vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" Load Plugins from ./vim/bundle and ./vim/plugins
" let g:pathogen_disabled = []
" call add(g:pathogen_disabled, 'tabular')
" call add(g:pathogen_disabled, 'syntastic')
" call add(g:pathogen_disabled, 'vim-markdown')
execute pathogen#infect()


" Homemade Shortcuts
map <leader>l :e #<CR>
" add a require 'pry' and binding.pry at current cursor location
map <leader>bp :s/\(^.*\n\)/require 'pry'\rbinding.pry\r\1/g<cr>:noh<cr>3k==2.2j
" clean up require 'pry' and binding.pry in file mapped to undo-binding-pry ubp
map <leader>ubp :g/require 'pry'\_s\+binding.pry\_s\+/,+1d<cr>
" add a require 'remote-pry' and binding.pry at current cursor location
map <leader>rbp :s/\(^.*\n\)/require 'pry-remote'\rbinding.remote_pry\r\1/g<cr>:noh<cr>3k==2.2j
" clean up require 'pry' and binding.pry in file mapped to undo-binding-pry ubp
map <leader>urbp :g/require 'pry-remote'\_s\+binding.remote_pry\_s\+/,+1d<cr>
" search for word under cursor with Silver Searcher
map <leader>sw :Ack --smart-case -w <C-r>=expand('<cword>')<CR>
" search for word under cursor with Silver Searcher (Ruby)
map <leader>swr :Ack --smart-case --ruby -w <C-r>=expand('<cword>')<CR>
" replace word under cusor
map <Leader>r :%s/\<<C-r><C-w>\>/
" paste contents from clipboard
map <leader>p :r !pbpaste<CR><CR>
" copy current line to clipboard
map <leader>c :.w !pbcopy<CR><CR>
" copy selected/highlighted lines to clipboard
vmap <leader>c :w !pbcopy<CR><CR>
" clear highlighting with space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" toggle NERDTree
map <leader>] :NERDTreeToggle<cr>
" toggle foldlevel
map <leader>1 :set foldlevel=1<cr>
map <leader>2 :set foldlevel=2<cr>
map <leader>3 :set foldlevel=3<cr>
map <leader>3 :set foldlevel=3<cr>
map <leader>4 :set foldlevel=4<cr>
map <leader>5 :set foldlevel=5<cr>
map <leader>0 :set foldlevel=20<cr>
" spell check on
map <leader>sp :setlocal spell spelllang=en_us<CR>
" spell check off
map <leader>usp :set nospell<CR>
" zg = add good word
" z= = suggest correction
" zw = add bad word
" Tabulariz only the first instance of :
map <leader>-: :Tabularize /^[^:]*:\zs<cr>
map <leader>-= :Tabularize /^[^=]*<cr>
map <leader>-, :Tabularize /^[^,]*,\zs<cr>
if &diff
  " vimdiff shortcuts
  map <leader><left> :diffget LOCAL <bar> :diffu<cr>
  map <leader><right> :diffget REMOTE <bar> :diffu<cr>
  map <leader><up><up> :diffget BASE <bar> :diffu<cr>
  map <leader><up> [c
  map <leader><down> ]c
  map <leader>do :diffoff<cr>
  map <leader>dt :diffthis<cr>
else
  " spellcheck navigation
  map <leader><up> [s
  map <leader><down> ]s
endif

" rspec shortcuts
" run current rspec file
map <leader>t :wa<cr>:!bundle exec rspec %:p<CR>
" run current rspec file from current line
map <leader>tr :wa<cr>:call RunSpecAtLine("!bundle exec rspec -fd ")<CR>
" run current rspec file
map <leader>st :wa<cr>:call RunSpecForFile("!script/test ")<CR>
" run current rspec file from current line
map <leader>str :wa<cr>:call RunSpecAtLine("!script/test ")<CR>
" builds rspec command from current line
function! RunSpecAtLine(specCommand)
  let currentFile = @%
  execute a:specCommand . currentFile . ":" . line(".")
endfunction

function! RunSpecForFile(specCommand)
  let currentFile = @%
  execute a:specCommand . currentFile
endfunction

" remove trailing white space before save
autocmd BufWritePre * :%s/\s\+$//e

syntax on

"" Rubocop Settings
let g:vimrubocop_config = '/Users/rebeccachapin/HealthBase/.rubocop.yml'
let g:vimrubocop_keymap = 0

"" Spellchecker (becuase me flail ingrish)
"set spell spelllang=en_us

"" Autoswitch abs/rel number scheme
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

"" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntastic Preferences
" let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list       = 1
let g:syntastic_check_on_open       = 0
let g:syntastic_check_on_wq         = 1
let g:syntastic_ruby_checkers       = ['rubocop']
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:syntastic_loc_list_height     = 2
let g:syntastic_auto_loc_list       = 0
let g:syntastic_error_symbol        = "✗"
let g:syntastic_warning_symbol      = "⚠"

" Tsuquyomi preferences
let g:tsuquyomi_disable_quickfix = 1

" vim-go Preferences
let g:go_highlight_functions  = 1
let g:go_highlight_methods    = 1
let g:go_highlight_types      = 1
let g:go_fmt_command = "goimports"

" Vim-Markdown preferences
let markdown_enable_spell_checking  = 0
let vim_markdown_preview_github     = 1
let vim_markdown_preview_browser    = 'Google Chrome'
" let vim_markdown_preview_hotkey     = '<C-m>'
let vim_markdown_preview_toggle     = 1

" Vim Prettier
nmap <Leader>pr <Plug>(Prettier)
let g:prettier#autoformat = 0
let g:prettier#config#print_width = 100
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'false'
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

" React preferences
hi tsxTagName guifg=#E06C75
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575
hi tsxAttrib guifg=#F8BD7F cterm=italic
hi tsxTypeBraces guifg=#999999
hi tsxTypes guifg=#666666

let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" My preferences
colorscheme lucius
set relativenumber
set tabstop=2
set expandtab
set shiftwidth=2
set hlsearch
set backspace=2
set foldmethod=indent
set foldlevel=20
set nowrap

" color column settings
highlight ColorColumn ctermbg=235
let &colorcolumn="81,".join(range(101,999),",")

" Settings for vim-indent-guides
let g:indent_guides_auto_colors            = 0
let g:indent_guides_start_levl             = 3
let g:indent_guides_guide_size             = 2
let g:indent_guides_enable_on_vim_startup  = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd    ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven   ctermbg=235

" Powerline
set t_Co=256
let g:Powerline_symbols = "fancy"

" ctrlp (fuzzy find)
let g:ctrlp_max_files=0
let g:ctrlp_clear_cache_on_exit = 0

" let NERDTreeShowHidden=1
set term=screen-256color
