" vim: et ts=2 sts=2 sw=2 tw=80

set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'scrooloose/nerdtree',
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-commentary'
Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-fugitive'
Plugin 'mbbill/undotree'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Raimondi/delimitMate'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'easymotion/vim-easymotion'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'thisivan/vim-matchit'
Plugin 'guns/xterm-color-table.vim'
call vundle#end()

filetype indent on
filetype plugin on

set background=light
"colorscheme solarized
" colorscheme Tomorrow

highlight Pmenu ctermfg=232 ctermbg=253
highlight PmenuSel ctermfg=232 ctermbg=248
hi Search term=standout ctermfg=8 ctermbg=229

" source ~/.vim/chant_theme.vim
" let g:airline_theme='chant_theme'

let mapleader = " "
map <space> <nop>

syntax on

nmap <f2> d:%s///gc<left><left><left>

" Sets how many lines of history VIM has to remember
set history=1000

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git etc. anyway...
" set nobackup
" set nowb
" set noswapfile

" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" Fast saving
map <Leader>w :w<CR>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
" source $VIMRUNTIME/delmenu.vim
" source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Height of the command bar
set cmdheight=1

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set cursorline
" set number

" set colorcolumn=81

set ignorecase
set smartcase
set hlsearch
set incsearch
exec "nohlsearch"
noremap <Leader>/ :%s///gn<CR>

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

"清屏并暂时关闭查找高亮
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set autoindent
set si "Smart indent
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set pastetoggle=<f4>

"展开当前文件所在目录
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'
"====================

nmap <silent> <leader>,t :tabprevious<CR>
nmap <silent> <leader>,T :tabfirst<CR>
nmap <silent> <leader>.t :tabnext<CR>
nmap <silent> <leader>.T :tablast<CR>

nmap <silent> <leader>,b :bprevious<CR>
nmap <silent> <leader>,B :bfirst<CR>
nmap <silent> <leader>.b :bnext<CR>
nmap <silent> <leader>.B :blast<CR>

map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>h <C-W>h
map <leader>l <C-W>l

noremap ;; ;
noremap ; `

set ttimeoutlen=50
set timeoutlen=1000
set updatetime=200

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

"ctags
nnoremap <f5> :!ctags -R<CR>

map <LEADER>ss :set spell

map <up> :res +3<CR>
map <down> :res -3<CR>
map <left> :vertical resize-3<CR>
map <right> :vertical resize+3<CR>

nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr>

" ===
" ===Signify
" ===
map ,d :SignifyHunkDiff<CR>

" ===
" ===airline
" ===
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.spell = 'Ꞩ'
" let g:airline_symbols.notexists = 'Ɇ'
" let g:airline_symbols.whitespace = 'Ξ'
" let g:airline_section_a = airline#section#create(['mode', '  ', 'branch'])
" let g:airline_highlighting_cache = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_detect_paste=1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_mode_map = {
  \ '__' : '--',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V-L',
  \ '' : 'V-B',
  \ 's'  : 'S',
  \ 'S'  : 'S-L',
  \ '' : 'S-B',
  \ 't'  : 'T',
  \ 'ic'  : 'I-C'
  \ }
let g:airline_section_z = airline#section#create(['%#__accent_bold#%l%\/%L%#__restore__#', ' : %c'])
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='sol'
" nmap ,m yw:AirlineTheme<space><C-r>0<CR>

" ===
" === Nerdtree
" ===
let NERDTreeMapCloseDir = "n"
let NERDTreeMapCloseChildren = "N"
let g:NERDTreeMapPreview = "h"
let NERDTreeShowBookmarks=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ==
" == Nerdtree-tabs
" ==
map <leader>tt :NERDTreeTabsOpen<CR> :NERDTreeSteppedOpen<CR>
map <leader>tT :NERDTreeTabsClose<CR>

" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "M",
  \ "Staged"    : "S",
  \ "Untracked" : "U",
  \ "Renamed"   : "R",
  \ "Unmerged"  : "ᶴ",
  \ "Deleted"   : "D",
  \ "Dirty"     : "˜",
  \ "Clean"     : "ᵅ",
  \ "Unknown"   : "?"
  \ }

" ===
" === delimitMate
" ===
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1
let delimitMate_excluded_regions = "Comment"
imap <BS> <Plug>delimitMateBS
imap <C-h> <Plug>delimitMateBS

" ===
" === indent guides
" ===
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=255
hi IndentGuidesEven ctermbg=253
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" ===
" === easymotion
" ===
noremap ,, ,
let g:EasyMotion_do_mapping = 0
map ,w <Plug>(easymotion-w)
map ,W <Plug>(easymotion-W)
map ,b <Plug>(easymotion-b)
map ,B <Plug>(easymotion-B)
map ,j <Plug>(easymotion-j)
map ,k <Plug>(easymotion-k)
map ,f <Plug>(easymotion-f)
map ,F <Plug>(easymotion-F)
map ,t <Plug>(easymotion-t)
map ,T <Plug>(easymotion-T)
map ,e <Plug>(easymotion-e)
map ,E <Plug>(easymotion-E)
map ,ge <Plug>(easymotion-ge)
map ,gE <Plug>(easymotion-gE)
map ,n <Plug>(easymotion-n)
map ,N <Plug>(easymotion-N)
map s <Plug>(easymotion-s)
map S <Plug>(easymotion-bd-t)
map ,. <Plug>(easymotion-repeat)
map ,h <Plug>(easymotion-bd-jk)

"##### auto fcitx  ###########
let g:input_toggle = 0
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction
function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction
"退出插入模式
autocmd InsertLeave * call Fcitx2en()
"进入插入模式
autocmd InsertEnter * call Fcitx2zh()
"##### auto fcitx end ######

" ===
" ===fugitive
" ===
map <Leader>gw :Gwrite<CR>
map <Leader>gd :Git difftool<CR>
map <Leader>ggd :Git difftool -y<CR>
