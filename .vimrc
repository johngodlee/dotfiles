" A full .vimrc for use within normal vim on macos

" Set folding to markers for .vimrc only 
" vim: foldmethod=marker

" vi compatibility
set nocompatible		

" Vundle {{{

filetype off			" required for Vundle

" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()		" required

Plugin 'VundleVim/Vundle.vim'	" required
Plugin 'scrooloose/nerdtree.git'    " File navigation
Plugin 'plasticboy/vim-markdown'	" Better markdown syntax highlighting, indenting etc.
" Plugin 'itchyny/lightline.vim'	" Status bar - Not needed due to own
" Plugin 'itchyny/vim-gitbranch'	" Git branch in lightline
" Plugin 'kien/ctrlp.vim'		" Fuzzy file finder - using fzf
Plugin 'pangloss/vim-javascript'	" Javascript syntax highlighting
Plugin 'junegunn/goyo.vim'	" Toggle minimal writing environment
Plugin 'kshenoy/vim-signature'	" Mark locations in gutter
Plugin 'christoomey/vim-tmux-navigator'	" Easy navigation of tmux and vim splits
Plugin 'itchyny/calendar.vim'	" Interact with google calendar using vim
Plugin 'lervag/vimtex'		" LaTeX editing in vim
Plugin 'ledger/vim-ledger'	" Edit ledger journals in vim
Plugin 'tpope/vim-commentary'	" Comment out lines with a keymapping
Plugin 'junegunn/vim-easy-align'	" For aligning markdown tables visually
Plugin 'thiagoalessio/rainbow_levels.vim'	" Highlight with indenting
Plugin 'nathanaelkane/vim-indent-guides'	" Indent guides
Plugin 'junegunn/fzf'           " Fuzzy file finder
Plugin 'junegunn/fzf.vim'       " Fuzzy file finder
Plugin 'mechatroner/rainbow_csv'       " Syntax highlighting in csv
Plugin 'SirVer/ultisnips'       " Snippets


call vundle#end()		" required
filetype plugin indent on	" required

" vundle help `:h vundle`
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" }}}

" Keymappings {{{ 

" map `A` (append at end of line) to `a` (append in place)
nnoremap a A

" Move by visual lines rather than actual lines with `k` `j`
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Resize splits more conveniently using the leader key
nnoremap <Leader>h <C-W>>
nnoremap <Leader>j <C-W>+
nnoremap <Leader>k <C-W>-
nnoremap <Leader>l <C-W><

