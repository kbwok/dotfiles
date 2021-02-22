set rtp +=~/.vim
set rtp+=/path/to/lldb.nvim
" setting
if has('vim_starting')
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  if !executable("curl")
    silent !\curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}


if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('wsdjeg/dein-ui.vim')

  call dein#add('Shougo/vimproc.vim', {
      \   'build' : 'make',
      \   'lazy': 1,
      \ })
  call dein#add('thinca/vim-quickrun', {
      \   'depends': 'vimproc.vim',
      \   'on_cmd': 'QuickRun',
      \ })
  call dein#add('vim-airline/vim-airline')
  call dein#add('tpope/vim-surround')
  call dein#add('ervandew/supertab')
  call dein#add('mattn/emmet-vim')
  call dein#add('SirVer/ultisnips')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('maxmellon/vim-jsx-pretty')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('ghifarit53/tokyonight-vim')
  call dein#add('liuchengxu/vista.vim')
  call dein#add('thosakwe/vim-flutter')
  call dein#add('godlygeek/tabular')
  call dein#add('previm/previm')
  call dein#add('jparise/vim-graphql')
  call dein#add('tpope/vim-dadbod')
  call dein#add('tpope/vim-fugitive')
  call dein#add('kristijanhusak/vim-dadbod-ui')
  call dein#add('junegunn/gv.vim')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('glidenote/memolist.vim')
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('ianks/vim-tsx')
  call dein#add('tyru/eskk.vim')
  call dein#add('Yggdroot/indentLine')
  call dein#add('tyru/open-browser.vim')
  call dein#add('ivanov/vim-ipython')
  call dein#add('https://github.com/kbwo/coc-denite')
  call dein#add('hrsh7th/vim-gitto')
  call dein#add('posva/vim-vue')
  call dein#add('leafOfTree/vim-vue-plugin')
  call dein#add('simeji/winresizer')
  call dein#add('dart-lang/dart-vim-plugin')
  call dein#add('jackguo380/vim-lsp-cxx-highlight')
  call dein#add('junegunn/vader.vim')
  call dein#add('Shougo/defx.nvim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('liuchengxu/vim-clap')
  call dein#add('Shougo/context_filetype.vim')
  call dein#add('osyo-manga/vim-precious')
  call dein#add('xuhdev/vim-latex-live-preview', {
        \'on_ft': 'tex',
        \})
  call dein#add('Shougo/deol.nvim', {
      \   'build' : 'make',
      \ })
  call dein#add('raimon49/requirements.txt.vim', {
      \   'on_ft' : 'requirements',
      \ })
  call dein#add('neoclide/coc.nvim', {
      \   'merged': 0,
      \   'rev': 'release'
      \})

  call dein#end()
  call dein#save_state()
endif

call dein#remote_plugins()

if dein#check_install()
  call dein#install()
endif

let g:vim_vue_plugin_load_full_syntax = 1
inoremap <c-u> <Nop>

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


map <Leader>o :Vista!!<CR>

"" Tabs
map K gt
map J gT

"" scroll
nnoremap <Leader>j <c-d>
nnoremap <Leader>k <c-u>

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
let g:airline_theme = "tokyonight"
colorscheme tokyonight
hi Comment guifg=darkgray

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

highlight CursorLine term=bold cterm=bold guibg=Grey40
if has('nvim')
  highlight Visual guifg=#FFFFFF guibg=SlateBlue gui=none term=reverse cterm=reverse
else
  hi Visual guibg=#FFFFFF guifg=SlateBlue gui=none
endif

highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight SpecialKey ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

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

"coc.nvim
let g:coc_global_extensions = [
      \'coc-json',
      \'coc-flutter',
      \'coc-tsserver',
      \'coc-go',
      \'coc-git',
      \'coc-highlight',
      \'coc-java',
      \'coc-markdownlint',
      \'coc-phpls',
      \'coc-python',
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
      \'coc-calc',
      \'coc-json',
      \'coc-prisma',
      \'coc-sh',
      \'coc-sourcekit',
      \'coc-tailwindcss',
      \'coc-cssmodules',
      \'coc-vetur',
      \'coc-clangd',
      \'coc-denoland',
      \'coc-emmet',
      \'coc-post',
      \'coc-docker',
      \'coc-react-refactor',
      \'coc-styled-components',
      \'coc-docker',
      \'coc-vimtex',
      \'coc-db'
      \]
nnoremap <Leader>c  :call CocActionAsync('highlight')<CR>
nmap <silent> <C-d> <Plug>(coc-definition)
nmap <silent> <Leader>v<C-d> :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> <C-l> <Plug>(coc-diagnostic-next)
nmap <Leader>ic <Plug>(coc-diagnostic-info)
nmap <Leader>iw  :CocDiagnostics<CR>
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ccn <Plug>(coc-rename)
nmap <silent> cca <Plug>(coc-codeaction)
nmap <silent> ccl <Plug>(coc-codeaction-line)

