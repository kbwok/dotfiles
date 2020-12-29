set rtp +=~/.vim
" setting
if has('vim_starting')
  set nocompatible
endif

if !filereadable(expand('~/.vim/autoload/plug.vim'))
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif

" plugin
call plug#begin(expand('~/.vim/plugged'))
" for debug
Plug 'thinca/vim-quickrun', {'on' : 'QuickRun'}
Plug 'joonty/vdebug'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-commentary'
" UI
Plug 'vim-airline/vim-airline'
"easy to change pair surroundings
Plug 'tpope/vim-surround'
" "for tab
Plug 'ervandew/supertab'
"emmet
Plug 'mattn/emmet-vim'
" requirements
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
" ultisnips
Plug 'SirVer/ultisnips'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-obsession'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
" multi cursor
Plug 'terryma/vim-multiple-cursors'
Plug 'ghifarit53/tokyonight-vim'
Plug 'liuchengxu/vista.vim'
Plug 'thosakwe/vim-flutter'
Plug 'jremmen/vim-ripgrep'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'previm/previm'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'
if has('nvim')
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'jparise/vim-graphql'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-fugitive'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'junegunn/gv.vim'
Plug 'easymotion/vim-easymotion'
Plug 'glidenote/memolist.vim'
Plug 'HerringtonDarkholme/yats.vim'

call plug#end()

filetype plugin indent on
let mapleader="\<Space>"

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-p>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["~/.vim/UltiSnips"]

let g:user_emmet_leader_key='<C-E>'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

"quickrun
nnoremap <Leader>go :QuickRun<CR>
nnoremap <C-U>qr :QuickRun<CR>
let g:quickrun_config={'*': {'split': ''}}
let g:quickrun_config.cpp = {
            \   'command': 'g++',
            \   'cmdopt': '-std=c++11'
            \ }

"vimshell
nnoremap <Leader>sh :vertical terminal<CR>
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]


map <Leader>p :Vista!!<CR>

"" Tabs
nnoremap K gt
nnoremap J gT

nnoremap R :join<CR>
nnoremap <Leader>t :tabnew<CR>

"" ignore wrap
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

"" + => increment
nnoremap + <C-a>

"" - => decrement
nnoremap - <C-x>

" base
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast
set backspace=indent,eol,start
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set splitright
set splitbelow
set hidden
set hlsearch
set incsearch
set ignorecase
set smartcase
set nobackup
set noswapfile
set fileformats=unix,dos,mac
set foldlevel=99
set cursorline
syntax on


let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set ruler
set number
set scrolloff=3
set laststatus=2
set modeline
set modelines=10
set title
set titleold="Terminal"
set titlestring=%F
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set autoread
set noerrorbells visualbell t_vb=
set mouse=a
set whichwrap=b,s,h,l,<,>,[,]
if has('nvim')
  set clipboard+=unnamedplus
  set guicursor=a:blinkon0
else
  set guicursor=i:blinkwait700-blinkon400-blinkoff250
  set clipboard+=unnamed,autoselect
endif
"UI
set termguicolors
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#virtualenv#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_disable_italic_comment = 0
let g:airline_theme = "tokyonight"
colorscheme tokyonight

if has('nvim')
  highlight CursorLine term=bold cterm=bold guibg=Grey40
  highlight Comment guibg=#3e5380 guifg=#FFFFFF
  highlight Visual cterm=reverse ctermbg=NONE
  highlight Visual guifg=#FFFFFF guibg=SlateBlue gui=none term=reverse cterm=reverse
  highlight LineNr term=bold cterm=NONE ctermfg=LightBlue ctermbg=NONE gui=NONE guifg=LightBlue guibg=NONE
else
  highlight Comment guibg=#FFFFFF guifg=#3e5380
  highlight Visual cterm=reverse ctermbg=NONE
  hi Visual guibg=#FFFFFF guifg=SlateBlue gui=none
  hi LineNr term=bold cterm=NONE ctermfg=LightBlue ctermbg=NONE gui=NONE guifg=LightBlue guibg=NONE
endif

" auto opening quickfix window using vim grep
autocmd QuickFixCmdPost *grep* cwindow

" don't comment out when go to next line
autocmd FileType * setlocal formatoptions-=ro

set completeopt=menuone,noinsert,noselect,preview

" multi cursor Default mapping
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-j>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-j>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-j>'
let g:multi_cursor_prev_key            = '<C-k>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"vista
let g:vista_default_executive = 'coc'
let g:vista_update_on_text_changed = 1
let g:vista#renderer#enable_icon = 0
let g:vista_sidebar_width = 35

"previm
let g:previm_open_cmd = 'open -a open -a Google\ Chrome'

