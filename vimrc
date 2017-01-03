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
set background=dark

syntax enable
colorscheme material-theme

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
nmap <Leader><Space> :action RecentFiles<CR>
"nmap <Leader>p :action Git.Pull<CR>
"nmap <Leader>P :action Vcs.Push<CR>
"nmap <Leader>k :action ChangesView.Commit<CR>
nmap <Leader>s :action FileStructurePopup<CR>
nmap <Leader>v :action Vcs.QuickListPopupAction<CR>
nmap <silent> <Leader>g :Goyo<CR>
"nmap s :action AceJumpAction<CR>
"nmap <Leader>x :action CloseActiveTab<CR>
"nmap <Leader>w :action JumpToLastWindow<CR>
"nmap <Leader>n :action JumpToNextChange<CR>
"nmap <Leader>c :action JumptoLastChange<CR>

" Misc
nnoremap ev :vsplit $MYVIMRC<cr>


" Enable airline buffer tabs
let g:airline#extensions#tabline#enabled = 1
