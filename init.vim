" ------------------------
" PLUGINS
" ------------------------
call plug#begin()
Plug 'scrooloose/NERDTree' " NERDTree 

Plug 'lervag/vimtex' " Vimtex
set conceallevel=1 " these two lines sets the \[ \] $ invisible (for writing equations) so that they aren't as obtrusive
let g:tex_conceal='abdmg'

Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } " Telescope/fuzzy-search
Plug 'nvim-lua/plenary.nvim' " Required for telescope/fuzzy-search
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Required for telescope/fuzzy-search
Plug 'https://github.com/tpope/vim-commentary' " Commenting for vim 
Plug 'vim-airline/vim-airline' " vim airline (fancy bar at the bottom)
Plug 'vim-airline/vim-airline-themes' " vim airline themes 
Plug 'https://github.com/neoclide/coc.nvim' " Auto complete

" ------------------------------
"  UltiSnips
"  Soures
"  https://castel.dev/post/lecture-notes-1/ 
"  https://www.ejmastnak.com/tutorials/vim-latex/ultisnips/#getting-started-with-ultisnips
"  https://www.youtube.com/watch?v=RlseJkeVqj4
"  -----------------------------
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=['.config/nvim/UltiSnips', 'UltiSnips']  " using Neovim 

" -------------------------
" COLORSCHEMES 
"  -----------------------
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
" Plug 'rafi/awesome-vim-colorschemes' " Colorschemes 
Plug 'https://github.com/EdenEast/nightfox.nvim' " Nightfox colorscheme 
Plug 'junegunn/seoul256.vim' " Seoul256 colorscheme 
Plug 'https://github.com/Mofiqul/vscode.nvim' " VSCode colorscheme 

call plug#end()

let maplocalleader = " " 
let mapleader = " " 

:set hidden                " When opening new file in current buffer causes file to be hidden instead of closed 
:set number                " Shows line number
:set autoindent            " Allows autoindent
:set smarttab              " Makes tabbing smarter somehow  
:set softtabstop=4         " idk
:set wrap                  " makes it so that the lines appear below when running out of space horizontall on screen
:colorscheme vscode 
:set mouse=a               " allows you to use the cursor 
:set guicursor=i:block     " changes the insert mode cursor to be a block
:set noswapfile            " no more swapfiles
:set noshowmode            " no longer shows what mode you are in (currently doesn't work with vim-airline)
:set tabstop=4             " the number of spaces that you want for the tabs 
:set shiftwidth=4          " idk
:set expandtab             " changes tabs into spaces (not working currently)
:set termguicolors 
:set relativenumber

nnoremap <C-t> :NERDTreeToggle<CR>  
nnoremap <C-z> u<CR>
nnoremap <C-y> <C-R>
inoremap <C-Z> <C-O>u
inoremap <C-Y> <C-O><C-R>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" -------------------------------------------------
" TABS 
" -------------------------------------------------
nnoremap H gT 
nnoremap L gt 
nnoremap T :tabnew<CR>
nnoremap W :q<CR>
nnoremap <C-n> :tabmove -1<CR>
nnoremap <C-m> :tabmove +1<CR>
nnoremap <C-q> :bd<CR>

" -------------------------------------------------
" SPLITS 
" -------------------------------------------------
set splitbelow splitright 

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

" ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

" ----------------------------------------------
"  CoC (Conquer of Completion)
"  ---------------------------------------------
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" -------------------------------------------------
"  vim-airline plugin
"  ------------------------------------------------
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
" set t_Co=256
set noshowmode
set statusline=%{toupper(g:currentmode[mode()])}%{toupper(&spelllang)}\ %{b:gitbranch}%<%F%h%m%r%=%-5.(%l,%c%V%)\ %y

