""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GENERAL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ensure we are not running in Vi mode and are therefore improved
set nocompatible

" Display line numbers
set number

" Ignore the case of searches unless we use capitals
set ignorecase
set smartcase

" Search highlighting
set hlsearch

" Set the current line to be highlighted
set cursorline

" Set line numbers to be relative to the current one
set number relativenumber

" Set to always use 4 spaces as a tab as well as indent size
set tabstop=4
set shiftwidth=0

" Ignore text wrapping
" set tw=79

" Enable syntax highlighting
syntax enable

" Make sure the backspace key works in Insert Mode to delete text
set backspace=indent,eol,start

" Sensible split options
set splitright
set splitbelow

if has('termguicolors')
	set termguicolors
endif

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => KEYBINDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set the leader character to ' '
let mapleader = " "

" Disable the arrow keys
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Down> <Nop>
noremap <Up> <Nop>

" Disable the original advanced movement
noremap $ <Nop>
noremap ^ <Nop>
noremap { <Nop>
noremap } <Nop>

" Allow advanced movement
noremap K {
noremap J }
noremap H ^
noremap L $

" Disable the usual shift operators
nnoremap >> <Nop>
nnoremap << <Nop>
vnoremap >> <Nop>
vnoremap << <Nop>

" Replace the usual shifts with updated ones
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <Tab>   >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv

" Disable the escape key and rebind <Esc> to an easier keystroke
inoremap <Esc> <Nop>
inoremap zj <Esc>

" Binds for moving lines up and down
noremap - ddp
noremap _ ddkkp

" Allows switching between windows easily
noremap <F1> <C-w>h
noremap <F2> <C-w>l

" Enable zz in Insert Mode to do the same as zz in Normal Mode
inoremap zz <Esc>zza

" Remap <Space> to repeat the last macro
nnoremap <Space> @q

" Allow the | character to be used to join lines together
nnoremap <Bar> J

" Enable a quick way to remove trailing whitespace in a file
nnoremap <Leader><BS> :%s/\s\+$//e <bar> noh<CR>

" Enable a quick way to find and replace the word under the cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" Enable some binds for quick access to editing and sourcing this file
nnoremap <Leader><F5> :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader><F6> :vsplit ~/.config/nvim/init.vim<CR>

" Allow a visually selected buffer to be searched for with //
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

" Allow a visually selected buffer to be replaced easily
vnoremap <Leader>s "hy:%s/<C-r>h//g<Left><Left>

" Allow for easier management of the system clipboard
vnoremap <Leader>y "*y
vnoremap <Leader>Y "*Y
vnoremap <Leader>d "*d
vnoremap <Leader>D "*D
nnoremap <Leader>p "*p
nnoremap <Leader>P "*P

" Allow a file to be saved more easily
nnoremap <Leader>w :w<CR>
" Allow a file to be quit more easily
nnoremap <Leader>q :q<CR>
" Allow a file to be reloaded more easily
nnoremap <Leader>e :e<CR>zz

" Allow projects to be built and run more easily
nnoremap <Leader>m :make<CR>
nnoremap <Leader>r :make run<CR>

" Allow the fuzzy finder to be opened more easily
nnoremap <Leader>f :Files<CR>

" Allow newlines to be added more easily
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" Prevent the q: menu from coming up (previous command history)
noremap q: :q

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => COMMANDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Allow W, Q, Wq and WQ to work as if they were lowercase
command! W w
command! Q q
command! Wq wq
command! WQ wq

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin(stdpath('data') . '/plugged')

" Enables the :A command for swapping between .c(pp) and .h(pp) files
Plug 'vim-scripts/a.vim'
" Enables the bar at the bottom of the window
Plug 'bling/vim-airline'
" Installs fzf and the Vim extension for it to find files easily
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Enables automatic pairing of ", ' (, { and [
Plug 'jiangmiao/auto-pairs'
" Rust language support
Plug 'rust-lang/rust.vim'
" Run Black when saving Python files
Plug 'psf/black', { 'branch': 'stable' }
" Language server support
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()

call plug#begin(stdpath('config') . '/colors')

" Hybrid color scheme
Plug 'w0ng/vim-hybrid', { 'as': 'hybrid' }

