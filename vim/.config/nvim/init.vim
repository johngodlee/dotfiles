" Set folding to markers for .vimrc only 
" vim: foldmethod=marker

" vim-plug {{{
" set runtime path to include vim-plug and initialize
call plug#begin('~/.vim/plugged')

Plug 'plasticboy/vim-markdown'	" Markdown 
Plug 'godlygeek/tabular'	" Align tables
Plug 'pangloss/vim-javascript'	" Javascript syntax highlighting
Plug 'kshenoy/vim-signature'	" Marks in gutter
Plug 'christoomey/vim-tmux-navigator'	" tmux+vim navigation 
Plug 'lervag/vimtex'		" LaTeX 
Plug 'ledger/vim-ledger'	" Ledger
Plug 'junegunn/fzf.vim'	" Fuzzy finder
Plug 'mcchrish/nnn.vim'	" NNN file manager
Plug 'chrisbra/csv.vim'	" CSV editing
Plug 'SirVer/ultisnips'	" Snippets
Plug 'ap/vim-css-color'	" Highlight colours in CSS
Plug 'ncm2/ncm2'	" Auto-completion
Plug 'jalvesaq/Nvim-R'	" R 
Plug 'roxma/nvim-yarp'	" Auto-completion helper 
Plug 'gaalcaras/ncm-R'	" NCM2 R
Plug 'ncm2/ncm2-path'	" NCM2 system paths
Plug 'ncm2/ncm2-ultisnips'	" NCM2 Ultisnips 
Plug 'wellle/tmux-complete.vim'	" NCM2 tmux completion
Plug 'jalvesaq/vimcmdline'	" Generic interpretor
Plug 'goerz/jupytext.vim'	" Convert ipynb to md/py 
Plug 'JuliaEditorSupport/julia-vim'	" Julia
Plug 'junegunn/goyo.vim'	" Pretty writing

call plug#end()	
" }}}

" Generic key bindings {{{ 

" Move by visual lines rather than actual lines with `k` `j`, but preserve
" moving by actual lines with bigger jumps like `6j`
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" Resize splits more conveniently using Leader 
nnoremap <Leader>h <C-W>>
nnoremap <Leader>j <C-W>+
nnoremap <Leader>k <C-W>-
nnoremap <Leader>l <C-W><

" Change layout of splits
nnoremap <Leader>] <C-w>H
nnoremap <Leader>[ <C-w>J

" Easier save and quit with `;`
nnoremap ;w :w<CR>
nnoremap ;q :q<CR>

" Don't exit visual mode when tab indenting
vnoremap > >gv
vnoremap < <gv

" Copy and paste from `+` register for interacting with mac clipboard
set clipboard=unnamedplus

" Don't add overwritten text to default register
xnoremap <expr> p 'pgv"'.v:register.'y`>'
xnoremap <expr> P 'Pgv"'.v:register.'y`>'

" A function to display often misremembered keybindings
fun! Cheat()
    " Add handy bindings 
    echo " -- R key bindings -- "
    echo " \\rf            -- Start R"
    echo " \\ro            -- Open object browser"
    echo " \\rv            -- Preview object"
    echo " \\<Enter>       -- Send line/selection to R"
    echo " "
    echo " ) (            -- Forwards / backwards one sentence"
    echo " } {            -- Forwards / backwards one paragraph"
    echo " vi({[          -- Select within (, {, ["
    echo " '.             -- Jump to last changed line"
    echo " 'x             -- Jump to line of mark 'x'"
    echo " %              -- Move to corresponding brace, e.g. ( to )"
    echo " ^o             -- Jump to previous location"
    echo " :sort          -- Alphab. sort lines in visual selection"
    echo " :%s/x/y/g      -- Replace `x` with `y` throughout (%)"
    echo " :UltiSnipsEdit -- Snippets for current filetype"
    echo " \\p             -- Search for files with FZF"
endf

" See cheatsheet
noremap <Leader>c :call Cheat() <CR>

" Send split to new tab
nnoremap <Leader>g :tabedit %<CR>

" Disable Ex Mode
map Q <Nop>

" Show whitespace characters
nnoremap <Leader>m :set list!<CR>
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set showbreak=↪\ 
" }}}

" Notes {{{
" Open diary log for today in a new tab, or create if it doesn't exist
nnoremap <Leader>w<Leader>w :tabnew `diary_gen`<CR>
" }}}

" Goyo {{{
let g:goyo_width=180
let g:goyo_height=100
autocmd! User GoyoLeave silent! source $HOME/.config/nvim/init.vim
" }}}

" fzf {{{
" Location of system fzf
set rtp+=/usr/local/opt/fzf

" Search open buffers
nnoremap <Leader>b :Buffers<CR>

" Search files
nnoremap <Leader>p :Files<CR>

" Search file contents
command! -bang -nargs=* NotesRg
	\ call fzf#vim#grep(
	\ "rg --column --line-number --no-heading --color=always --smart-case --hidden --glob \"!.git/*\" -- ".shellescape(<q-args>), 
	\ 1, 
	\ fzf#vim#with_preview(), 
	\ <bang>0)
