set nocompatible
set t_Co=256

"=============Useful Commands ======================
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

"================ Syntax Highlighting ==============
syntax on
colorscheme molokai
"g:molokai_original = 1

filetype on

" ================ Indentation ======================
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set smartindent
set autoindent
set expandtab

set nowrap
set linebreak

set scrolloff=7
set backspace=indent,eol,start
set hidden

set ruler
set nu

set hlsearch
" \C to force case-sensitivity
set ignorecase
set smartcase
" Clear search with F3
nnoremap <F3> :let @/ = ""<CR>

set laststatus=2
set statusline=%#LineNr#\"%t\"\ %h%m%r%=%c,%l/%L\ %P

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

highlight WhitespaceEOL ctermbg=DarkYellow guibg=DarkYellow

if v:version >= 702
  " Whitespace at the end of a line. This little dance suppresses
  " whitespace that has just been typed.
  au BufWinEnter * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)
  au InsertEnter * call matchdelete(w:m1)
  au InsertEnter * let w:m2=matchadd('WhitespaceEOL', '\s\+\%#\@<!$', -1)
  au InsertLeave * call matchdelete(w:m2)
  au InsertLeave * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)
else
  au InsertEnter * syntax match WhitespaceEOL /\s\+\%#\@<!$/
  au InsertLeave * syntax match WhitespaceEOL /\s\+$/
endif

" Delete trailing whitespace
command! Dtws :%s/\s\+$//
" Convert all tabs to four spaces
command! Untab :%s/\t/    /g

au BufRead,BufNewFile *.ll,*.pll set filetype=llvm
au BufRead,BufNewFile *.tpp,*.conf set filetype=cpp

" au FileType cpp,c,tpp,java,sh,pl,php,phtml,asp,xml,javascript set smartindent
autocmd FileType make set noexpandtab
