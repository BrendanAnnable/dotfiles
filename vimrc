" Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tikhomirov/vim-glsl'
Plug 'othree/yajs.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jdkanani/vim-material-theme'
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
Plug 'scrooloose/nerdtree'
Plug 'pelodelfuego/vim-swoop'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'blueshirts/darcula'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'leafgarland/typescript-vim'
call plug#end()

let mapleader=" "

" Standard settings
set ignorecase
set smartcase
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set clipboard=unnamed
set gdefault
set visualbell
set noerrorbells
set wrapscan
set relativenumber
set number
set laststatus=2
" Enable mouse in normal mode
set mouse=n
set colorcolumn=100
set incsearch
set spell spelllang=en_gb

syntax enable
colorscheme material-theme
" colorscheme solarized8_dark
" colorscheme darcula
set background=dark
if has("nvim")
  set termguicolors
  " https://neovim.io/doc/user/nvim_terminal_emulator.html
  :tnoremap <Esc> <C-\><C-n>
endif


" Keymaps
" noremap <Space> @q
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" IntelliJ
nmap <Leader>u :action FindUsages<CR>
nmap <Leader>b :action Git.Branches<CR>
nmap <Leader>c :action GotoClass<CR>
nmap <Leader>n :action GotoFile<CR>
nmap <Leader>p :action RecentFiles<CR>
nmap <Leader>e :action GotoNextError<CR>
nmap gi :action GotoImplementation<CR>
nmap gs :action GotoSuperMethod<CR>
nmap ge :action GotoNextError<CR>
"nmap <Leader><Space> :action RecentFiles<CR>
"nmap <Leader>p :action Git.Pull<CR>
"nmap <Leader>P :action Vcs.Push<CR>
"nmap <Leader>k :action ChangesView.Commit<CR>
nmap <Leader>s :action FileStructurePopup<CR>
nmap <Leader>v :action Vcs.QuickListPopupAction<CR>
nmap <silent> <Leader>g :Goyo<CR>
"nmap s :action AceJumpAction<CR>
"nmap <Leader>x :action CloseActiveTab<CR>
"nmap <Leader>w :action JumpToLastWindow<CR>

nmap <Leader>j :action JumpToNextChange<CR>
nmap <Leader>k :action JumptoLastChange<CR>

nmap <Leader>d :NERDTreeToggle<CR>
nmap <Leader>g :NERDTreeFind<CR>
nmap <Leader>h :bprevious<CR>
nmap <Leader>T :bprevious<CR>
nmap <Leader>l :bnext<CR>
nmap <Leader>t :bnext<CR>
nmap <Leader>w <C-w>
nmap <Leader>l :call Swoop()<CR>
vmap <Leader>l :call SwoopSelection()<CR>
nmap <Leader><Space> :FZF<CR>
" nmap <Leader>tm :terminal<CR>
"
" https://github.com/wesQ3/vim-windowswap
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>wy :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>wp :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>

" Misc
nnoremap <Leader>ev :vsplit $MYVIMRC<cr>

" Enable airline buffer tabs
let g:airline#extensions#tabline#enabled = 1

" http://stackoverflow.com/a/36896481/868679
let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s']

filetype on
au BufNewFile,BufRead *.es6 set filetype=JavaScript

" http://stackoverflow.com/a/22676189/868679
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif
