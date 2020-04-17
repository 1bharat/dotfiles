" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
"
call plug#begin('~/.config/nvim/autoload')

" On-demand loading
" Specify a directory for plugins
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all && source ~/.zshrc' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'andymass/vim-matchup'
Plug 'ntpeters/vim-better-whitespace'
Plug 'udalov/kotlin-vim'
" Plug 'djoshea/vim-autoread'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-hugefile'
Plug 'jesseleite/vim-agriculture'
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'machakann/vim-sandwich'
Plug 'haishanh/night-owl.vim'
Plug 'mcchrish/nnn.vim'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'niklaas/lightline-gitdiff'
Plug 'preservim/nerdtree'
Plug 'itchyny/vim-gitbranch'
Plug 'zivyangll/git-blame.vim'
Plug 'nelstrom/vim-visual-star-search'
Plug 'AndrewRadev/splitjoin.vim'

call plug#end()

source ~/.config/nvim/functions.vim

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

autocmd StdinReadPre * let s:std_in=1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:loaded_matchit = 1

let g:EasyMotion_leader_key = '<Leader>'

" augroup javascript_folding
"     au!
"     au FileType javascript setlocal foldmethod=syntax
" augroup END

" set file > 10MB has huge file
let g:hugefile_trigger_size = 10

set clipboard=unnamed

" let g:fzf_layout = { 'window': 'call FloatingFZF()' }
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6, 'border': 'rounded' }}

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags &'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_preview_window = ''

let g:nnn#layout = { 'window': { 'width': 0.8, 'height': 0.6, 'border': 'rounder', 'highlight': 'Comment' } }

let g:nnn#command = 'nnn -d -e -H'

let $TERM="xterm-24bit"

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
  set termguicolors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" " For Neovim 0.1.3 and 0.1.4
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

