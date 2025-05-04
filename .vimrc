"-----------------------------------------------------------------------------------
" vim ops cmdonfig
"-----------------------------------------------------------------------------------
" most ugly bug because of this, delete character not render, ioremap jj failed
set nocompatible

" enable relative line number
set relativenumber
set number

"always enable statusbar
set laststatus=2
set ruler "enbale right-down row and column num

set shiftwidth=4 "set sw=4
set tabstop=4 "set ts=4
set softtabstop=4
set bs=2
set expandtab
set autoindent

set number
set nowrap

syntax on

"colorscheme include cursor column and line hilight
"colorscheme Tomorrow-Night-Eighties
"colorscheme jellybeans
colorscheme molokai
"colorscheme obsidian
"colorscheme solarized
set cursorline
set cursorcolumn

set hls
set nowrapscan
" set noignorecase
set ignorecase

" Allow backspacing over indent, eol, and the start of an insert
"set backspace=2
"some often behavior when delete,search .... for text edit
set cpoptions=ces$

set showcmd
set showmode

"hide the mouse while typing
set mousehide
"not fold the code by default
set foldlevel=99
set foldmethod=manual

let g:MyWinHeight=20
let g:mapleader = ','

"-----------------------------------------------------------------------------------
" filetype and after filetype vim-plugin(commentary)
"-----------------------------------------------------------------------------------
filetype plugin indent on

"commentary,based different file type insert right comment
nmap <BS> gcc
vmap <BS> gc

"-----------------------------------------------------------------------------------
"config often key mapping
"-----------------------------------------------------------------------------------
inoremap jj <esc>
noremap <silent> ,ns <ESC>:w<CR>
noremap <silent> ,nd <ESC>:%s/\\s*$//g<CR>
noremap <silent> <F6> :2match Underlined /.\\%81v/<CR>

"-----------------------------------------------------------------------------------
" NerdTree config
"-----------------------------------------------------------------------------------
nmap <silent> ,nf :NERDTreeFind<CR>
nmap <silent> <F7> :NERDTreeToggle<CR>
" Close the NERD Tree with Shift-F7
nmap <S-F7> :NERDTreeClose<CR>
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

"-----------------------------------------------------------------------------------
" tagbar config
"-----------------------------------------------------------------------------------
nnoremap <silent> <F8> :TagbarToggle<CR>

"-----------------------------------------------------------------------------------
" statusbar airline
"-----------------------------------------------------------------------------------
"let g:airline_theme='deus'
"let g:airline_theme='luna'
" let g:airline_theme='distinguished'
" let g:airline_theme='bubblegum'
let g:airline_theme='jellybeans'
" let g:airline_theme='solarized'
" let g:airline_solarized_bg='dark'
"g:airline_theme='luna'

" Set the status line the way i like it
" set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
"-----------------------------------------------------------------------------------
" config easymotion, modify the default leader
"-----------------------------------------------------------------------------------
let g:EasyMotion_leader_key = '<Space>'
let g:EasyMotion_smartcase = 1
nmap <space>l <Plug>(easymotion-overwin-line)
nmap <space>s <Plug>(easymotion-sn)

"-----------------------------------------------------------------------------------
" config easymotion, modify the default leader
"-----------------------------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"-----------------------------------------------------------------------------------
" markdwon preview config
"-----------------------------------------------------------------------------------
let g:mkdp_echo_preview_url = 1
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown', 'md', 'mkd']
let g:mkdp_theme = 'dark'

function! MdpOpenPreview(url) abort
	let l:mdp_browser = '/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe'
	let l:mdp_browser_opts = '--new-window'
	if !filereadable(substitute(l:mdp_browser, '\\ ', ' ', 'g'))
		let l:mdp_browser = '/mnt/c/Program\ Files\ \(x86\)/Microsoft/Edge/Application/msedge.exe'
		let l:mdp_browser_opts = '--new-window'
	endif
	execute join(['silent! !', l:mdp_browser, l:mdp_browser_opts, a:url])
	" update the markdown buffer draw
    redraw!
endfunction
let g:mkdp_browserfunc = 'MdpOpenPreview'

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
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

nmap ,ms <Plug>MarkdownPreview
nmap ,mj <Plug>MarkdownPreviewStop
nmap ,mt <Plug>MarkdownPreviewToggle
"-----------------------------------------------------------------------------------
" config md image paste for wsl
"-----------------------------------------------------------------------------------
let g:mdip_imgdir = '.img_' . expand("%:t:r")
let g:mdip_imgdir_absolute =  expand("%:p:h") . "/". g:mdip_imgdir
" echo "absolute " . expand("%:p") . "absolute h " . expand("%:h")

