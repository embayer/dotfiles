"        ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄      ▄████████  ▄████████
"       ███    ███ ███  ▄██▀▀▀███▀▀▀██▄   ███    ███ ███    ███
"       ███    ███ ███▌ ███   ███   ███   ███    ███ ███    █▀
"       ███    ███ ███▌ ███   ███   ███  ▄███▄▄▄▄██▀ ███
"       ███    ███ ███▌ ███   ███   ███ ▀▀███▀▀▀▀▀   ███
"       ███    ███ ███  ███   ███   ███ ▀███████████ ███    █▄
" ████  ███    ███ ███  ███   ███   ███   ███    ███ ███    ███
" ████   ▀██████▀  █▀    ▀█   ███   █▀    ███    ███ ████████▀
"                                                ███    ███

" ASCII-Art credits: http://patorjk.com/software/taag/#p=display&f=Delta%20Corps%20Priest%201&t=.vimrc

" TODO
" append new tabs at the end
" sublime like tmpfiles
" braces behavior
" ctrl-p include last files

" plugins {{{

    " vundle
    " {
        " :PluginInstall to install
        set nocompatible              " be iMproved, required
        filetype off                  " required
        " set the runtime path to include Vundle and initialize
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
        " let Vundle manage Vundle, required
        Plugin 'gmarik/Vundle.vim'

    " }

    Plugin 'scrooloose/nerdtree'
    Plugin 'bling/vim-airline'
    Plugin 'kien/ctrlp.vim'
    Plugin 'vim-scripts/tComment'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'tpope/vim-surround'
    Plugin 'sjl/gundo.vim'
    Plugin 'embayer/vim_colorschemes'
    " Plugin 'gregsexton/MatchTag'
    Plugin 'nvie/vim-flake8'                            " pip install flake8
    Plugin 'tpope/vim-fugitive'
    Plugin 'Keithbsmiley/swift.vim'
    Plugin 'majutsushi/tagbar'                          " brew install ctags
    Plugin 'mhinz/vim-startify'
    Plugin 'vim-scripts/YankRing.vim'
    Plugin 'itchyny/screensaver.vim'
    Plugin 'itchyny/thumbnail.vim'
    Plugin 'itchyny/calendar.vim'
    Plugin 'vim-scripts/matrix.vim--Yang'
    Plugin 'terryma/vim-expand-region'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'luochen1990/rainbow'
    Plugin 'Shougo/neocomplete.vim'
    " Plugin 'ervandew/supertab'
    Plugin 'scrooloose/syntastic'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'vim-scripts/mru.vim'
    Plugin 'jistr/vim-nerdtree-tabs'
    " Plugin 'vim-scripts/noerrmsg.vim'
    " Plugin 'manuel-colmenero/vim-simple-session'
    " Plugin 'xolox/vim-misc'
    " Plugin 'xolox/vim-session'
    Plugin 'szw/vim-ctrlspace'
    Plugin 'gorodinskiy/vim-coloresque'
    Plugin 'kien/tabman.vim'
    Plugin 'valloric/MatchTagAlways'

    " plugin examples
    " {
        " gitbub
        " {
            "Plugin 'rstacruz/sparkup'
            " subdirectory
            " {
                " The sparkup vim script is in a subdirectory of this repo called vim.
                " Pass the path to set the runtimepath properly.
                "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
            " }
        " }
        " http://vim-scripts.org/vim/scripts.html
        " {
            "Plugin 'L9'
        " }
        " local file
        " {
            "Plugin 'file:///home/markus/path/to/plugin'
        " }
    " }
    call vundle#end()             " required
    filetype plugin indent on     " required
    " }

" }}}

