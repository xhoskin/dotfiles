if has("terminfo")
    let &t_Co=16
    let &t_AB="\<Esc>[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm"
    let &t_AF="\<Esc>[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm"
else
    let &t_Co=16
    let &t_Sf="\<Esc>[3%dm"
    let &t_Sb="\<Esc>[4%dm"
endif

colors slate
lan mes en_US.utf8

" для работы в tmux
set ttytype=xterm
set term=xterm

set nobackup       
set nowritebackup  
set noswapfile     

set autowrite
set autowriteall

" мышка в терминале
set mouse=a

"
" == Плагины
"------------------------------------------
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" плагины синтаксиса
Plugin 'JulesWang/css.vim'
Plugin 'hail2u/vim-css3-syntax.git'
Plugin 'groenewege/vim-less.git'
"Plugin 'skammer/vim-css-color.git'

Plugin 'digitaltoad/vim-jade'
Plugin 'evidens/vim-twig'
Plugin 'vim-scripts/django.vim'
Plugin 'aaronj1335/underscore-templates.vim'
Plugin 'othree/html5.vim'

" функциональные плагины
Plugin 'junegunn/vim-easy-align'
Plugin 'mattn/emmet-vim.git'
"Plugin 'miripiruni/CSScomb-for-Vim.git'
Plugin 'nelstrom/vim-qargs'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/CSS-one-line--multi-line-folding'
Plugin 'yegappan/mru'
Plugin 'majutsushi/tagbar'
Plugin 'jiangmiao/auto-pairs.git'
Plugin 'juneedahamed/svnj.vim'
"Plugin 'rking/ag.vim'
"Plugin 'benmills/vimux'
"Plugin 'mklabs/grunt.vim'

"Snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'bonsaiben/bootstrap-snippets'  
Plugin 'honza/vim-snippets'

" навигация по файлам
"Plugin 'project.tar.gz'
"Plugin 'shemerey/vim-indexer'
 
" попробую позже
"Plugin 'mileszs/ack.vim'
"Plugin 'tpope/vim-abolish'
"Plugin 'exUtility'

call vundle#end()
filetype plugin indent on    " required!
filetype on                  " required!



"
" == Горячие клавиши
"------------------------------------------

" <C-x> - вырезать
vmap <C-x> "*d
" <C-v> - вставить
map <C-Insert> "*y
map <S-Insert> "*p

" <C-@>
nmap <C-@> <C-]>

" В командной строке:
" <C-p>|<C-n> - следущая|предыдущая команда из истории
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" В командной строке и режиме ввода:
" <C-f>|<C-b> - вправо|влево
cnoremap <C-f> <Right>
inoremap <C-f> <Right>
cnoremap <C-b> <Left>
inoremap <C-b> <Left>
" <C-a>|<C-e> - в начало|конец
cnoremap <C-a> <Home>
inoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-e> <End>
          
" переключения между окнамии и вкладками
map <S-Tab> <C-w>w
map <C-Tab> :tabn<CR>
map <CS-Tab> :tabp<CR>

"F1 - показать имя редактируемого файла (вместо справки)
map <F1> g<C-G>

" F2 - сохранить файл
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i
" C-F2 - сохранить файл
nmap <C-F2> :wall<cr>
vmap <C-F2> <esc>:wall<cr>i
imap <C-F2> <esc>:wall<cr>i

" F7 - поиск vimgrep по текущей папке
"nmap <F7> :vimgrep // *<Left><Left><Left>
nmap <F7> :grep -r --exclude=*~ --exclude-dir=finish  "" templates<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
 
" F8 - вкл/выкл перенос длинных строк
map <F8> :set wrap!<cr>

" F9 - CSScomb
nmap <F9> :CSScomb<cr>

" F11 - открыть во вкладке папку со сниппетами
nmap <F11> :tabe C:\Program\ Files\vim\vimfiles\snippets\<cr>

" Shift-F12 - обозреватель файлов:set directory=$HOME/.vim/swapfiles//
map <S-F12> :Vex z: <cr><C-W>20\|

" отключаем сочетание K, случайно срабатывающее на caps-lock
nmap K <Nop>



"
" == Базовые настройки
"------------------------------------------

"показать номера строк
set number
"преобразовать табы в пробелы
set expandtab
"размер табулации по умолчанию
set shiftwidth=4 
set softtabstop=4 
set tabstop=4
"при переключении буферов файлы не будут выгружаться из памяти
set hidden