nnoremap <Leader>f :Rg<CR>

" Search notes directory
command! -bang -nargs=* NotesRg
	\ call fzf#vim#grep(
	\ "rg --column --line-number --no-heading --color=always --smart-case --hidden --glob \"!.git/*\" -- ".shellescape(<q-args>), 
	\ 1, 
	\ fzf#vim#with_preview({'dir': '~/google_drive/notes'}), 
	\ <bang>0)
nnoremap <Leader>n :NotesRg<CR>

" Search Git project root
command! -bang -nargs=* ProjRg
	\ call fzf#vim#grep(
	\ "rg --column --line-number --no-heading --color=always --smart-case --hidden --glob \"!.git/*\" -- ".shellescape(<q-args>), 1,
	\ fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
nnoremap <Leader>g :ProjRg<CR>

" search command history 
nnoremap <Leader>h :History:<CR>

" Change default file opening behaviour
function! s:copy_results(lines)
  let joined_lines = join(a:lines, "\n")
  if len(a:lines) > 1
    let joined_lines .= "\n"
  endif
  let @+ = joined_lines
  p
endfunction

let g:fzf_action = {
  \ 'enter': 'tab split',
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-y': function('s:copy_results'),
  \ 'ctrl-v': 'vsplit' }

" Set layout of pop-up window
let g:fzf_preview_window = ['right:50%', 'ctrl-b']
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8, 'highlight': 'Comment' } }
" }}}

" nnn {{{
" Use nnn in a floating window
let g:nnn#layout = { 'window': { 'width': 0.8, 'height': 0.8, 'highlight': 'Debug' } }

" Replace default mappings
let g:nnn#set_default_mappings = 0
nnoremap <silent> <leader>d :NnnPicker<CR>
" }}}

" Movement and resizing {{{

" Allow mouse
set mouse=a

" Don’t reset cursor to start of line when moving around
set nostartofline

" Preserve indentation on wrapped lines and make proper tabs
set breakindent
set autoindent

" Set default tab width to 4 spaces 
set tabstop=4
set softtabstop=0
set noexpandtab
set shiftwidth=4

set copyindent
set preserveindent

set textwidth=0

" Disable search highlighting
set nohlsearch

" Interactive substitution
set inccommand=nosplit

" Persistent undo
set undofile

" }}}

" Appearance {{{

" Set colours correctly in nvim
set notermguicolors 
set bg=light

" Remove ugly vertlines in split bar (Note space after `\ `)
set fillchars+=vert:\ 

" enable line numbers, relative except current line
set number relativenumber

" Add cursorline
set cursorline

" Ragged right line break
set linebreak
set wrap

" Vertical line appearance
hi ColorColumn ctermbg=red 

" Gutter
hi SignColumn ctermbg=NONE ctermfg=grey
hi foldcolumn ctermbg=NONE ctermfg=grey
hi SignatureMarkText ctermfg=grey
hi LineNr ctermbg=NONE ctermfg=grey

" Folds
hi Folded ctermbg=grey ctermfg=black

" Statusline {{{

" Hide mode 
set noshowmode

" Statusline colours 
hi StatusLine ctermbg=blue ctermfg=white

" Map of modes and their codes for statusline
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'N·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ "\<C-V>" : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ "\<C-S>" : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
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

