" A full .vimrc for use within normal vim on macos

" Set folding to markers for .vimrc only 
" vim: foldmethod=marker

" vi compatibility
set nocompatible		

" Vundle {{{

filetype off	" required for Vundle

" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()	" required

Plugin 'VundleVim/Vundle.vim'	" required
Plugin 'plasticboy/vim-markdown'	" Better markdown syntax highlighting, indenting etc.
Plugin 'pangloss/vim-javascript'	" Javascript syntax highlighting
Plugin 'junegunn/goyo.vim'	" Toggle minimal writing environment
Plugin 'kshenoy/vim-signature'	" Mark locations in gutter
Plugin 'christoomey/vim-tmux-navigator'	" Easy navigation of tmux and vim splits
Plugin 'itchyny/calendar.vim'	" Interact with google calendar using vim
Plugin 'lervag/vimtex'		" LaTeX editing in vim
Plugin 'ledger/vim-ledger'	" Edit ledger journals in vim
Plugin 'nathanaelkane/vim-indent-guides'	" Indent guides
Plugin 'junegunn/fzf.vim'       " Fuzzy file finder
Plugin 'chrisbra/csv.vim'		" CSV editing
Plugin 'SirVer/ultisnips'       " Snippets
Plugin 'jalvesaq/Nvim-R'	" R IDE
Plugin 'ap/vim-css-color'	" Highlight colours in CSS

call vundle#end()	" required
filetype plugin indent on	" required

" }}}

" Generic key bindings {{{ 

" map `A` (append at end of line) to `a` (append in place)
nnoremap a A

" Move by visual lines rather than actual lines with `k` `j`, but preserve
" moving by actual lines with bigger jumps like `6j`
noremap <expr> j v:count ? (v:count > 1 ? "m'" . v:count : '') . 'j' : 'gj'
noremap <expr> k v:count ? (v:count > 1 ? "m'" . v:count : '') . 'k' : 'gk'

" Resize splits more conveniently using Leader 
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
vnoremap p "_dP
nnoremap p "+p
vnoremap d "+d
nnoremap dd "+dd

" Don't add pasted over text to register
vnoremap <leader>p "_dP

" Make terminal source .bash_profile when opening 
nnoremap <Leader>t :terminal<CR>source $HOME/.bash_profile<CR>

" A function to display often misremembered keybindings
fun! Cheat()
    " Add handy bindings you tend to forget or want to learn.
    echo " -- R key bindings -- "
    echo " \\aa            →→ Send file to R"
    echo " \\rf            →→ Start R"
    echo " \\ro            →→ Open object browser"
    echo " \\rv            →→ Preview object"
    echo " \\<Enter>       →→ Send line/selection to R"
    echo " \\su            →→ Send above lines to R"
    echo " "
    echo " ) (            →→ Forwards / backwards one sentence"
    echo " } {            →→ Forwards / backwards one paragraph"
    echo " vi({[          →→ Select within (, {, ["
    echo " '.             →→ Jump to last changed line"
    echo " 'x             →→ Jump to line of mark 'x'"
    echo " %              →→ Move to corresponding brace, e.g. ( to )"
    echo " ^o             →→ Jump to previous location"
    echo " :sort          →→ Alphab. sort lines in visual selection"
    echo " :%s/x/y/g      →→ Replace `x` with `y` throughout (%)"
    echo " :UltiSnipsEdit →→ Snippets for current filetype"
    echo " \\p             →→ Search for files with FZF"
    echo " \\i             →→ Toggle indent guides" 
endf

" See cheatsheet
noremap <Leader>c :call Cheat() <CR>

" Send split to new tab
nnoremap <Leader>g :tabedit %<CR>

" Open URLs in vim
nnoremap <Leader>u :w<Home>silent <End> !urlview<CR>

" Open todo.md
nnoremap <Leader>ww :e ~/google_drive/notes/todo.md<CR>

" Open diary for today in a new tab, or create if it doesn't exist
nnoremap <Leader>w<Leader>w :tabnew `diary_gen`<CR>

" }}}

" Movement and resizing {{{

" Set mouse mode 
set mouse=n

" Don’t reset cursor to start of line when moving around
set nostartofline

" Preserve indentation on wrapped lines and make proper tabs
set breakindent
set autoindent

" Set tab width to 4 spaces 
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

" enable line numbers, relative except current line
set number relativenumber

" Add cursorline
set cursorline

" Remove background
hi Normal ctermbg=none

" Ragged right line break
set linebreak
set wrap

" Show most of last line 
set display+=lastline

" Vertical line appearance
hi ColorColumn ctermbg=red 

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
if &diff

else
	function CurrentGitBranch()
    	let gitoutput = system('git status -b '.shellescape(expand('%')).' | head -1 | grep -oE "[^ ]+$" | tr -d "[:cntrl:]"') 
    	if gitoutput =~ "fatal"
        	let b:gitstatus = ''
    	else
        	let b:gitstatus = gitoutput 
    	endif
	endfunc
	autocmd BufEnter,BufWritePost * call CurrentGitBranch()
endif


" Statusline
" left side
set statusline=%{ChangeStatuslineColor()}	" Change colour
set statusline+=\ %-8.{ModeCurrent()} 	" Current mode
set statusline+=\ \|\  	" Vert-line and space   
set statusline+=%t	" File name
set statusline+=\ \|\  	" Vert-line and space   
if &diff

