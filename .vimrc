"
" MAIN CUSTOMIZATION FILE
"

" Enable loading filetype and indentation plugins
filetype plugin on
filetype indent on

" Turn syntax highlighting on
syntax on

"
" GLOBAL SETTINGS
"

" Write contents of the file, if it has been modified, on buffer exit
set autowrite

" Allow backspacing over everything
set backspace=indent,eol,start

" Insert mode completion options
" set completeopt=menu,longest,preview

" Use UTF-8 as the default buffer encoding
set enc=utf-8

" Remember up to 100 'colon' commmands and search patterns
set history=100

" Enable incremental search
set incsearch

" Always show status line, even for one window
set laststatus=2

" Jump to matching bracket for 2/10th of a second (works with showmatch)
set matchtime=2

" Don't highlight results of a search
set nohlsearch

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" Use F10 to toggle 'paste' mode.  :CONVISSOR: Use F2 instead.
set pastetoggle=<F2>

" Show line, column number, and relative position within a file in the status line
set ruler

" Scroll when cursor gets within 3 characters of top/bottom edge
set scrolloff=3

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Use 4 spaces for (auto)indent
set shiftwidth=4

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Don't request terminal version string (for xterm)
set t_RV=

" Use 4 spaces for <Tab> and :retab
set tabstop=4

" Write swap file to disk after every 50 characters
set updatecount=50

" Ignore certain types of files on completion
set wildignore+=*.o,*.obj,*.pyc,.git

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history 
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,%,n~/.viminfo

" Use menu to show command-line completion (in 'full' case)
set wildmenu

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" Fix my <Backspace> key (in Mac OS X Terminal)
set t_kb=
fixdel

" Avoid loading MatchParen plugin.
" :CONVISSOR:  wait, I like MatchParen; comment out the line disabling it.
"let loaded_matchparen = 1

" netRW: Open files in a split window
let g:netrw_browse_split = 1

"
" MAPPINGS
"

" save changes
map ,s :w<CR>
" exit vim without saving any changes
" :CONVISSOR:  will be using ",q" for my own purposes; comment out Andrei's.
" map ,q :q!<CR>
" exit vim saving changes
map ,w :x<CR>
" switch to upper/lower window quickly
map <C-J> <C-W>j
map <C-K> <C-W>k
" use CTRL-F for omni completion
imap <C-F> 
" map CTRL-L to piece-wise copying of the line above the current one
imap <C-L> a<esc>kywgi<esc>Pla<bs>
" map ,f to display all lines with keyword under cursor and ask which one to
" jump to
nmap ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" use <F6> to toggle line numbers
nmap <silent> <F6> :set number!<CR>
" page down with <Space>
nmap <Space> <PageDown>
" open filename under cursor in a new window (use current file's working
" directory) 
nmap gf :new %:p:h/<cfile><CR>
" map <Alt-p> and <Alt-P> to paste below/above and reformat
nnoremap <Esc>P  P'[v']=
nnoremap <Esc>p  p'[v']=
" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

" Generic highlight changes
highlight Comment cterm=none ctermfg=Gray
highlight IncSearch cterm=none ctermfg=Black ctermbg=DarkYellow
highlight Search cterm=none ctermfg=Black ctermbg=DarkYellow
highlight String cterm=none ctermfg=DarkGreen
highlight treeDir cterm=none ctermfg=Cyan
highlight treeUp cterm=none ctermfg=DarkYellow
highlight treeCWD cterm=none ctermfg=DarkYellow
highlight netrwDir cterm=none ctermfg=Cyan

" Set up cscope options
if has("cscope")
	set csprg=cscope
	set csto=0
	set cst
	set nocsverb
	cs add cscope.out
	set csverb
	map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
	map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
	map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
endif


" Set the <Leader> for combo commands
let mapleader = ","


" :CONVISSOR:  Disable code folding.
set nofoldenable

" :CONVISSOR:  Allow more tabs/files to be opened.
set tabpagemax=30

" :CONVISSOR:  Nest with spaces if it's a PEAR file.
autocmd BufNewFile,BufRead *pear* set expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *mdb2* set expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.js set expandtab tabstop=4 shiftwidth=4 softtabstop=4

" :CONVISSOR:  Use F12 to completely turn off line wrapping.
map <F12> :set nowrap nolinebreak textwidth=0 wrapmargin=0

" :CONVISSOR:  Use SP to turn spelling on and SN to turn it off.
command SP setlocal spell spelllang=en_us
command SN setlocal nospell

" :CONVISSOR:  Highlight trailing whitespace.
highlight WhitespaceEOL ctermbg=red guibg=red
autocmd BufWinEnter * match WhitespaceEOL /\s\+$/

" :CONVISSOR:  Highlight mixed up nesting.  (First stab, refine it.)
highlight NestingMixupSpace ctermbg=DarkMagenta guibg=DarkMagenta
autocmd BufWinEnter * 2match NestingMixupSpace /\(^\t*\zs \+\ze[^*]\|[^\t]\zs\t\+\ze\)/
highlight NestingMixupTab ctermbg=DarkMagenta guibg=DarkMagenta
autocmd BufWinEnter *pear* 3match NestingMixupTab /^ *\zs\t\+\ze[^*]/

" :CONVISSOR:  Disable syntax highlighting in large files to speed opening.
au BufReadPost * if getfsize(bufname("%")) > 102400 | set syntax= | endif

" :CONVISSOR:  Change matchparen colors to avoid syntax highlight ambiguity.
highlight MatchParen ctermbg=Blue ctermfg=White

" :CONVISSOR:  Get <:> out of matchpairs.
autocmd BufRead * set matchpairs=(:),{:},[:]

" :CONVISSOR:  Open tags in new tab, jump directly to tag if only one match.
nnoremap <C-]> :tab tjump <C-r><C-w><CR>

" :CONVISSOR:  Declare function for moving left when closing a tab.
function! TabCloseLeft(cmd)
	if winnr('$') == 1 && tabpagenr('$') > 1 && tabpagenr() > 1 && tabpagenr() < tabpagenr('$')
		exec a:cmd | tabprevious
	else
		exec a:cmd
	endif
endfunction
" :CONVISSOR:  ,x = Write if changes made, exit, move left one tab.
noremap ,x :call TabCloseLeft('x')<CR>
" :CONVISSOR:  ,q = Don't save changes, exit, move left one tab.
noremap ,q :call TabCloseLeft('q!')<CR>