" Get git branch in statusline
if &diff

else
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
endif

" Get filesize
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif
  if bytes <= 0
    return '0'
  endif
  if (exists('mbytes'))
    return mbytes . 'MB'
  elseif (exists('kbytes'))
    return kbytes . 'KB'
  else
    return bytes . 'B'
  endif
endfunction

" Statusline
" left side
set statusline=
set statusline+=%#LineNr#
set statusline+=\ %-8.{toupper(g:currentmode[mode()])} 	" Current mode
set statusline+=\ \|\  	" Vert-line and space   
set statusline+=%t	" File name
set statusline+=\ \|	" Vert-line and space   
if &diff

else
	set statusline+=%{StatuslineGit()}	" git branch
endif
set statusline+=%=	" Switch to right side

" right side
set statusline+=%m%r " Modified and read only flags
set statusline+=\ 		"Space
set statusline+=%y	" File type
set statusline+=\ \|\ 	" Space, Vert-line and space
set statusline+=%{FileSize()}
set statusline+=\ \|\ 	" Space, Vert-line and space
set statusline+=%3.p%%	" Percentage through file - min size 3
set statusline+=\ \|\ 	" Vert-line and Space
set statusline+=%8.(%4.l:%-3.c%)	" Line and column number in group
set statusline+=\ 		" Space
" }}}

" Tabline {{{
function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    let tabnr = i + 1 " range() starts at 0
    let winnr = tabpagewinnr(tabnr)
    let buflist = tabpagebuflist(tabnr)
    let bufnr = buflist[winnr - 1]
    let bufname = fnamemodify(bufname(bufnr), ':t')

    let s .= '%' . tabnr . 'T'
    let s .= (tabnr == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tabnr

    let n = tabpagewinnr(tabnr,'$')
    if n > 1 | let s .= ':' . n | endif

    let s .= empty(bufname) ? ' [No Name] ' : ' ' . bufname . ' '

    let bufmodified = getbufvar(bufnr, "&mod")
    if bufmodified | let s .= '+ ' | endif
  endfor
  let s .= '%#TabLineFill#'
  return s
endfunction

set tabline=%!MyTabLine()
" }}}

" }}}

" Folding {{{

" Make folds with indent
set foldmethod=indent

" Show folds in gutter
set foldcolumn=1

" Disable indent folding 
set nofoldenable

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

" VimTeX {{{
" Always think tex files are xelatex 
let g:tex_flavor = 'xelatex'

" Use biber
let g:Tex_BibtexFlavor = 'biber'
let g:vimtex_compiler_progname = 'nvr'

" When running vimtex compiler, don't automatically show quickfix list errors
let g:vimtex_quickfix_mode = 0

" Disable callback warning message because I don't have client server
let g:vimtex_disable_version_warning = 1

" Use Skim as PDF viewer which support auto-update
let g:vimtex_view_method = 'skim'

" Set indenting in bib files
autocmd Filetype bib call SetBibOptions()
function SetBibOptions()
    setlocal expandtab
    setlocal softtabstop=2
    setlocal shiftwidth=2
    let indent_guides_start_level = 1
    let indent_guides_guide_size = 2
endfunction

" }}}

" Markdown {{{
" Disable syntax conceal in markdown
let g:vim_markdown_conceal = 0

" Stop vim indenting after deleting bullet point
let g:vim_markdown_new_list_item_indent = 0
setlocal formatoptions=tqlnrc
set comments=b:>

" Highlight YAML
let g:vim_markdown_frontmatter = 1

" Higlight math
let g:vim_markdown_math = 1

" Open linked files in new tab
let g:vim_markdown_edit_url_in = 'tab'

" Open links in normal mode with <Enter>
map <CR> <Plug>Markdown_EditUrlUnderCursor

" Save before following links
let g:vim_markdown_autowrite = 1
" }}}

" netrw {{{
" Remove banner
let g:netrw_banner = 0

" Tree-like directory style
let g:netrw_liststyle = 3

" Open files in 'previous' pane
let g:netrw_browse_split = 0
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
" }}}

" Mutt {{{
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

" Spell check {{{

" Set language
set spelllang=en_gb

" Set spellfile
set spellfile=$HOME/.vim/spell/en.utf-8.add

" Toggle spellcheck
nnoremap <Leader>s :set spell!<CR>

" }}}

" Omni-completion / NCM2 {{{

" Allow autocompletion in filetypes
autocmd Filetype r,tex,bib,mail,python call ncm2#enable_for_buffer()

" Ensure omni-completion menu stays open
set completeopt=noinsert,menuone,noselect

" Autocompletion as Ctrl-Space
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>
inoremap <Nul> <C-x><C-o>

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" LaTeX completion source
au Filetype tex call ncm2#register_source({
	\ 'name' : 'vimtex-cmds',
    \ 'priority': 8, 
    \ 'complete_length': -1,
    \ 'scope': ['tex'],
    \ 'matcher': {'name': 'prefix', 'key': 'word'},
    \ 'word_pattern': '\w+',
    \ 'complete_pattern': g:vimtex#re#ncm2#cmds,
    \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
    \ })