"не переносить длинные строки
set nowrap
" Перенос строк по словам, а не по буквам
set linebreak
" Помечаем перенесенные строки знаком >>>
set showbreak=>>>

"скрыть панель инструментов
set guioptions-=T
"при наборе шаблона поиска сразу переходить на первое совпадение
set incsearch
"не подсвечивать все совпадения при поиске
set nohlsearch
"не учитывать регистр символов при поиске
set ignorecase
"не издавать противный звуковой сигнал
set vb t_vb=
"не создавать swap-файл
set noswapfile
"подсвечивать текущую строку
"set cursorline

"сохранять бэкапы в домашнюю папку
set backupdir=$HOME\.vim\\

"Project plugin options
let g:proj_flags="cgimt"
set wildignore=*~



"
" == Исправление проблем с раскадкой клавиатур
"------------------------------------------

"для правильного перехода по словам (w) в русском тексте
set iskeyword=@,a-z,A-Z,48-57,_,128-175,192-255
"для правильной работы команд на русской раскладке
set langmap=й\\;,ц\\,у.,кp,еy,нf,гg,шc,щr,зl,х/,ъ@,фa,ыo,вe,аu,пi,рd,оd,лt,дn,жs,э-,я\\',чq,сj,мk,иx,тb,ьm,бw,юv,Й:,Ц<,У>,КP,ЕY,НF,ГG,ШC,ЩR,ЗL,Х?,Ъ\\',ФA,ЫO,ВE,АU,ПI,РD,ОH,ЛT,ДN,ЖS,Э_,Я\\",ЧQ,СJ,МK,ИX,ТB,ЬM,БW,ЮV,ё$
"set langmap=\\;q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,-\\',\\'z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\\",\\"Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?,йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фs,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э\',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х[,Ъ],ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>

ino <C-C> <Esc>



"
" == Скрипты
"------------------------------------------

"открывать файлы кода в нужном формате
autocmd BufRead,BufNewFile *.cshtml set filetype=html
autocmd BufRead,BufNewFile *.twig set filetype=html
autocmd BufRead,BufNewFile *.less set filetype=css
autocmd BufRead,BufNewFile *.sass set filetype=css

" JSON
augroup json_autocmd 
  autocmd! 
  autocmd FileType json set autoindent 
  autocmd FileType json set formatoptions=tcq2l 
  autocmd FileType json set textwidth=78 shiftwidth=2 
  autocmd FileType json set softtabstop=2 tabstop=8 
  autocmd FileType json set expandtab 
  autocmd FileType json set foldmethod=syntax 
augroup END 

" Insert-only <CAPS-LOCK> on <C-^>
"set imsearch=-1
"set keymap=insert-only_capslock
"set iminsert=0
" black cursor - caps off
":highlight Cursor guifg=NONE guibg=Red
" cyan cursor - caps off
":highlight lCursor guifg=NONE guibg=Cyan

"auto encoding (win7 fix, but breaks gui menu)
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8 bomb
  set fileencodings=utf-8,cp1251,koi8-r,latin1
  set fileformats=dos,unix,mac
endif

" перезагружать vimrc каждый раз, когда его пересохраняют
"if has("autocmd")
"  autocmd bufwritepost .vimrc source $MYVIMRC
"endif

" файлы, которые не будут показываться в netrw
let g:netrw_list_hide='\~,\.git'

" оборачивать по '-' в <?php ?>
autocmd FileType php let b:surround_45 = "<?php \r ?>"
" оборачивать по '/' в <?php /* */ ?>
autocmd FileType php let b:surround_47 = "<?php /* \r */ ?>"
" оборачивать по '?' в <?  ?> 
autocmd FileType html let b:surround_63 = "<? \r ?>"

" расширения, которые будут добавлятсья при переходе по gf
:set suffixesadd+=.php,.less,.css

" используем unix-grep вместо windows-findstr
" set grepprg=\"$VIMRUNTIME\grep\grep.exe\"\ -ni\ $*
set grepformat=%f:%l:%m

" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign with a Vim movement
nmap <Leader>a <Plug>(EasyAlign)

" Repeat alignment in visual mode with . key
vmap . <Plug>(EasyAlignRepeat)