" general {{{

    silent function! OSX()
        return has('macunix')
    endfunction
    silent function! LINUX()
        return has('unix') && !has('macunix') && !has('win32unix')
    endfunction
    silent function! WINDOWS()
        return  (has('win16') || has('win32') || has('win64'))
    endfunction

    set nocompatible        " Must be first line
    if !WINDOWS()
        set shell=/bin/sh
    endif

    set ssop-=options    " do not store global and local values in a session
    set ssop-=folds      " do not store folds

    " store the backup files in this location
    set backup
    set backupdir=~/.vim/backup
    set dir=~/.vim/backup//,/var/tmp//,/tmp//,.
    set writebackup

    " wd is always based on the current file
    set autochdir

    " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
    " across (heterogeneous) systems easier.
    if WINDOWS()
      set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    endif

    " extensions
    autocmd BufNewFile,BufFilePre,BufRead,BufReadPost *.md set filetype=markdown
    autocmd BufNewFile,BufFilePre,BufRead,BufReadPost *.tracwiki set filetype=tracwiki

    " maximal amount of tabs
    set tabpagemax=50
" }}}

" ui {{{

    " syntax highlighting
    syntax on
    syntax enable
    " highlight current line
    set cursorline
    " show line numbers
    set nu
    " no blinking cursor
    set guicursor+=n-v-c:blinkon0
    " font size
    " set guifont=Menlo:h15
    set guifont=Hack:h15
    " Highlight problematic whitespace
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
    " enable mouse usage
    set mouse=a
    " hide mouse cursor while typing
    " move from endofline to startofline
    "set whichwrap+=<,>,[,]     " ! can cause problems
    set whichwrap+=h,l
    " do not fold code
    set nofoldenable
    " highlight current line
    set wildmenu
    " redraw only when we need to
    set lazyredraw

    " disable audio bell
    set noerrorbells
    set novisualbell
    set t_vb=
    autocmd GUIENTER,BufNewFile,BufFilePre,BufRead,BufReadPost set vb t_vb=
    " open every new file in it's own tab
    " :au BufAdd,BufNewFile * nested tab sball
    " :au BufAdd,BufNewFile,BufRead * nested tab sball

    " nativ indent detection
    set autoindent
    set nosmartindent
    " activate language detection
    filetype plugin indent on


    " disable audio bell
    if has('gui_running')
        autocmd GUIEnter * set vb t_vb=
    endif

    " folding
    set foldenable
    set foldmethod=marker
    set foldlevel=0
    " only in vimrc

    " Color
    " {
        if has("gui_macvim")
            set background=dark
            " colorscheme solarized
            colorscheme molokai
            " colorscheme gruvbox
            " colorscheme facebook
            " colorscheme material-theme
            " colorschme pencil
            " colorscheme kalisi
            " colorscheme hemisu
            " colorscheme seoul256
            " colorscheme nuclide
            " colorscheme herald
        else
            colorscheme neonwave
        endif
    " }

" }}}