au Filetype tex call ncm2#register_source({
    \ 'name' : 'vimtex-labels',
    \ 'priority': 8, 
    \ 'complete_length': -1,
    \ 'scope': ['tex'],
    \ 'matcher': {'name': 'combine',
    \             'matchers': [
    \               {'name': 'substr', 'key': 'word'},
    \               {'name': 'substr', 'key': 'menu'},
    \             ]},
    \ 'word_pattern': '\w+',
    \ 'complete_pattern': g:vimtex#re#ncm2#labels,
    \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
    \ })
au Filetype tex call ncm2#register_source({
    \ 'name' : 'vimtex-files',
    \ 'priority': 8, 
    \ 'complete_length': -1,
    \ 'scope': ['tex'],
    \ 'matcher': {'name': 'combine',
    \             'matchers': [
    \               {'name': 'abbrfuzzy', 'key': 'word'},
    \               {'name': 'abbrfuzzy', 'key': 'abbr'},
    \             ]},
    \ 'word_pattern': '\w+',
    \ 'complete_pattern': g:vimtex#re#ncm2#files,
    \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
    \ })
au Filetype tex call ncm2#register_source({
    \ 'name' : 'bibtex',
    \ 'priority': 8, 
    \ 'complete_length': -1,
    \ 'scope': ['tex'],
    \ 'matcher': {'name': 'combine',
    \             'matchers': [
    \               {'name': 'prefix', 'key': 'word'},
    \               {'name': 'abbrfuzzy', 'key': 'abbr'},
    \               {'name': 'abbrfuzzy', 'key': 'menu'},
    \             ]},
    \ 'word_pattern': '\w+',
    \ 'complete_pattern': g:vimtex#re#ncm2#bibtex,
    \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
    \ })

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

" Use Homebrew python 
let g:python3_host_prog = '/usr/local/bin/python3'
" }}}  

" jupytext {{{
let g:jupytext_fmt = 'py'
" }}}

" vimcmdline {{{
let cmdline_map_start = '<LocalLeader>rf'
let cmdline_map_send = '<LocalLeader><Enter>'
let cmdline_map_quit = '<LocalLeader>rq'
let cmdline_follow_colorscheme = 1
let cmdline_in_buffer = 0
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

nmap <LocalLeader><Enter> <Plug>RDSendLine
vmap <LocalLeader><Enter> <Plug>REDSendSelection

autocmd Filetype r,rmd call SetROptions()
function SetROptions()
    setlocal expandtab
	setlocal colorcolumn=80
    setlocal softtabstop=2
    setlocal shiftwidth=2
    let indent_guides_start_level = 1
    let indent_guides_guide_size = 2
endfunction
" }}}

" Julia {{{
" Disable smart aligning
let g:julia_indent_align_import = 0
let g:julia_indent_align_brackets = 0
let g:julia_indent_align_funcargs = 0

" }}}

" vimdiff {{{

" Disable folding
set diffopt+=context:99999

" Disable diffing on whitespace
set diffopt+=iwhite

" Softwrap lines
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" Disable syntax highlighting, soft-wrap lines
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
set nowritebackup

" Automatically cd to directory of current file
set autochdir

" Ignore case of `/` searches unless an upper case letter is used
set ignorecase
set smartcase