" Change layout of splits
nnoremap <Leader>] <C-w>H
nnoremap <Leader>[ <C-w>J

" Easier save and quit with `;`
noremap ;w :w<CR>
noremap ;q :q<CR>

" Open current buffer in finder with <Leader>o
nnoremap <Leader>f :!open -R %<CR> 

" Copy and paste from `+` register for interacting with mac clipboard
set clipboard=unnamed
vnoremap y "+y 
vnoremap p "+p
nnoremap p "+gp
vnoremap d "+d
nnoremap dd "+dd

" Remap word and space (dw) to delete word (de)
nnoremap dw de
nnoremap de dw

" Open NERDTree 
nnoremap <Leader>n :NERDTreeToggle<CR>

" Focus NERDTree and highlight current file 
noremap <leader>nf :NERDTreeFind<CR>

" Auto current directory when using `:e` with `NERDTreeHijackNetrw`
nnoremap <Leader>e :e<space>.<CR>

" Toggle spellcheck
nnoremap <Leader>s :set spell!<CR>

" Align ledger journal
autocmd FileType ledger nnoremap <Leader>a :%LedgerAlign<CR>

" Better omnicompletion mapping
inoremap <Leader>o <C-x><C-o>

" Align markdown tables only in markdown documents using \\
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" Make terminal source .bash_profile when opening 
nnoremap <Leader>t :terminal<CR>source $HOME/.bash_profile<CR>

" Use fzf to search open buffers
nnoremap <Leader>b :Buffers<CR>

" Use fzf to search files
nnoremap <Leader>o :Files<CR>

" A function to display often misremembered keybindings
fun! Cheat()
    " Add handy bindings you tend to forget or want to learn.
    echo "  ) (      →→  Forwards / backwards one sentence."
    echo "  } {      →→  Forwards / backwards one paragraph."
    echo "  '.       →→  Jump to last changed line."
    echo "  'x       →→  Jump to line of mark 'x'."
    echo "  %        →→  Move to corresponding brace, e.g. ( to )."
    echo "  ^o       →→  Jump to previous location."
    echo " :sort     →→  Alphab. sort lines in visual selection."
    echo " :%s/x/y/g →→  Replace `x` with `y` throughout (%)."
endf

" See cheatsheet
noremap <Leader>c :call Cheat() <CR>

" Toggle indent guides
nnoremap <Leader>i :IndentGuidesToggle<CR>

" Open new split/vsplit/tab with netrw open
nnoremap <Leader>v :vnew<CR>:E<CR>
nnoremap <Leader>s :new<CR>:E<CR>
nnoremap <Leader>t :tabnew<CR>:E<CR>

" Send split to new tab
nnoremap <Leader>g :tabedit %<CR>

" Output a file from vifm into the buffer
nnoremap <Leader>A :6r !vifm_attach <CR>

" }}}

" General Settings {{{

" Movement and resizing {{{

" Set mouse mode 
set mouse=n

" Don’t reset cursor to start of line when moving around
set nostartofline

" Preserve indentation on wrapped lines and make proper tabs!
set breakindent
set autoindent

set tabstop=8
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Normal backspace behaviour on OSX
set backspace=2

" Split to right by default
set splitright 

" }}}

" Appearance {{{

" enable syntax highlighting
syntax on

" Remove ugly vertlines in split bar (Note space after `\ `)
set fillchars+=vert:\ 

" Make end of file `~` the same colour as background
highlight EndOfBuffer ctermfg=none ctermbg=none

" enable line numbers, relative except current line
set number relativenumber

" Add cursorline
set cursorline

" Remove background
hi Normal ctermbg=none

" Inherit iterm2 colour scheme
set t_Co=16

" Ragged right line break
set linebreak

" Statusline {{{

" statusline always showing
set laststatus=2

" Map of modes and their codes for statusline
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'N·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'R',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

" Change statusline colour based on mode 

function! ModeCurrent() abort
    let l:modecurrent = mode()
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block'))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

function! ChangeStatuslineColor()
  if (mode() ==# 'i')
    exe 'hi StatusLine ctermbg=black ctermfg=032'
  elseif (mode() =~# '\v(v|V)' ||  ModeCurrent() == 'V·Block')
    exe 'hi StatusLine ctermbg=black ctermfg=172'
  else    
    exe 'hi Statusline ctermbg=white ctermfg=black'
  endif
  return ''
endfunction

" Get git branch in statusline
function CurrentGitBranch()
    let gitoutput = system('git status -b '.shellescape(expand('%')).' | head -1 | grep -oE "[^ ]+$" | tr -d "[:cntrl:]"') 
    if gitoutput =~ "invalid"
        let b:gitstatus = ''
    else
        let b:gitstatus = gitoutput 
    endif
endfunc

autocmd BufEnter,BufWritePost * call CurrentGitBranch()

" Statusline
" left side
set statusline=%{ChangeStatuslineColor()}	" Change colour
set statusline+=\ %-8.{ModeCurrent()} 	" Current mode
set statusline+=\ \|\  	" Vert-line and space   
set statusline+=%t	" File name
set statusline+=\ \|\  	" Vert-line and space   
set statusline+=%{b:gitstatus}		" git branch
set statusline+=%=	" Switch to right side

" right side
set statusline+=%m%r " Modified and read only flags
set statusline+=\ 		"Space
set statusline+=%y	" File type
set statusline+=\ \|\ 	" Space, Vert-line and space
set statusline+=%3.p%%	" Percentage through file - min size 3
set statusline+=\ \|\ 	" Vert-line and Space
set statusline+=%8.(%4.l:%-3.c%)	" Line and column number in group
set statusline+=\ 		" Space
" }}}
   
" }}}

" Folding {{{

" Make folds with indent
set foldmethod=indent

" Open files with folds open
autocmd BufRead * normal zR

" Show folds in gutter
set foldcolumn=1

" Disable indent folding in certain filetypes
autocmd Filetype tex setlocal nofoldenable
autocmd Filetype bib setlocal nofoldenable
autocmd Filetype markdown setlocal nofoldenable

" Set folding for markdown headers
function! MarkdownLevel()
    if getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
        return ">2" 
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif
    return "=" 
endfunction
au BufEnter *.md setlocal foldexpr=MarkdownLevel()  
au BufEnter *.md setlocal foldmethod=expr   

" }}}

" Calendar {{{

" Use google calendar on calendar.vim
let g:calendar_google_calendar = 1

" }}}

" VimTeX {{{

" Always think tex files are xelatex - Also see latexmkrc in ~ (Root)
let g:tex_flavor = 'xelatex'

" When running vimtex compiler, don't automatically show quickfix list errors
let g:vimtex_quickfix_mode = 0

" Disable callback warning message because I don't have client server
let g:vimtex_disable_version_warning = 1

" }}}

" Markdown {{{

" Disable folding in markdown
let g:vim_markdown_folding_disabled = 1

" Disable syntax conceal in markdown
let g:vim_markdown_conceal = 0

" Stop vim indenting after deleting bullet point
let g:vim_markdown_new_list_item_indent = 0
setlocal formatoptions=tqlnrc
set comments=b:>


" }}}

" netrw {{{

" Tree style file list
let g:netrw_liststyle = 0

" Open file in current split
let g:netrw_browse_split = 0

" Maintain current directory when opening netrw
let g:netrw_keepdir = 0

" Stop creating history in .netrwhist
let g:netrw_dirhistmax = 1

let NERDTreeSortHiddenFirst=1

let NERDTreeHijackNetrw=1

let NERDTreeMinimalUI=1

let NERDTreeWinSize=40


" }}}

" NERDTree {{{

let NERDTreeShowHidden=1

let NERDTreeShowBookmarks=1

let NERDTreeAutoDeleteBuffer = 1

" }}}

" Mutt integration {{{
autocmd FileType mail set omnifunc=muttaliasescomplete#Complete 
source ~/.vim/muttaliasescomplete.vim 
" }}}

" Lightline {{{ 

" Add whether file is modified and the current git branch
let g:lightline = {
      \ 'colorscheme': 'powerline', 
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ }}
" }}}

" Spell check {{{

" Set language
set spelllang=en_gb

" Set spellfile
set spellfile=$HOME/.vim/spell/en.utf-8.add

" }}}

" Omni-completion {{{

" Ensure omni-completion menu stays open
set completeopt=longest,menuone 

" }}}

" Rainbow_levels {{{

au FileType markdown :RainbowLevelsOn

" }}}

" Goyo {{{

" Default goyo width
let g:goyo_width = 180

" }}}

" Python indentation markers settings {{{
autocmd Filetype python :IndentGuidesEnable
set ts=4 sw=4 et
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 2

" }}}  

" UltiSnips {{{

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/Ultisnips']
" }}}


" Stop creating swp and ~ files
set nobackup
set noswapfile

" Open vim in root 
cd ~

" Ignore case of `/` searches unless an upper case letter is used
set ignorecase
set smartcase

" }}}

