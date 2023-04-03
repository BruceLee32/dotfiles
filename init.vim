let maplocalleader = " " 
let mapleader = " " 

:set ignorecase
:set smartcase

" ------------------------
"        PLUGINS
" ------------------------
call plug#begin()
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Required for telescope/fuzzy-search
Plug 'https://github.com/tpope/vim-commentary' " Commenting for vim 
Plug 'KeitaNakamura/tex-conceal.vim' " Vimtex text conceal

" -------------------
"    Telescope FZF 
" -------------------
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } " Telescope/fuzzy-search
Plug 'nvim-lua/plenary.nvim' " Required for telescope/fuzzy-search
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" ---------------
"  Vim-surround 
" ---------------
Plug 'tpope/vim-surround'

" ------------
"   NERDTree
" ------------ 
Plug 'scrooloose/NERDTree' " NERDTree 
nnoremap <C-t> :NERDTreeToggle<CR>  

" ----------
"  Harpoon
" ----------
Plug 'ThePrimeagen/harpoon'
nnoremap <leader>a <cmd>lua require("harpoon.mark").add_file()<cr>
nnoremap <leader>e <cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>
nmap <C-k> :lua require("harpoon.ui").nav_next()<CR>
nmap <C-j> :lua require("harpoon.ui").nav_prev()<CR>

" -----------
"   Tagbar
" -----------
Plug 'preservim/tagbar' " Tagbar
nmap <F8> :TagbarToggle<CR>

" -------------------
"  vim-airline 
" -------------------
" Plug 'vim-airline/vim-airline' " vim airline (fancy bar at the bottom)
" Plug 'vim-airline/vim-airline-themes' " vim airline themes
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
" set t_Co=256
set noshowmode
" set statusline=%{toupper(g:currentmode[mode()])}%{toupper(&spelllang)}\ %{b:gitbranch}%<%F%h%m%r%=%-5.(%l,%c%V%)\ %y

" ------------------------------
"          UltiSnips
"  SOURCES
"      https://castel.dev/post/lecture-notes-1/ 
"      https://www.ejmastnak.com/tutorials/vim-latex/ultisnips/#getting-started-with-ultisnips
"      https://www.youtube.com/watch?v=RlseJkeVqj4
"  -----------------------------
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=['.config/nvim/UltiSnips', 'UltiSnips']  " using Neovim 

" ---------------
"     Vimtex
" ---------------
Plug 'lervag/vimtex' 
set conceallevel=1 " these two lines sets the \[ \] $ invisible (for writing equations) so that they aren't as obtrusive
let g:tex_conceal='abdmg'
let g:vimtex_view_method = 'sioyek'
nnoremap <leader>vv <cmd>VimtexView<cr>

" ---------------
"       CoC 
" ---------------
Plug 'neoclide/coc.nvim' 
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" --------------------
"    Vim auto-save
" --------------------
Plug '907th/vim-auto-save' 
let g:auto_save = 1  " enable AutoSave on Vim startup

" -------------------
"    Colorschemes
" -------------------
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/EdenEast/nightfox.nvim' " Nightfox colorscheme 
Plug 'junegunn/seoul256.vim' " Seoul256 colorscheme 
Plug 'https://github.com/Mofiqul/vscode.nvim' " VSCode colorscheme 
Plug 'Yazeed1s/minimal.nvim' " Minimal colorscheme 
Plug 'sainnhe/everforest' " Everfrost colorscheme 
Plug 'NTBBloodbath/doom-one.nvim' " Doom emacs colorscheme 
Plug 'https://github.com/sainnhe/edge' " Edge colorscheme 
Plug 'projekt0n/github-nvim-theme' " Github colorscheme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' } " Catppuccin colorscheme 
Plug 'rebelot/kanagawa.nvim' " Kanagawa colorscheme
Plug 'ful1e5/onedark.nvim' " One dark
" Plug 'rafi/awesome-vim-colorschemes' " Colorschemes 

call plug#end()

syntax on
:set scrolloff=5
:set hidden                " When opening new file in current buffer causes file to be hidden instead of closed 
:set number                " Shows line number
:set autoindent            " Allows autoindent
:set smarttab              " Makes tabbing smarter somehow  
:set softtabstop=4         " idk
:set wrap                  " makes it so that the lines appear below when running out of space horizontall on screen
:colorscheme doom-one
:set mouse=a               " allows you to use the cursor 
:set guicursor=i:block     " changes the insert mode cursor to be a block
:set noswapfile            " no more swapfiles
:set noshowmode            " no longer shows what mode you are in (currently doesn't work with vim-airline)
:set tabstop=4             " the number of spaces that you want for the tabs 
:set shiftwidth=4          " idk
:set expandtab             " changes tabs into spaces (not working currently)
:set termguicolors 
:set relativenumber

nnoremap <C-z> u<CR>
nnoremap <C-y> <C-R>
inoremap <C-Z> <C-O>u
inoremap <C-Y> <C-O><C-R>

" Zathura
map <Leader>pf :! zathura --mode fullscreen master.pdf<CR>

" Rendering the html in the browser via F12 
nnoremap <F12> :exe ':silent !open -a /Applications/Firefox.app %'<CR> 

" Inkscape Figures 
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/../figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/../figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

" ----------
"    Tabs 
" ----------
nnoremap H gT 
nnoremap L gt 
nnoremap T :tabnew<CR>
nnoremap W :q<CR>
nnoremap <C-n> :tabmove -1<CR>
nnoremap <C-m> :tabmove +1<CR>
nnoremap <C-q> :bd<CR>

" -----------
"   Splits 
" -----------
set splitbelow splitright 

" Bind copy and paste 
nnoremap <C-c> "*y 

" Split keybinds 
map <Leader>vs :vsplit<CR>
map <Leader>hs :split<CR> 

" Remap splits navigation to just CTRL + hjkl 
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k 
nnoremap <C-l> <C-w>l

" Adjust the size the the split
nnoremap <silent> <C-Left> :vertical resize +1<CR>
nnoremap <silent> <C-Right> :vertical resize -1<CR>
nnoremap <silent> <C-Up> :resize +1<CR>
nnoremap <silent> <C-Down> :resize -1<CR>

" Change 2 split windows from vert to horiz or horiz to vert 
map <Leader>th <C-w>t<C-w>H 
map <Leader>tk <C-w>t<C-w>K

" Open terminal in a split 
map <Leader>tt :vnew term://zsh<CR>
