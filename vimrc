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
call plug#end()

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
nmap gu :action FindUsages<CR>
nmap gb :action Git.Branches<CR>
nmap gc :action GotoClass<CR>
nmap gf :action GotoFile<CR>
"nmap gp :action Git.Pull<CR>
"nmap gP :action Vcs.Push<CR>
"nmap gk :action ChangesView.Commit<CR>
"nmap gs :action FileStructurePopup<CR>
nmap gv :action Vcs.QuickListPopupAction<CR>
"nmap s :action AceJumpAction<CR>
nmap gx :action CloseActiveTab<CR>
"nmap gw :action JumpToLastWindow<CR>
nmap gn :action JumpToNextChange<CR>
nmap gp :action JumptoLastChange<CR>

" Misc
nnoremap ev :vsplit $MYVIMRC<cr>

