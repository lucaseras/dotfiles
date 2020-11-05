" Custom .vimrc
" Creator: Lucas Eras Paiva

call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'xavierd/clang_complete'
Plug 'yegappan/mru'
Plug 'itchyny/calendar.vim'
Plug 'scrooloose/nerdtree'
Plug 'plasticboy/vim-markdown'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'nathanaelkane/vim-indent-guides'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jez/vim-better-sml'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" source this file once it is saved/closed
if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd


"highlight OverLength ctermbg=darkgrey ctermfg=white guibg=#FFD9D9
"match OverLength /\%81v.\+/

" ================ General Config ====================
set nocompatible

" enable syntax highlighting
syntax on

 colorscheme gruvbox
set background=dark
let g:gruvbox_constrast_dark = "hard"
colorscheme gruvbox


let g:airline_powerline_fonts = 1

let g:sml_smlnj_executable ='/usr/local/smlnj/bin/sml'

" ================ FZF settings ===================
set rtp+=/usr/local/opt/fzf
" open buffers
nnoremap <silent> <Leader>b :Buffers<CR>

" find files with fzf
nnoremap <silent> <C-f> :Files<CR>

" find content in files
nnoremap <silent> <Leader>f :Rg<CR>

nnoremap <silent> <Leader>/ :BLines<CR>

nnoremap <silent> <Leader>g :Commits<CR>


"use ripgrep instead of grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" ignore file name when looking at content with fzf
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)


" ================ Snippet settings ===================
" Trigger configuration. You need to change this to something else than <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" ================ General settings ===================
"if has('nvim')
  "tnoremap <Esc> <C-\><C-n>
  "tnoremap <M-[> <Esc>
  "tnoremap <C-v><Esc> <Esc>
"endif
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" enable plugins and indent
filetype plugin on
filetype indent on

" set visual bell instead of beeping
set visualbell

" set folding settings
" set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" set tab spacing
set tabstop=4
set shiftwidth=4
set expandtab

set noswapfile

" ================ Main maps ====================
" Leave the editor with Ctrl-q (KDE): Write all changed buffers and exit Vim
nnoremap  <C-q>    :wqall<CR>


" using jk rather than <ESC>
inoremap jk <ESC>

" set <leader> to be <SPACE>
let mapleader = " "

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" move between splits without doing <C-w>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" tab maps
nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>
nnoremap tn :tabnew<CR>

" ================ Markdown Configs ====================

"set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" example
nmap <C-s> <Plug>MarkdownPreviewToggle

set splitright
set splitbelow
"-------------------------------------------------------------------------------
" Multiple sets
"-------------------------------------------------------------------------------
" show line numbers
set number

" regexp highlighting turned off :)
set nohlsearch

" when using the >> or << commands, shift lines by 4 spaces (python friendly)
"set shiftwidth=4

" wraplines in 80 chars long
set textwidth=80

"" create a line that tells where 80 chars long is
"set colorcolumn=81

" have lines above and below current line
set scrolloff=10

" show a visual line under the cursor's current line
" set cursorline

" show the matching part of the pair fro []. {} and ()
"set showmatch

" enable all Python syntax highlighting features
let python_highlight_all=1

" turn on true color (works only with iTerm)
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" update vim using this .vimrc file
nmap <leader>sv :so $MYVIMRC<CR>

" open .vimrc and init.vim
nmap <silent> <leader>ev :e ~/.vimrc <CR> 

" setting up tab completion 
"set wildmode=longest,list,full
"set wildmenu


"set guifont=Menlo\ Regular:h14
set guifont=Roboto\ Mono

" set clang path
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'


" got to definition 
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nnoremap <C-p> :GFiles<CR>


nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP


inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" ================ NerdTree Configs ====================
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" open NerdTree automatically if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" do not open NerdTree if using source
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif

" open NerdTree if starting vim in directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

