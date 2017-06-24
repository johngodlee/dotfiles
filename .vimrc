set nocompatible		" be iMproved, required
filetype off			" required

" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()		" required

" PLUGINS/
Plugin 'VundleVim/Vundle.vim'	" required
Plugin 'scrooloose/nerdtree'	" File browsing 
Plugin 'Xuyuanp/nerdtree-git-plugin'	" Git status flags for NERDTree
Plugin 'plasticboy/vim-markdown'	" Better markdown syntax highlighting, indenting etc.
Plugin 'itchyny/lightline.vim'	" Status bar
Plugin 'kien/ctrlp.vim'		" Fuzzy file finder
Plugin 'pangloss/vim-javascript'	" Javascript syntax highlighting
Plugin 'junegunn/goyo.vim'	" Toggle minimal writing environment
Plugin 'kshenoy/vim-signature'	" Mark locations in gutter
Plugin 'tpope/vim-fugitive'	" Run git commands without `:!git	 Allow git branch in lightline
Plugin 'Valloric/MatchTagAlways'	" Highlight opposite html tag
Plugin 'christoomey/vim-tmux-navigator'	" Easy navigation of tmux and vim splits
Plugin 'itchyny/calendar.vim'	" Interact with google calendar using vim
Plugin 'lervag/vimtex'		" LaTeX editing in vim
" /PLUGINS
call vundle#end()		" required
filetype plugin indent on	" required

" vundle help `:h vundle`
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" Start vim with NERDtree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree
noremap <Leader>n :NERDTreeToggle<CR>

" Focus NERDTree and autorefresh
map <Leader>f :NERDTreeFocus<CR>R<c-w>

" Hide NERDTree bookmarks by default
let NERDTreeShowBookmarks=0

" Focus current file 
noremap <leader>c :NERDTreeFind<CR>

" Ignore useless files 
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

" Use custom symbols on NERDTree-Git-Plugin
let g:NERDTreeIndicatorMapCustom = {
	\ "Modified"  : "✹",
	\ "Staged"    : "✚",
	\ "Untracked" : "✭",
	\ "Renamed"   : "➜",
	\ "Unmerged"  : "═",
	\ "Deleted"   : "✖",
	\ "Dirty"     : "✗",
	\ "Clean"     : "✔︎",
	\ 'Ignored'   : '☒',
	\ "Unknown"   : "?"
	\ }

" lightline, add whether file is modified and the current git branch
let g:lightline = {
      \ 'colorscheme': 'powerline', 
      \ 'active': {
      \   'left': [ [ 'mode'],
      \             [ 'fugitive', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ }}

" statusline always showing, even when NERDTree is hidden
set laststatus=2

" enable syntax highlighting
syntax on

" Open vim in Notes folder
cd ~/Google_Drive/Notes

" Set mouse mode on
set mouse=n

" Remove ugly vertlines in split bar (Note space after `\ `)
set fillchars+=vert:\    

" Stop creating swp and ~ files
set nobackup
set noswapfile

" enable line numbers
set number

" Ignore case of searches
set ignorecase

" Don’t reset cursor to start of line when moving around
set nostartofline

" Preserve indentation on wrapped lines
set breakindent

" map `A` (append at end of line) to `a` (append in place)
nnoremap a A

" Move by visual lines rather than actual lines with k,j
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Resize splits more conveniently using the leader key
nnoremap <Leader>j <C-W>+
nnoremap <Leader>k <C-W>-
nnoremap <Leader>l <C-W><
nnoremap <Leader>h <C-W>>

" Easier save and quit with ;
noremap ;w :w<CR>
noremap ;q :q<CR>
" Change default goyo width
let g:goyo_width = 150

" Disable folding in markdown
let g:vim_markdown_folding_disabled = 1

" Disable syntax conceal in markdown
let g:vim_markdown_conceal = 0

" Normal backspace behaviour on OSX
set backspace=2

" Select current buffer in finder
nnoremap <Leader>o :!open -R %<CR> 

" Copy and paste from `+` register for interacting with mac clipboard
vnoremap y "+y 
vnoremap p "+p
nnoremap p "+gp
vnoremap d "+d
nnoremap dd "+dd

" Use google calendar on calendar.vim
let g:calendar_google_calendar = 1

" Always think tex files are latex - Also see latexmkrc in ~ (Root)
let g:tex_flavor = 'xelatex'

" When running vimtex compiler, don't automatically show quickfix list errors
let g:vimtex_quickfix_mode = 0




