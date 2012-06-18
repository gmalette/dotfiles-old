"pathogen
call pathogen#runtime_append_all_bundles()
filetype off
syntax on
filetype plugin indent on

"soft tabs
set shiftwidth=2
set tabstop=2
set expandtab

autocmd FileType php set tabstop=4|set shiftwidth=4|set noexpandtab

"shift+tab to unindent
imap <S-Tab> <C-o><<

map <D-1> :tabn 1<CR>
map <D-2> :tabn 2<CR>
map <D-3> :tabn 3<CR>
map <D-4> :tabn 4<CR>
map <D-5> :tabn 5<CR>
map <D-6> :tabn 6<CR>
map <D-7> :tabn 7<CR>
map <D-8> :tabn 8<CR>
map <D-9> :tabn 9<CR>
map <D-0> :tabnew<CR>

"set hidden        " hide buffers instead of closing them

set nowrap        " don't wrap lines
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

" theme
set t_Co=256
colorscheme mustang
syntax on

" highlight whitespaces
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Safe paste
set pastetoggle=<F2>

" disable highlight for html,xml files
autocmd filetype html,xml set listchars-=tab:>.
autocmd BufNewFile,BufRead Gemfile set filetype=ruby

" automatically cd to current buff dir
au   BufEnter *   execute ":lcd " . expand("%:p:h")

" disable arrows navigation in insert mode
map <Left>  <NOP>
map <Right> <NOP>
map <Up>    <NOP>
map <Down>  <NOP>

" highlight current line
set cursorline
hi CursorLine term=none cterm=none

" highlight search terms
set hlsearch
hi Search guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline

" Clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>