""""" enable the theme
syntax enable
set background=dark
colorscheme night-owl
set showtabline=2
let g:lightline = {
\   'colorscheme': 'nightowl',
\   'mode_map': {
\     'n' : 'N',
\     'i' : 'I',
\     'R' : 'R',
\     'v' : 'V',
\     'V' : 'VL',
\     "\<C-v>": 'VB',
\     'c' : 'C',
\     's' : 'S',
\     'S' : 'SL',
\     "\<C-s>": 'SB',
\     't': 'T',
\   },
\   'active': {
\     'left': [ [ 'mode', 'paste' ],
\               [ 'fugitive', 'filename', 'readonly', 'modified' ],
\              [ 'gitdiff' ] ],
\     'right': [ [ 'lineinfo' ],
\              [ 'percent' ] ],
\   },
\   'inactive': {
\     'left': [ [ 'mode', 'paste' ],
\               [ 'fugitive', 'filename', 'readonly', 'modified' ],
\              [ 'gitdiff' ] ],
\     'right': [ [ 'lineinfo' ],
\              [ 'percent' ] ],
\   },
\   'component_function': {
\     'readonly': 'LightlineReadonly',
\     'fugitive': 'LightlineFugitive',
\   },
\   'tabline': {'left': [['buffers']], 'right':[]},
\   'component_expand': {
\     'buffers': 'lightline#bufferline#buffers',
\     'gitdiff': 'lightline#gitdiff#get',
\   },
\   'component_type': {
\     'buffers': 'tabsel',
\     'gitdiff': 'middle',
\   },
\ }

set guicursor=

autocmd BufWritePost,TextChanged,TextChangedI,TermLeave * call lightline#update()

let g:UltiSnipsExpandTrigger="<C-f>"

let mapleader=" "

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
if !&scrolloff
    set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
    set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.

set smartcase           " ... unless the query has capital letters.
set gdefault
set mouse=a
set incsearch
set noshowmode

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100

" don't give |ins-completion-menu| messages.
set shortmess+=cI

" always show signcolumns
set signcolumn=yes

" set wildcharm=<Tab>
" set wildmenu
" set wildmode=full
"
"
"" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

autocmd FileType javascript setlocal foldmethod=expr
autocmd FileType javascript setlocal foldexpr=JSFolds()

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo cain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <Leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <Leader>cm <Plug>(coc-format-selected)
nmap <Leader>cm <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<Leader>aap` for current paragraph
xmap <Leader>a <Plug>(coc-codeaction-selected)
nmap <Leader>a <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <Leader>ac <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <Leader>qf <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-docker',
  \ 'coc-elixir',
  \ 'coc-emmet',
  \ 'coc-eslint',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-markdownlint',
  \ 'coc-pairs',
  \ 'coc-prettier',
  \ 'coc-python',
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-ultisnips',
  \ 'coc-yaml',
  \ ]

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

let g:coc_snippet_next = '<tab>'
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" imap <C-f> <Plug>(coc-snippets-expand)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" " Using CocList
" " Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>h

" autosave on bufferleave
" au BufLeave * silent! wall

filetype plugin indent on

let g:matchup_matchparen_status_offscreen = 0

" Required for operations modifying multiple buffers like rename.
set hidden

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" auto show quickfix window
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

autocmd BufNewFile __Scratchy__ call s:ScratchMarkBuffer()
command! Scratchy call s:ScratchGenerator()

" All mappings
" Manually trigger tag autocomplete
inoremap <silent> <expr> <C-]> utils#manualTagComplete()
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
au FileType fzf tunmap <buffer> <Esc>

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Session config
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_alias = 1

let g:nnn#set_default_mappings = 0

nnoremap <Leader>so :OpenSession<Space>
nnoremap <Leader>ss :SaveSession<Space>
nnoremap <Leader>sd :DeleteSession<CR>
nnoremap <Leader>sc :CloseSession<CR>
nnoremap <Leader>sc :CloseSession<CR>
nnoremap <Leader>sn :SaveSession default<CR> :OpenSession NOTES<CR>

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
nnoremap <Leader>S :Scratchy<CR>
nnoremap <Leader>l :Lines<space>
nnoremap <Leader><Enter> :Buffers<CR>
nnoremap <Leader>f :Rg<CR>
nmap <Leader>\ <Plug>RgRawSearch
nmap <Leader>* <Plug>RgRawWordUnderCursor<CR>
vmap <Leader>* <Plug>RgRawVisualSelection<CR>
nnoremap <Leader>c :e %:h/
nnoremap <Leader>mc :nohl<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <Leader>! :bd!<CR>
noremap <Leader>y "+y
noremap <Leader>p "+p
nnoremap <S-Tab> :bp<CR>
nnoremap <Tab> :bn<CR>
nnoremap <Leader>n :NnnPicker '%:p:h'<CR>
nnoremap <Leader>t :NERDTreeToggle %<CR>
nnoremap Q @q
nnoremap [w :PrevTrailingWhitespace<CR>
nnoremap ]w :NextTrailingWhitespace<CR>
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap Q :norm @q<CR>
" vnoremap <Leader>ms :s/\(^\s*\)\@<!\s/\r/<CR> :nohl<CR>

nnoremap <Leader>gg :call ToggleLazyGit()<CR>
nnoremap <Leader>gb :<C-u>call gitblame#echo()<CR>
nnoremap <Leader>T :call ToggleScratchTerm()<CR>

nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

function! SingleToMulti() abort
    normal! 0f{
    execute "normal! ci{\<CR>\<CR>\<Up>\<C-r>\""
    s/ *$/,
    s/, /,\r
    normal =i{
endfunction
nnoremap s# :<C-u>silent call SingleToMulti()<CR>

com! FJ %!jq .
highlight Sneak guifg=#011627 ctermfg=233 guibg=#ff5874 ctermbg=204 gui=NONE cterm=NONE
highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#93a1a1 guibg=#002931
highlight Comment cterm=italic gui=italic guifg=#8187A2
highlight Function cterm=italic gui=italic
highlight FoldColumn guifg=#806e6f
highlight Folded guifg=#806e6f
highlight LineNr guifg=#8187A2


" reload file on change
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
      \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