else
	set statusline+=%{b:gitstatus}		" git branch
endif
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

" Indent guides {{{

" Disable indentation guides by default 
let g:indent_guides_enable_on_vim_startup=0

" Set indentation colours
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=Gray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=DarkGray

" Toggle indent guides
nnoremap <Leader>i :IndentGuidesToggle<CR>

" }}}

" Calendar {{{

" Use google calendar on calendar.vim
let g:calendar_google_calendar = 1

" }}}

" VimTeX {{{

" Always think tex files are xelatex 
let g:tex_flavor = 'xelatex'

" When running vimtex compiler, don't automatically show quickfix list errors
let g:vimtex_quickfix_mode = 0

" Disable callback warning message because I don't have client server
let g:vimtex_disable_version_warning = 1

" Use Skim as PDF viewer which support auto-update
let g:vimtex_view_method = 'skim'

" }}}

" Markdown {{{

" Disable syntax conceal in markdown
let g:vim_markdown_conceal = 0

" Stop vim indenting after deleting bullet point
let g:vim_markdown_new_list_item_indent = 0
setlocal formatoptions=tqlnrc
set comments=b:>

" Align markdown tables only in markdown documents using \\
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" }}}

" netrw {{{

" Remove banner
let g:netrw_banner = 0

" Tree-like directory style
let g:netrw_liststyle = 3

" Open files in 'previous' pane
let g:netrw_browse_split = 4
let g:netrw_preview = 1
let g:netrw_altv = 1

" Column width of Vexplore
let g:netrw_winsize = 20

" Disable opening files with left click
let g:netrw_mousemaps = 0

" Human readable file sizes
let g:netrw_sizestyle = "H"

" Maintain current directory when opening netrw
let g:netrw_keepdir = 0

" Stop creating history in .netrwhist
let g:netrw_dirhistmax = 1

" Open netrw
nnoremap <Leader>n :Vexplore<CR>

" Open new split/vsplit/tab with netrw open
nnoremap <Leader>t :tabnew<CR>:Explore<CR>

" }}}

" fzf {{{

" Location of system fzf
set rtp+=/usr/local/opt/fzf

" Use fzf to search open buffers
nnoremap <Leader>b :Buffers<CR>

" Use fzf to search files
nnoremap <Leader>p :Files<CR>

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

" Output a file from vifm into the buffer
autocmd FileType mail nnoremap <Leader>A :6r !vifm_attach <CR>

" Set PGP options in mutt buffer
autocmd FileType mail nnoremap <Leader>P :6r !mutt_pgp_opt <CR>

" Clearsign in message
autocmd FileType mail nnoremap <Leader>S :%!gpg --clearsign <CR>

" }}}

" Spell check {{{

" Set language
set spelllang=en_gb

" Set spellfile
set spellfile=$HOME/.vim/spell/en.utf-8.add

" Toggle spellcheck
nnoremap <Leader>s :set spell!<CR>

" }}}

" Omni-completion {{{

" Ensure omni-completion menu stays open
set completeopt=longest,menuone 

" Autocompletion as Ctrl-Space
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>
inoremap <Nul> <C-x><C-o>

" }}}

" Goyo {{{

" Default goyo width
let g:goyo_width = 180

" }}}

" Python {{{

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

" Ledger {{{

" Open reports vertically
let g:ledger_qf_vertical = 1

" Align ledger journal
autocmd FileType ledger nnoremap <Leader>a :%LedgerAlign<CR>

" }}}

" R {{{

let R_in_buffer = 0
let R_source = '~/.vim/tmux_split.vim' 
let R_assign = 0
let R_objbr_place = 'BOTTOM'
let R_objbr_h = 30
let R_min_editor_width = 80
let R_objbr_opendf = 0 
let r_indent_comment_column = 0
let r_indent_align_args = 0
let r_indent_ess_comments = 0
let r_indent_ess_compatible = 0
let R_non_r_compl = 0
let R_rmdchunk = 0

autocmd FileType r setlocal colorcolumn=80
autocmd FileType r nnoremap <Leader>F :Rformat<CR>
nmap <LocalLeader><Enter> <Plug>RDSendLine
vmap <LocalLeader><Enter> <Plug>REDSendSelection

autocmd Filetype r call SetROptions()
function SetROptions()
    setlocal expandtab
    setlocal softtabstop=2
    setlocal shiftwidth=2
    let indent_guides_start_level = 1
    let indent_guides_guide_size = 2
endfunction

" }}}

" vimdiff {{{

" Disable folding
set diffopt+=context:99999

" Disable diffing on whitespace
set diffopt+=iwhite

" Softwrap lines
au VimEnter * if &diff | execute 'windo set wrap' | endif

" Disable syntax highlighting
if &diff
    syntax off
endif

" Change highlight colours so they are less garish
hi DiffAdd      cterm=none ctermfg=NONE ctermbg=Red
hi DiffChange   cterm=none ctermfg=NONE ctermbg=Gray
hi DiffDelete   cterm=none ctermfg=NONE ctermbg=Red
hi DiffText     cterm=none ctermfg=NONE ctermbg=DarkGray

" }}}


" Stop creating swp and ~ files
set nobackup
set noswapfile

" Automatically cd to directory of current file
set autochdir

" Ignore case of `/` searches unless an upper case letter is used
set ignorecase
set smartcase

nnoremap <Leader>A :terminal markdown_vim_preview %<CR>