call plug#end()

" Ensure dark background and set the colorscheme to Hybrid post-install
set background=dark
colorscheme hybrid

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGIN SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Run rustfmt when I save a file
let g:rustfmt_autosave = 1

" Suppress Black output unless there was an error
let g:black_quiet = 1

" Fix the column on the left for diagnostics
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
							\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

let g:zenmode_background = "dark"
let g:zenmode_colorscheme = "hybrid"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FUNCTIONS AND CONDITIONALS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make Vim return to the line we left on when entering a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
				\| exe "normal! g'\"" | endif
endif

" Allow Vim to jump to a definition when we press the * key on a word
fun! JumpToDef()
	if exists("*GotoDefinition_" . &filetype)
		call GotoDefinition_{&filetype}()
	else
		exe "norm! \<C-]>"
	endif
endf

" Set line numbers to be non-relative when in insert mode
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FILETYPE SPECIFIC COMMANDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup lalrpop
	au!
	autocmd BufNewFile,BufRead *.lalrpop set syntax=rust
augroup END

augroup tsx
	au!
	autocmd BufNewFile,BufRead *.tsx set syntax=typescript
augroup END

augroup tex
	au!
	autocmd BufNewFile,BufRead *.tex set filetype=tex
augroup END

augroup tera
	au!
	autocmd BufNewFile,BufRead *.tera set filetype=html
augroup END

" Markdown commands for making notes in lectures
" autocmd Filetype markdown inoremap <buffer> <C-Tab> <Esc><<A
" autocmd Filetype markdown inoremap <buffer> <C-S-Tab> <Esc>>>A
" autocmd Filetype markdown inoremap <buffer> <F12> <Esc>o<Esc>o<Esc>z<CR>isec
" autocmd Filetype markdown nnoremap <buffer> <F12> o<Esc>o<Esc>z<CR>isec
autocmd Filetype markdown inoremap <buffer> § <Space><Esc>>>A<BS>
autocmd Filetype markdown inoremap <buffer> <Leader>§ <Space><Esc><<A<BS>
autocmd Filetype markdown colorscheme hybrid
" TODO: This could be improved by just making it execute on <F5> "
" autocmd BufWritePost *.md silent! !/Users/alexander/.config/pandoc/compile.sh <afile>

" Python command for easily displaying the value of a variable
autocmd Filetype python vnoremap pv yoprint("<Esc>pA: {}".format(<Esc>pA))<Esc>
autocmd BufWritePre *.py execute ':Black'

" Rust command for easily displaying the value of a variable
autocmd Filetype rust vnoremap pv yodbg!(&<Esc>pA);<Esc>
" Rust command for checking the current project using Cargo
autocmd Filetype rust nnoremap <F5> :!cargo c<CR>

" Java command for easily displaying the value of a variable
autocmd Filetype java vnoremap pv yopl<Tab>String.format("<Esc>pA: ", <Esc>pA)

" JavaCC command for easily displaying the value of a variable
autocmd Filetype javacc vnoremap pv yoSystem.out.println(String.format("<Esc>pA: ", <Esc>pA));<Esc>0f:la

" C command for easily displaying the value of a variable
autocmd Filetype c vnoremap pv yoprintf("<Esc>pA: \n", <Esc>pA);<Esc>0f:la
" C command for building the current project using make
autocmd Filetype c nnoremap <F5> :make<CR>

" C++ command for easily displaying the value of a variable
autocmd Filetype cpp vnoremap pv yostd::cout << "<Esc>pA: " << <Esc>pA << std::endl;<Esc>
" C++ command for building the current project using make
autocmd Filetype cpp nnoremap <F5> :make<CR>

" JavaScript command for easily displaying the value of a variable
autocmd Filetype javascript vnoremap pv yoconsole.log("<Esc>pA: " + <Esc>pA);<Esc>

autocmd Filetype tex inoremap \` \texttt{}<Esc>i
autocmd Filetype tex set tw=79

autocmd Filetype csv set tw=0

set shell=/bin/bash

function! Display()
	silent !ptc %:p
	let filename = expand("%:r") . ".c"
	execute "vsplit" filename
endfunction