" let g:prettier#autoformat = 1

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
  nnoremap <silent><buffer><expr> <Leader>m
        \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
        \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
        \ defx#do_action('open')
  nnoremap <silent><buffer><expr> <Leader>t
        \ defx#do_action('open', 'tabnew')
  nnoremap <silent><buffer><expr> <Leader>v
        \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> <Leader>s
        \ defx#do_action('open', 'split')
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
  nnoremap <silent><buffer><expr> dl
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
  nnoremap <silent><buffer><expr> m
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
  nnoremap <silent><buffer><expr> cha
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
let g:memolist_ex_cmd = 'Defx'

map <c-/><c-/> :TComment<CR>
autocmd CursorHold * silent call CocActionAsync('highlight')

if empty(glob('~/.config/nvim/eskk.vim/SKK-JISYO.L'))
  silent !curl -fLo ~/.config/nvim/eskk.vim/SKK-JISYO.L --create-dirs
        \ http://openlab.jp/skk/skk/dic/SKK-JISYO.L
endif
let g:eskk#directory = '~/.config/nvim/eskk.vim'

let g:eskk#large_dictionary = {
      \ 'path': '~/.config/nvim/eskk.vim/SKK-JISYO.L',
      \ 'sorted': 1,
      \ 'encoding': 'euc-jp',
      \ }

let g:eskk#dictionary = {
      \ 'path': '~/.config/nvim/eskk.vim/user.dict',
      \ 'sorted': 0,
      \ 'encoding': 'utf-8',
      \}

autocmd User eskk-initialize-pre call s:eskk_initial_pre()
function! s:eskk_initial_pre()
  let t = eskk#table#new('rom_to_hira*', 'rom_to_hira')
  call t.add_map('pc', '・')
  call t.add_map('.', '.')
  call t.add_map(',', ',')
  call eskk#register_mode_table('hira', t)
endfunction

autocmd  User eskk-enable-pre  silent! CocDisable
autocmd  User eskk-disable-post silent! CocEnable

function! s:my_bookmark_color() abort
  let s:scl_guibg = matchstr(execute('hi SignColumn'), 'guibg=\zs\S*')
  if empty(s:scl_guibg)
    let s:scl_guibg = 'NONE'
  endif
  exe 'hi MyBookmarkSign guifg=' . s:scl_guibg
endfunction
call s:my_bookmark_color() " don't remove this line!

augroup UserGitSignColumnColor
  autocmd!
  autocmd ColorScheme * call s:my_bookmark_color()
augroup END

call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#alias('source', 'grep/git', 'grep')
call denite#custom#var('file/rec/git', 'command',
      \ ['rg', '--files', '--hidden', '--glob', '!.git', '--color', 'never'])
call denite#custom#var('file/rec', 'command',
      \ ['rg', '--files', '--hidden','--no-ignore', '--glob', '!.git', '--color', 'never'])
call denite#custom#var('grep/git', {
      \ 'command': ['rg', '--threads', '1'],
      \ 'recursive_opts': [],
      \ 'final_opts': [],
      \ 'pattern_opt': ['--regexp'],
      \ 'separator': ['--'],
      \ 'default_opts': ['--smart-case', '--vimgrep', '--no-heading'],
      \ })
call denite#custom#var('grep', {
      \ 'command': ['rg', '--threads', '1'],
      \ 'recursive_opts': [],
      \ 'final_opts': [],
      \ 'pattern_opt': ['--regexp'],
      \ 'separator': ['--'],
      \ 'default_opts': ['--smart-case', '--no-ignore', '--glob', '!.git', '--vimgrep', '--no-heading'],
      \ })
call denite#custom#var('buffer', 'date_format', '')
call denite#custom#filter('matcher/clap',
      \ 'clap_path', expand('~/.vim/plugged/vim-clap'))
call denite#custom#source('file/rec', 'matchers', [
      \ 'matcher/clap',
      \ ])
call denite#custom#source('file/rec/git', 'matchers', [
      \ 'matcher/clap',
      \ ])

nmap <c-p> :Denite file/rec/git<CR>
nmap <Leader>p :Denite file/rec<CR>
nmap <Leader>d :Denite directory_rec<CR>
nmap <Leader>r :<C-u>Denite grep/git:. -no-empty<CR>
nmap <Leader>gr :<C-u>Denite grep:. -no-empty<CR>
nmap <Leader>gb :<C-u>DeniteGitto gitto/branch<CR>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> <Leader>t
        \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <Leader>v
        \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <Leader>s
        \ denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> <Leader>d
        \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> m
        \ denite#do_map('toggle_select').'j'
endfunction

let g:coc_enable_locationlist = 0
autocmd! User CocLocationsChange Denite -smartcase -auto-action=preview coc-jump-locations
command! -nargs=0 Prettier :CocCommand prettier.formatFile