" keymappings / keybindings {{{

    " hardmode
    nnoremap <Left> <nop>
    nnoremap <Right> <nop>
    nnoremap <Up> <nop>
    nnoremap <Down> <nop>

    " leader-key
    let mapleader=","

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " highlight last inserted text
    nnoremap gV `[v`]

    " switch buffers
    " nnoremap <leader>m :ls<CR>:b<Space>
    " maybe better use szw/vim-ctrlspace

    " move to beginning/end of line
    nnoremap B ^
    nnoremap E $

    " Ctrl-j/k deletes blank line below/above
    nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
    nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
    " Ctrl-j/k inserts blank line below/above
    nnoremap <silent>º :set paste<CR>m`o<Esc>``:set nopaste<CR>
    nnoremap <silent>∆ :set paste<CR>m`O<Esc>``:set nopaste<CR>

    " move lines with Ctrl-J/K
    nnoremap <silent><D-j> :m .+1<CR>==
    nnoremap <silent><D-k> :m .-2<CR>==
    inoremap <silent><D-j> <Esc>:m .+1<CR>==gi
    inoremap <silent><D-k> <Esc>:m .-2<CR>==gi
    vnoremap <silent><D-j> :m '>+1<CR>gv=gv
    vnoremap <silent><D-k> :m '<-2<CR>gv=gv

    " visually select word under cursor
    map ä viwdi
    " visually select line under cursor (without $)
    map ü ^v$<Left>
    " clear highlights
    map ö :nohl<Enter>

    " Enter inserts a blank line before/after the current line
    "nmap <S-Enter> O<Esc>j
    "nmap <CR> o<Esc>k nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

    " OSX {

        if has("gui_macvim")
            " tab navigation
            " in insert mode
            imap <M-D-Right> <Esc><Esc><Esc>:tabnext<CR>
            imap <M-D-Left> <Esc><Esc><Esc>:tabprev<CR>
            " in normal mode
            nnoremap <M-D-Right> :tabnext<CR>
            nnoremap <M-D-Left> :tabprev<CR>
            " Press Ctrl-Tab to switch between open tabs (like browser tabs) to 
            " the right side. Ctrl-Shift-Tab goes the other way.
            imap <C-Tabt> <Esc><Esc><Esc>:tabnext<CR>
            imap <C-S-Tab> <Esc><Esc><Esc>:tabprev<CR>
            noremap <C-Tab> :tabnext<CR>
            noremap <C-S-Tab> :tabprev<CR>
            " move the focused tab
            map <C-H> :execute "tabmove" tabpagenr() - 2 <CR>
            map <C-S-Left> :execute "tabmove" tabpagenr() - 2 <CR>
            map <C-L> :execute "tabmove" tabpagenr() +1 <CR>
            map <C-S-Right> :execute "tabmove" tabpagenr() +1 <CR>

            " Switch to specific tab numbers with Command-number
            noremap <D-1> :tabn 1<CR>
            noremap <D-2> :tabn 2<CR>
            noremap <D-3> :tabn 3<CR>
            noremap <D-4> :tabn 4<CR>
            noremap <D-5> :tabn 5<CR>
            noremap <D-6> :tabn 6<CR>
            noremap <D-7> :tabn 7<CR>
            noremap <D-8> :tabn 8<CR>
            noremap <D-9> :tabn 9<CR>
            " Command-0 goes to the last tab
            noremap <D-0> :tablast<CR>
        endif
    " }

" }}}

" commands {{{

    " pretty print json
    :command Pjson %!python -m json.tool

    " search and replace german html entities
    :command Umlaute %s/ü/\&uuml;/eg | :%s/ä/\&auml;/eg | :%s/ö/\&ouml;/eg | :%s/ß/\&szlig;/eg | :%s/Ü/\&Uuml;/eg | :%s/Ä/\&Auml;/eg | :%s/Ö/\&Ouml;/eg

    " abbrevations
    " {
        autocmd FileType python abbr pdb import pdb; pdb.set_trace()<esc>
        autocmd FileType python abbr ipdb from ipdb import set_trace; set_trace()<esc>
        autocmd FileType python abbr emb from IPython import embed; embed()<esc>
        autocmd FileType python abbr p_utf8 # -*- coding: utf-8 -*-<esc>o<del><esc>
        autocmd FileType python abbr p_author __author__ = "Markus Bayer"<CR><del><esc>o<del>
        abbr vimline # vim: set ft=python ts=4 sw=4 expandtab :<del><esc>
    " }

" }}}

" formatting {{{

    scriptencoding utf-8
    " use indents of 4 spaces
    set shiftwidth=4
    " tabs length is 4 spaces
    set tabstop=4
    " tabs are spaces, not tabs
    set expandtab
    " delete indents
    set softtabstop=4

    " enable copy-paste from system clipboard
    if has('clipboard')
        if LINUX()   " On Linux use + register for copy-paste
            set clipboard=unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

" }}}

" search {{{

    " highlight search terms
    set hlsearch
    " find while typing
    set incsearch
    " case insensitive search
    set ignorecase

" }}}