"coc.nvim
let g:coc_global_extensions = [
      \'coc-json',
      \'coc-flutter',
      \'coc-tsserver',
      \'coc-fzf-preview',
      \'coc-go',
      \'coc-git',
      \'coc-highlight',
      \'coc-java',
      \'coc-markdownlint',
      \'coc-phpls',
      \'coc-python',
      \'coc-rls',
      \'coc-rust-analyzer',
      \'coc-stylelint',
      \'coc-sql',
      \'coc-vimlsp',
      \'coc-xml',
      \'coc-yaml',
      \'coc-prettier',
      \'coc-html',
      \'coc-solargraph',
      \'coc-prisma',
      \'coc-sh',
      \'coc-yank',
      \'coc-eslint',
      \'coc-pairs',
      \'coc-css',
      \'coc-db'
      \]
nnoremap <Leader>c  :call CocActionAsync('highlight')<CR>
nmap <silent> <C-d> <Plug>(coc-definition)
nmap <silent> <C-l> <Plug>(coc-diagnostic-next)
nmap <Leader>ic <Plug>(coc-diagnostic-info)
nmap <Leader>iw  :CocDiagnostics<CR>
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ccn <Plug>(coc-rename)
nmap <silent> cca <Plug>(coc-codeaction)
nmap <silent> ccl <Plug>(coc-codeaction-line)

"FZF
autocmd BufWritePre *.ts,*.js,*.go :call CocAction('runCommand', 'editor.action.organizeImport') | sleep 100m
nmap <C-p> :Files<CR>

"supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

"" go back from definition
nnoremap <c-t> <c-o>

" defx
nnoremap <silent><C-n> :<C-u>Defx -listed -resume
      \ -columns=indent:mark:icon:icons:filename:git:size
      \ -buffer-name=tab`tabpagenr()`
      \ `expand('%:p:h')` -search=`expand('%:p')`<CR>
nnoremap <silent>fi :<C-u>Defx -new `expand('%:p:h')` -search=`expand('%:p')`<CR>

autocmd FileType defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
	  " Define mappings
	  nnoremap <silent><buffer><expr> <CR>
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> c
	  \ defx#do_action('copy')
	  nnoremap <silent><buffer><expr> m
	  \ defx#do_action('move')
	  nnoremap <silent><buffer><expr> p
	  \ defx#do_action('paste')
	  nnoremap <silent><buffer><expr> l
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> t
	  \ defx#do_action('open', 'tabnew')
	  nnoremap <silent><buffer><expr> <C-v>
	  \ defx#do_action('open', 'vsplit')
	  nnoremap <silent><buffer><expr> P
	  \ defx#do_action('open', 'pedit')
	  nnoremap <silent><buffer><expr> o
	  \ defx#do_action('open_or_close_tree')
	  nnoremap <silent><buffer><expr> K
	  \ defx#do_action('new_directory')
	  nnoremap <silent><buffer><expr> N
	  \ defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> M
	  \ defx#do_action('new_multiple_files')
	  nnoremap <silent><buffer><expr> C
	  \ defx#do_action('toggle_columns',
	  \                'mark:indent:icon:filename:type:size:time')
	  nnoremap <silent><buffer><expr> S
	  \ defx#do_action('toggle_sort', 'time')
	  nnoremap <silent><buffer><expr> dd
	  \ defx#do_action('remove')
	  nnoremap <silent><buffer><expr> r
	  \ defx#do_action('rename')
	  nnoremap <silent><buffer><expr> !
	  \ defx#do_action('execute_command')
	  nnoremap <silent><buffer><expr> x
	  \ defx#do_action('execute_system')
	  nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('yank_path')
	  nnoremap <silent><buffer><expr> .
	  \ defx#do_action('toggle_ignored_files')
	  nnoremap <silent><buffer><expr> ;
	  \ defx#do_action('repeat')
	  nnoremap <silent><buffer><expr> h
	  \ defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')
	  nnoremap <silent><buffer><expr> q
	  \ defx#do_action('quit')
	  nnoremap <silent><buffer><expr> <Space>
	  \ defx#do_action('toggle_select') . 'j'
	  nnoremap <silent><buffer><expr> *
	  \ defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr> j
	  \ line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr> k
	  \ line('.') == 1 ? 'G' : 'k'
	  nnoremap <silent><buffer><expr> <C-l>
	  \ defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> <C-g>
	  \ defx#do_action('print')
	  nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
	endfunction

call defx#custom#column('icon', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ 'root_icon': ' ',
      \ })
call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : 'M',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })
call defx#custom#option('_', {
      \ 'winwidth': 40,
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 1,
      \ 'buffer_name': 'exlorer',
      \ })

" redraw with buffer
autocmd BufWritePost * call defx#redraw()
autocmd BufEnter * call defx#redraw()

" Move to word
map  <Leader>f <Plug>(easymotion-bd-w)

autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd   silent! CocEnable

nnoremap <Leader>mn  :MemoNew<CR>
nnoremap <Leader>ml  :MemoList<CR>
nnoremap <Leader>mg  :MemoGrep<CR>
let g:memolist_memo_suffix = "md"
" let g:memolist_fzf = 1
let g:memolist_ex_cmd = 'Defx'

map <c-/><c-/> :TComment<CR>
autocmd CursorHold * silent call CocActionAsync('highlight')
