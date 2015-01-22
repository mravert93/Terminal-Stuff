" best to put this on the first line
set nocompatible
set encoding=utf-8

""""""""""""""""""""""""""""""""""""""""""""""""
" Functionality
""""""""""""""""""""""""""""""""""""""""""""""""
" set console title to open file name
set title
" ignore case during searches unless capitals are used
set ignorecase smartcase
" BASH-style tab completion for filenames
set wildmenu wildmode=longest:full
" disables the bell noise and removes any associated delay
set noerrorbells visualbell t_vb=
" allow switching files and buffers without saving
set hidden
" allow backspacing over everything
set backspace=indent,eol,start
" don't put cursor at the start of the line unneccessarily
set nostartofline
" enable folding by indentation level by default
set foldmethod=indent foldminlines=3 foldlevel=99
" automatically insert leading comment characters when pressing <enter> in insert mode
set formatoptions+=r
" don't insert leading comment characters when pressing `o` or `O` in normal mode
set formatoptions-=o
" keep 50 commands in history
set history=50

""""""""""""""""""""""""""""""""""""""""""""""""
" Display
""""""""""""""""""""""""""""""""""""""""""""""""
" show command being entered
set showcmd
" do not wrap long lines of text
set nowrap
" always show cursor
set ruler
" highlight the cursor's line
set cursorline
" highlight the cursor's column
set cursorcolumn
" flash matching bracket on insert
set showmatch
" search as you type
set incsearch
" global search/replace by default
set gdefault
" highlight matched search pattern
set hlsearch
" keep cursor away from vertical edge of terminal
set scrolloff=1
" always display the status bar
set laststatus=2
" use :set list! to toggle visible whitespace on/off
set listchars=tab:\¦.,nbsp:\.,trail:\·,eol:\.,extends:\»,precedes:\«

""""""""""""""""""""""""""""""""""""""""""""""""
" Indenting
""""""""""""""""""""""""""""""""""""""""""""""""
" auto-indent
set noautoindent smartindent
" two-character-wide tabs
set noexpandtab
set tabstop=2
set shiftwidth=2

""""""""""""""""""""""""""""""""""""""""""""""""
" Colours / Styling
""""""""""""""""""""""""""""""""""""""""""""""""
" set background=dark
set background=dark

" syntax highlight shell scripts as per POSIX,
" not the original Bourne shell which very few use
let g:is_posix = 1

" make the completion menus readable
highlight Pmenu ctermfg=0 ctermbg=3
highlight PmenuSel ctermfg=0 ctermbg=7

" flag problematic whitespace (trailing spaces and spaces before tabs)
highlight RedundantSpaces ctermbg=red
match RedundantSpaces /\s\+$\|[^\t]\zs\t\+\|\t\zs \+/ "\zs sets start of match so only tabs highlighted

" highlight TODO notes
highlight Todo ctermfg=darkgrey ctermbg=yellow

""""""""""""""""""""""""""""""""""""""""""""""""
" Macros / Key Bindings
""""""""""""""""""""""""""""""""""""""""""""""""
" don't move the cursor after pasting
"nnoremap p p`[
"nnoremap P P`[

" Ctrl-{direction} to scroll
" -up
map <C-k> <C-y>
map <C-up> <C-y>
imap <C-up> <C-o><C-y>
" -down
map <C-j> <C-e>
map <C-down> <C-e>
imap <C-down> <C-o><C-e>
" -left
map <C-left> 2zh
imap <C-left> <C-o>2zh
" -right
map <C-right> 2zl
imap <C-right> <C-o>2zl

" disable Shift-{up,down}
map <S-k> k
map <S-up> <up>
imap <S-up> <up>
" -down
map <S-j> j
map <S-down> <down>
imap <S-down> <down>

" Shift-{left,right} moves by WORDS
map <S-left> B
imap <S-left> <C-o>B
" -down
map <S-right> W
imap <S-right> <C-o>W

" {k,j,up,down} go up and down visually
"map k gk
"map j gj
"map <up> gk
"map <down> gj
map k <C-up>
map j <C-down>

" <return> controls folds
map <return> za
map <S-return> zA
map <C-return> zR
map <C-A-return> zM

" Undo/redo using Alt-{left,right}
nmap <A-left> u
nmap <A-right> <C-r>

" Ctrl-page{up,down} navigates open files
nmap <C-pageup> :bN<return>
nmap <C-pagedown> :bn<return>
imap <C-pageup> <esc>:bN<return>
imap <C-pagedown> <esc>:bn<return>

" <home> toggles between start of line and start of text
imap <khome> <home>
nmap <khome> <home>

" <tab> indents in visual mode
vmap <tab> >
vmap <s-tab> <
" <tab><tab> indents without visual selection
nmap <tab><tab> >>
nmap <s-tab><s-tab> <<

" bring back Q: format paragraph containing cursor
nnoremap Q gwap
" Q for visual mode, too
vnoremap Q gw

" typos
cnoreabbr W w
cnoreabbr Wq wq

" Some key bindings from other editors
nmap <c-d> yyp`[
vmap <c-d> y[p
"nmap <c-l> dd
nmap <c-s> :update<return>
"nmap <c-w> :q<return>
nmap <c-q> :qa<return>

nnoremap <space> :nohlsearch<return>

" :clean to remove trailing whitespace
cnoreabbrev clean %s/\s\+$//
" :format to auto-format
cnoreabbrev format %s/[\r \t]\+$//<return>:%s/\([\r\n]\)[\r\n]\+/\1\1/<return>:nohlsearch<return>m'ggVG=`'

" <leader> is the user modifier key (like g is the vim modifier key)
" <leader> can be changed from the default of \ using: let mapleader = ","

" \l to toggle visible whitespace
nmap <silent> <leader>l :set list!<return>

" \<space> and \<tab> to toggle between leading spaces and tabs respectively
nmap <silent> <leader><space> :set expandtab tabstop=2 softtabstop=2 shiftwidth=2<return>
nmap <silent> <leader><tab> :set noexpandtab tabstop=2 softtabstop=2 shiftwidth=2<return>