" plugin settings {{{

    " Airline
    " {
        if !exists('g:airline_symbols')
            let g:airline_symbols = {}
        endif
        " Tabbar
        " let g:airline#extensions#tabline#enabled = 1
        set laststatus=2
        set noshowmode
        let g:airline_left_sep = '»'
        let g:airline_left_sep = ''
        " let g:airline_left_sep = '▶'
        let g:airline_right_sep = '«'
        let g:airline_right_sep = ''
        " let g:airline_right_sep = '◀'
        let g:airline_symbols.linenr = '␊'
        let g:airline_symbols.linenr = '␤'
        let g:airline_symbols.linenr = '¶'
        let g:airline_symbols.branch = '⎇'
        let g:airline_symbols.paste = 'ρ'
        let g:airline_symbols.paste = 'Þ'
        let g:airline_symbols.paste = '∥'
        let g:airline_symbols.whitespace = 'Ξ'

        let g:airline_detect_modified=1
        if has('gui_running')
            let g:airline_theme = 'solarized'
        else
            let g:airline_theme = 'badwolf'
        endif
    " }

    " YouCompleteMe {
        " disable ycm by default in terminal vim
        if !has('gui_running')
            let g:loaded_youcompleteme = 1
        endif
    " }


    " solarized
    " {

        " Set colorscheme to solarized
        " colorscheme solarized

        " Change the Solarized background to dark or light depending upon the time of
        " day (5 refers to 5AM and 17 to 5PM). Change the background only if it is not
        " already set to the value we want.
        function! SetSolarizedBackground()
            if strftime("%H") >= 5 && strftime("%H") < 17
                if &background != 'light'
                    set background=light
                endif
            else
                if &background != 'dark'
                    set background=dark
                endif
            endif
        endfunction

        " Set background on launch
        " call SetSolarizedBackground()

        " Every time you save a file, call the function to check the time and change
        " the background (if necessary).
        if has("autocmd")
            " autocmd bufwritepost * call SetSolarizedBackground()
        endif

    " }


    " NERDTRee
    " {

        let g:NERDTreeBookmarksFile = "~/.vim/NERDTreeBookmarks"
        let g:nerdtree_tabs_open_on_gui_startup=0
        " ctrl ww to toggle
        map <leader>n <plug>NERDTreeTabsToggle<CR>

        if has('gui_running')

            " set NERDTree size
            let NERDTreeWinSize=20
            let NERDTreeShowBookmarks=1
            let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
            let NERDTreeChDirMode=0
            let NERDTreeQuitOnOpen=1
            let NERDTreeMouseMode=2
            let NERDTreeShowHidden=1

            " always present {

                " let NERDTreeKeepTreeInNewTab=1
                " NERDTree on startup and new tab
                " autocmd vimenter * NERDTree
                " autocmd TabEnter * NERDTree

                " focus filebuffer on startup, new buffer and new tab
                " autocmd vimenter * wincmd l
                " autocmd BufNew * wincmd l
                " autocmd TabEnter * wincmd l

                " close all open buffers on entering a window if the only
                autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

                " Initialize NERDTree as needed {
                function! NERDTreeInitAsNeeded()
                    redir => bufoutput
                    buffers!
                    redir END
                    let idx = stridx(bufoutput, "NERD_tree")
                    if idx > -a
                        NERDTreeMirror
                        NERDTreeFind
                        wincmd l
                    endif
                endfunction

            " }

        endif

    " }


    " easymotion
    " {

        " map forward and backword easymotion to f
        nnoremap f H:call EasyMotion#WB(0, 0)<CR>
        let g:EasyMotion_do_mapping = 0 " Disable default mappings

        " Bi-directional find motion
        " Jump to anywhere you want with minimal keystrokes, with just one key binding.
        " `s{char}{label}`
        nmap s <Plug>(easymotion-s)
        " or
        " `s{char}{char}{label}`
        " Need one more keystroke, but on average, it may be more comfortable.
        nmap s <Plug>(easymotion-s2)

        " Turn on case sensitive feature
        let g:EasyMotion_smartcase = 1

        " JK motions: Line motions
        map <Leader>j <Plug>(easymotion-j)
        map <Leader>k <Plug>(easymotion-k)
        map <Leader>w <Plug>(easymotion-w)
        map <Leader>W <Plug>(easymotion-W)

    " }

    " Gundo
    " {

        nnoremap <D-ü> :GundoToggle<CR>

    " }


    " tabbar
    " {

        " Proper Ctags locations
        let g:tagbar_ctags_bin='/usr/local/bin/ctags'
        " jump in when opened
        let g:tagbar_autofocus = 1
        " Default is 40, seems too wide
        let g:tagbar_width=26
        " Display panel with F8
        nmap <F8> :TagbarToggle<CR>
        autocmd BufNewFile,BufReadPost *.py let b:tagbar_ignore = 1

    " }

    " startify
    " {
        " :SLoad
        " :SSave
        " :SDelete
        let g:startify_bookmarks = [
                \ '~/.vimrc',
                \ '~/.zshrc'
                \ ]
        let g:startify_change_to_dir = 1
        let g:startify_change_to_vcs_root = 0
        let g:startify_custom_footer = ''
        let g:startify_custom_header = [
                \ '',
                \ '    ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄  ',
                \ '   ███    ███ ███  ▄██▀▀▀███▀▀▀██▄',
                \ '   ███    ███ ███▌ ███   ███   ███',
                \ '   ███    ███ ███▌ ███   ███   ███',
                \ '   ███    ███ ███▌ ███   ███   ███',
                \ '   ███    ███ ███  ███   ███   ███',
                \ '   ███    ███ ███  ███   ███   ███',
                \ '    ▀██████▀  █▀    ▀█   ███   █▀ ',
                \ '',
                \ '',
                \ '',
                \ ]
        let g:startify_custom_indices = []
        let g:startify_disable_at_vimenter = 0
        let g:startify_enable_special = 1
        let g:startify_files_number = 10
        let g:startify_list_order = [
                \ ['   My most recently used files'],
                \ 'files',
                \ ['   My most recently used files in the current directory:'],
                \ 'dir',
                \ ['   Sessions:'],
                \ 'sessions',
                \ ['   Bookmarks:'],
                \ 'bookmarks',
                \ ]
        let g:startify_relative_path = 0
        let g:startify_session_autoload = 0
        let g:startify_session_delete_buffers = 0
        let g:startify_session_dir = '~/.vim/session'
        let g:startify_session_persistence = 1
        let g:startify_session_savecmds = []
        let g:startify_session_savevars = [
               \ 'g:startify_session_savevars',
               \ 'g:startify_session_savecmds',
               \ 'g:random_plugin_use_feature'
               \ ]
        let g:startify_skiplist_server = []
        let g:startify_skiplist = []
    " }


    " YankRing
    " {
        nnoremap <silent> <F7> :YRShow<CR>
    " }

    " calendar.vim
    " {
        let g:calendar_google_calendar = 1
    " }


    " expand-region
    " {
        " map + <Plug>(expand_region_expand)
        map - <Plug>(expand_region_shrink)
    " }

    " CtrlP {
        let g:ctrlp_map = '<C-p>'
        nnoremap <leader>. :CtrlP<CR>
        " nnoremap <leader>m :CtrlPMixed<CR>
        let g:ctrlp_match_window = 'bottom,order:ttb'
        let g:ctrlp_switch_buffer = 0
        let g:ctrlp_working_path_mode = 0
        let g:ctrlp_prompt_mappings = {
            \ 'AcceptSelection("e")': ['<c-t>'],
            \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
            \ }
        let g:ctrlp_working_path_mode = 'r'
    " }

    " Rainbow {
        let g:rainbow_active = 0  " 0 if you want to enable it later via :RainbowToggle
    " }

    " ctrlspace {
        set hidden
        nnoremap <leader>m :CtrlSpace L<CR>
    " }

    " MatchTagAlways {
        nnoremap <leader>% :MtaJumpToOtherTag<cr>
    " }

" }}}

" vim: set ft=zsh ts=4 sw=4 expandtab :
