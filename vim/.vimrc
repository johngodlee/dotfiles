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
"Plugin 'thiagoalessio/rainbow_levels.vim'	" Highlight with indenting
Plugin 'nathanaelkane/vim-indent-guides'	" Indent guides
Plugin 'junegunn/fzf'           " Fuzzy file finder
Plugin 'junegunn/fzf.vim'       " Fuzzy file finder
Plugin 'chrisbra/csv.vim'		" CSV editing
Plugin 'SirVer/ultisnips'       " Snippets
Plugin 'Alok/notational-fzf-vim' 	" Notational Velocity


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

" Move by visual lines rather than actual lines with `k` `j`, but preserve
" moving by actual lines with bigger jumps like `6j`
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

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

" Open current buffer in finder with <Leader>f
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

nnoremap <Leader>E :edit<CR>

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
nnoremap <Leader>p :Files<CR>

" Search contents of notes
nnoremap <Leader>v :NV<CR>

" A function to display often misremembered keybindings
fun! Cheat()
    " Add handy bindings you tend to forget or want to learn.
    echo "  ) (           →→  Forwards / backwards one sentence."
    echo "  } {           →→  Forwards / backwards one paragraph."
    echo "  '.            →→  Jump to last changed line."
    echo "  'x            →→  Jump to line of mark 'x'."
    echo "  %             →→  Move to corresponding brace, e.g. ( to )."
    echo "  ^o            →→  Jump to previous location."
    echo " :sort          →→  Alphab. sort lines in visual selection."
    echo " :%s/x/y/g      →→  Replace `x` with `y` throughout (%)."
    echo " :UltiSnipsEdit →→  Snippets for current filetype."
    echo " \p             →→  Search for files with FZF."
    echo " \v             →→  Search notes with NV."
endf

" See cheatsheet
noremap <Leader>c :call Cheat() <CR>

" Toggle indent guides
nnoremap <Leader>i :IndentGuidesToggle<CR>

" Open new split/vsplit/tab with netrw open
nnoremap <Leader>t :tabnew<CR>:E<CR>

" Send split to new tab
nnoremap <Leader>g :tabedit %<CR>

" Output a file from vifm into the buffer
autocmd FileType mail nnoremap <Leader>A :6r !vifm_attach <CR>

" Set PGP options in mutt buffer
autocmd FileType mail nnoremap <Leader>P :6r !mutt_pgp_opt <CR>

" Clearsign in message
autocmd FileType mail nnoremap <Leader>S :%!gpg --clearsign <CR>

" Toggle indent guides
nnoremap <Leader>ig :IndentGuidesToggle <CR>

" Create and toggle done status of task lines
autocmd Filetype text,markdown nnoremap <Leader>T :call ToggleTask()<CR>

function! ToggleTask()
	if (getline('.') =~ '^\[x\]')>0       " IF you find [x] at line start
		.s/^\[x\]/[ ]/g
	elseif (getline('.') =~ '^\[\ \]')>0  " OR if you find [ ] at line start
		.s/^\[\ \]/[x]/g
	elseif (getline('.') =~ '^\d\+\.\ \[\ \]')>0  " OR if the line begins with 1. [ ]
		.s/\[\ \]/[x]/g
	elseif (getline('.') =~ '^\d\+\.\ \[x\]')>0  " OR if the line begins with 1. [x]
		.s/\[x\]/[ ]/g
	elseif (getline('.') =~ '^\d\+\.')>0  " OR if the line begins with a 1.
		.s/\d\+\./& [ ]/
	elseif (getline('.') =~ '^\*\|-')>0	  " OR if the line begins with a * or -	
		.s/^\*\|-/[ ]/
	else								  " OR if none 
		.s/^/[ ] /g
	endif 
endfunction

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

set tabstop=4
set noexpandtab
set shiftwidth=4

set copyindent
set preserveindent
set softtabstop=0

set textwidth=0

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
set wrap

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
    if gitoutput =~ "fatal"
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

" Set folding function for bibtex entries
function! BibTeXFold()
	if getline(v:lnum) =~ '^@.*$'
		return ">1"
	endif
	return "="
endfunction
au BufEnter *.bib setlocal foldexpr=BibTeXFold()
au BufEnter *.bib setlocal foldmethod=expr

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

" Use Skim as PDF viewer which support auto-update
let g:vimtex_view_method = 'skim'

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
autocmd FileType mail setlocal omnifunc=muttaliasescomplete#Complete 
source ~/.vim/muttaliasescomplete.vim 

" This is to be used with mutt's 'text_flowed' option. Stops mutt from hard
" wrapping lines at 80 characters and making it look weird on mail clients
" which don't use text_flowed, which is a lot of them.
augroup mail_trailing_whitespace " {
    autocmd!
    autocmd FileType mail setlocal formatoptions-=t
augroup END " }

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

"au FileType markdown :RainbowLevelsOn

" }}}

" Goyo {{{

" Default goyo width
let g:goyo_width = 180

" }}}

" Python indentation markers settings {{{

let g:indent_guides_enable_on_vim_startup=0     " Disable on startup

autocmd Filetype python call SetPythonOptions()
function SetPythonOptions()
    setlocal expandtab
    setlocal softtabstop=2
    setlocal shiftwidth=2
    let indent_guides_start_level = 1
    let indent_guides_guide_size = 2
endfunction

" }}}  

" UltiSnips {{{

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/Ultisnips']
" }}}

" CSV editing {{{

" Centre align columns by default
let b:csv_arrange_align = 'c*'

" Always highlight current column
let g:csv_highlight_column = 'y'

" }}}

" Notational Velocity {{{

" Set path to search, notes directory
let g:nv_search_paths = ['/Users/johngodlee/google_drive/notes']

" Default open selected file in new tab
let g:nv_create_note_window = 'tabedit'

" Open search window as vsplit with preview window below
let g:nv_window_direction = 'right'
let g:nv_preview_direction = 'down'

" Don't use .*ignore files
let g:nv_ignore_files = 0

" }}}

" Stop creating swp and ~ files
set nobackup
set noswapfile

" Open vim in root 
cd ~

" Automatically cd to directory of current file
set autochdir

" Ignore case of `/` searches unless an upper case letter is used
set ignorecase
set smartcase

" }}}

