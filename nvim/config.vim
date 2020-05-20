
let mapleader=" "
set clipboard=unnamed
let $TERM="xterm-24bit"

if has("termguicolors")
  set termguicolors
end

syntax enable
colorscheme night-owl

set showtabline=2
set guicursor=
set dir=~/.vim/swap//
set foldmethod=indent
set foldlevel=2
" set foldcolumn=2
set showmatch           " Show matching brackets.
set cursorline
" set number              " Show the line numbers on the left side.
set number relativenumber
set formatoptions+=o    " Continue comment marker in new lines.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
set softtabstop=2
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
set encoding=utf-8
set autoread
set lazyredraw
" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
set nostartofline       " Do not jump to first character with page commands.
set ignorecase
set smartcase           " ... unless the query has capital letters.
set gdefault
set mouse=nicr
set incsearch
set noshowmode
set splitbelow splitright
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=100
set shortmess+=cI
set signcolumn=yes
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set shell=/bin/zsh

" set file > 10MB has huge file
let g:hugefile_trigger_size = 10
filetype plugin indent on

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd StdinReadPre * let s:std_in=1
autocmd FileType javascript setlocal foldmethod=expr
autocmd FileType javascript setlocal foldexpr=JSFolds()
autocmd BufRead *.md setlocal spell
autocmd BufRead *.markdown setlocal spell
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd FileType javascript nnoremap <buffer> s# :<C-u>silent call SingleToMulti()<CR>
" reload file on change
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
      \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
nnoremap <Leader>c :e %:h/
nnoremap <Leader>mc :nohl<CR>
nnoremap <Leader>! :bd!<CR>
noremap <Leader>y "+y
noremap <Leader>p "+p
nnoremap <S-Tab> :bp<CR>
nnoremap <Tab> :bn<CR>
nnoremap gh :b#<CR>
nnoremap go o<Esc>
nnoremap gO O<Esc>
nnoremap <Leader>\| :stop<CR>
nnoremap Q @@
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

nnoremap <silent> <A-=> :vertical resize +10<CR>
nnoremap <silent> <A--> :vertical resize -10<CR>
nnoremap <silent> <A-+> :resize +10<CR>
nnoremap <silent> <A-_> :resize -10<CR>

nnoremap <Leader>b :<C-u>call gitblame#echo()<CR>

nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" saved macro to replace next space to newline in a line
let @s = "f cl\<CR>\<ESC>l"
nnoremap ! @s

" nnoremap s# ci{<CR><C-R>=split(@@)<CR><ESC>=`[f}gea,<ESC>
command! FJ %!jq .

highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#93a1a1 guibg=#002931
highlight Comment cterm=italic gui=italic guifg=#8187A2
highlight Function cterm=italic gui=italic
highlight FoldColumn guifg=#806e6f
highlight Folded guifg=#806e6f
highlight LineNr guifg=#8187A2