" emmet.vim сниппеты 
let g:user_emmet_settings = {
\    'css': {
\        'snippets': {
\            'ct' : "content:\"\";",
\            'c': 'color:|;',
\            'm:0a': 'margin:0 auto;',
\            'm0a': 'margin:0 auto;',
\            'mw': 'min-width:|;',
\            'mh': 'min-height:|;',
\            'bd+': 'border:1px solid |;',
\            'bdt+': 'border-top:1px solid |;',
\            'bdl+': 'border-left:1px solid |;',
\            'bdr+': 'border-right:1px solid |;',
\            'bdb+': 'border-bottom:1px solid |;',
\            'bg': 'background:|;',
\            'bg+': 'background:url("|") no-repeat;',
\            'bg:i': 'background:url("@{img}|") no-repeat;',
\            'c:bp' : "color:@brand-primary;",
\            'c:bs' : "color:@brand-success;",
\            'c:bw' : "color:@brand-warning;",
\            'c:bd' : "color:@brand-danger;",
\            'c:bi' : "color:@brand-info;",
\            'bg:bp' : "background:@brand-primary;",
\            'bg:bs' : "background:@brand-success;",
\            'bg:bw' : "background:@brand-warning;",
\            'bg:bd' : "background:@brand-danger;",
\            'bg:bi' : "background:@brand-info;",
\            'ff:bs' : "font-family: @font-family-base",
\            'bs:b' : ".box-shadow(|rgba(0,0,0,.2))",
\        }
\     },
\}



"
" == Мои макросы
"------------------------------------------

" ,n - создать в соседнем окне css-класс под курсором
map ,n yi"<S-Tab>o.<C-r>0 {<CR>

" ,* - поиск выделенного текста в соседнем окне
vmap ,* *<S-Tab>nzz

" ,* - поиск текста из буфера обмена
nmap ,* /<C-r>*<cr>zz

" ,gg - grep-поиск в текущей папке (Grep)
nmap ,gg :grep -r "" * --exclude-dir=".svn"<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" ,gl - grep-поиск текущей папке .less файлов (Grep Less)
nmap ,gl :grep -r "" *.less<Left><Left><Left><Left><Left><Left><Left><Left>

" ,gt - grep-поиск в текущей папке .twig файлов (Grep)
nmap ,gg :grep -r "" * --exclude-dir=".svn"<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>


" ,su - включить синтаксис underscore (Syntax Underscore)
nmap ,su :set ft=html<cr>:set syntax=underscore_template<cr>

" ,te - пометить конец тега (Tag End)
nmap ,te vato<C-c>yi"vat<C-c>A <!-- / <C-r>" --><C-c>

" ,e - открыть netrw в текущей папке (Explore)
nmap ,e :Ex<cr>

" ,sh - открыть консоль в текущей папке
nmap ,sh :!start bash --login -i<cr>

" копировать в буфер обмена путь к файлу
if has('win32')
  " ,cs - копирует в буфер только имя файла
  nmap ,cs :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
  " ,cl - копирует в буфер полный путь к файлу
  nmap ,cl :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>
  " ,c8 - копирует в буфер имя в DOS-формате
  nmap ,c8 :let @*=substitute(expand("%:p:8"), "/", "\\", "g")<CR>
else
  nmap ,cs :let @*=expand("%")<CR>
  nmap ,cl :let @*=expand("%:p")<CR>
endif



"
" == Содержание и заголовки для css и js
"------------------------------------------

"создать содержание 
nmap ,mi v"ay:g/\v(\=\=\|\*\*)/y A<CR>g;"apV}:s/  //g<CR>gv:s/== //g<CR>gv:s/** /  /g<CR>

"создать заголовок 1-го уровня
nmap ,m1 o//<CR>// ==<CR>// <CR><C-c>kA-<C-c>59.ka 

"создать заголовок 2-го уровня
nmap ,m2 i<CR>// ** 


"
" == CSS text-objects
"------------------------------------------

"удалить свойство с пробелом после него
nmap dar ?[{<Char-0x7c><Char-0x7c>]<CR>wd/;\s?/e<CR>
"удалить свойство БЕЗ пробела после него
nmap cir ?[{<Char-0x7c><Char-0x7c>]<CR>wc/;/e<CR>
"TO-DO найти как по науке создовать свои text-objects


"
" == TO-DO
"------------------------------------------

"TO-DO emmet-vim css-свойства в строчку

"плагины
"TO-DO попробовать ide.vim
"TO-DO Project: открывать в vs
"TO-DO что такое git-grep
"TO-DO ack
"TO-DO попробовать https://github.com/mozilla/doctorjs