autocmd FileType markdown,md,mkd nmap <buffer><silent> ,mp :call mdip#MarkdownClipboardImage()<CR>
"-----------------------------------------------------------------------------------
" vimmark config
"-----------------------------------------------------------------------------------
nmap <silent> mm <Plug>MarkSet
vmap <unique> <silent> mm <Plug>MarkSet
nmap <unique> <silent> mr <Plug>MarkRegex
vmap <unique> <silent> mr <Plug>MarkRegex
nmap <unique> <silent> mn <Plug>MarkAllClear
nmap <unique> <silent> m* <Plug>MarkSearchAnyNext
nmap <unique> <silent> m# <Plug>MarkSearchAnyPrev

"-----------------------------------------------------------------------------------
" vim-locate config; provide search result list
"-----------------------------------------------------------------------------------
"" location list win
"gl" search and give a window
let g:locate_max_height = g:MyWinHeight
let g:locate_focus = 1
let g:locate_colon_jump = 0

"-----------------------------------------------------------------------------------
" ultisnips and sytax template config
"-----------------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"-----------------------------------------------------------------------------------
" paththeses rainbow config
"-----------------------------------------------------------------------------------
let g:rainbow_active = 1

"-----------------------------------------------------------------------------------
" mru config
"-----------------------------------------------------------------------------------
nnoremap <silent> <Space>m :MRU<CR>
let g:MRU_File = expand('~/.cache/.vim_mru_files')
let g:MRU_Window_Height = g:MyWinHeight
let g:MRU_Exclude_Files = '/.git\|/.repo\|/.svn\|/.cache'

" remembering last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"-----------------------------------------------------------------------------------
" autotags and cscope config
"-----------------------------------------------------------------------------------
let g:autotagsdir = $HOME . "/.autotags/byhash"
let g:autotags_no_global = 1
let g:autotags_ctags_opts = "--exclude=target --exclued=vendor"
let g:autotags_ctags_languages = "+Asm,+C,+C#,+C++,+Java,+JavaScript,+Vim,+Swift"
let g:autotags_ctags_langmap = "Scala:.scala,Java:.java,Vim:.vim,JavaScript:.js"
let g:autotags_ctags_global_include = ""
let g:autotags_cscope_file_extensions = ".cpp .cc .cxx .hpp .hh .h .hxx .c .m .asm .s .java .js .py .idl .dts .dtsi .swift"

"cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
" cscope quickfix can't auto open by default
" augroup qf
"     autocmd!
"     autocmd QuickFixCmdPost * cwindow
" augroup END

" cscope vim auto jumping the first result, replace quickfix with locationlist
function! LoadCscopeToQuickFix(currword, oper)
  " not used, mz Mode
  "   execute "normal mZ"
  " execute "set csqf=" . a:oper . "-"
  execute "lcs find " a:oper . " " . a:currword
  execute "lopen"
  execute "botright lopen"
  execute "wincmd p"
  " execute "normal `Z"
  " execute "set csqf="
endfunction

nmap <C-\>s :<Esc>:call LoadCscopeToQuickFix(expand("<cword>"),"s")<CR>
nmap <C-\>g :<Esc>:call LoadCscopeToQuickFix(expand("<cword>"),"g")<CR>
nmap <C-\>c :<Esc>:call LoadCscopeToQuickFix(expand("<cword>"),"c")<CR>
nmap <C-\>t :<Esc>:call LoadCscopeToQuickFix(expand("<cword>"),"t")<CR>
nmap <C-\>e :<Esc>:call LoadCscopeToQuickFix(expand("<cword>"),"e")<CR>
nmap <C-\>f :<Esc>:call LoadCscopeToQuickFix(expand("<cword>"),"f")<CR>
nmap <C-\>i :<Esc>:call LoadCscopeToQuickFix(expand("<cword>"),"i")<CR>
nmap <C-\>d :<Esc>:call LoadCscopeToQuickFix(expand("<cword>"),"d")<CR>

"-----------------------------------------------------------------------------------
" leadF config, relpace ctrlP, tagbar
"-----------------------------------------------------------------------------------
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
let g:Lf_RootMarkers = ['.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_StlColorScheme = 'powerline'

let g:Lf_ShortcutF = "<c-p>"
let g:Lf_ShortcutB = "<c-n>"
" modify:disable windows terminal; insert mode,push ctrl+v, alt+key
noremap m :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap f :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap b :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap t :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

"-----------------------------------------------------------------------------------
" leadF config, relpace ctrlP, tagbar
"-----------------------------------------------------------------------------------
map <F5> :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python3 %"
    endif
endfunc

" let g:pydoc_cmd = '~/miniconda3/bin/pydoc'
let g:pydoc_cmd = 'python3 -m pydoc'
" If you want to open pydoc files in vertical splits or tabs, give the
" appropriate command in your .vimrc with:
" let g:pydoc_open_cmd = 'vsplit'
" or
let g:pydoc_open_cmd = 'tabnew'
nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>
