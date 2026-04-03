syntax on
colorscheme desert              " defines the color scheme of the syntax highlighting

set ic                          " Case insensitive search
set number                      " show line number
set nocompatible                " (cp) use Vim defaults (much better)
set ruler                       " (ru) show the cursor position at all times
set showcmd                     " (sc) display an incomplete command in the lower right
set hidden                      "      just hide file instead of closing when changing buffers
set history=50                  " (hi) keep 50 lines of command history
set number                      " (nu) show line numbers
set showmatch                   " (sm) briefly jump to matching bracket when inserting one
set autoindent                  " (ai) turn on auto-indenting (great for programers)
set copyindent                  " (ci) when auto-indenting, use the indenting format of the previous line

set tabstop=4                   " (ts) width (in spaces) that a <tab> is displayed as
set shiftwidth=4                " (sw) width (in spaces) used in each step of autoindent (aswell as << and >>)
set expandtab " expand tab to spaces
set smartcase
set backspace=indent,eol,start

" yank and paste from system clipboard so don't need to use "+y
set clipboard=unnamedplus

" Windows
set splitbelow
set splitright
map <C-w>k  <C-w>c
map <C-w>t  <C-w>T

" So don't lose selection when indenting multiple times
" http://stackoverflow.com/questions/5248959/how-to-tab-without-losing-block
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv

autocmd FileType xhtml,html,htm,xml,javascript setlocal tabstop=2
autocmd FileType xhtml,html,htm,xml,javascript setlocal shiftwidth=2

" Use hard tabs in makefiles
autocmd FileType make setlocal noexpandtab

" Use hard tabs and edit files inplace in crontab
autocmd FileType crontab set noexpandtab nobk nowb

" putty is an xterm that conforms to xterm2 mouse handling
set term=xterm-color ttym=xterm2 mouse=a

" Tab shortcuts
nnoremap t<Up> :tabfirst<CR>
nnoremap t<Right> :tabnext<CR>
nnoremap t<Left> :tabprev<CR>
nnoremap t<Down> :tablast<CR>
nnoremap tt  :tabedit<Space>

" Buffer shortcuts
nnoremap gt :bnext<CR>
nnoremap gT :bprevious<CR>
nmap <leader>b :enew<cr>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

highlight Error ctermbg=red ctermfg=white guibg=#d72323 guifg=white
call matchadd('Error', '\t\s')  " Tabs before spaces
call matchadd('Error', '\s\t')  " Spaces before tabs
" call matchadd('Error', '\%>120v.\+') " Long lines
call matchadd('Error','\s\+$') " Trailing spaces
call matchadd('Error','\t\+$') " Trailing tabs

" Run flake8 checks on every save for python files.
" autocmd BufWritePost *.py call Flake8()

" set spellfile=~/.vim-spellfile.utf8.add
" Spell checking.
hi SpellBad ctermbg=1 ctermfg=16
hi SpellCap ctermbg=1 ctermfg=16
hi SpellLocal ctermbg=1 ctermfg=16
hi SpellRare ctermbg=1 ctermfg=16
