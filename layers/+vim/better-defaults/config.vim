scriptencoding utf-8

augroup SPACEVIM_BASIC
    " Restore cursor position when opening file
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   execute "normal! g`\"" |
                \ endif

    autocmd BufReadPre *
                \   if getfsize(expand("%")) > 10000000 |
                \   syntax off |
                \   endif
augroup END

silent! color space-vim-dark

" vim-better-whitespace {
if IsDir('vim-better-whitespace')
    highlight ExtraWhitespace ctermbg=197
endif
" }

" incsearch.vim {
if IsDir('incsearch.vim')
    " incsearch.vim has bug with GUI vim
    if !has('gui_running')
        map /  <Plug>(incsearch-forward)
        map ?  <Plug>(incsearch-backward)
        map g/ <Plug>(incsearch-stay)

        map z/ <Plug>(incsearch-fuzzyspell-/)
        map z? <Plug>(incsearch-fuzzyspell-?)
        map zg/ <Plug>(incsearch-fuzzyspell-stay)
    endif
endif
" }

" vim-startify {
if IsDir('vim-startify')
    let g:startify_custom_header = [
                \'                                             _',
                \'         ___ _ __   __ _  ___ ___     __   _(_)_ __ ___',
                \'        / __| -_ \ / _- |/ __/ _ \____\ \ / / | -_ - _ \',
                \'        \__ \ |_) | (_| | (_|  __/_____\ V /| | | | | | |',
                \'        |___/ .__/ \__._|\___\___|      \_/ |_|_| |_| |_|',
                \'            |_|',
                \'                  [ space-vim ' . g:spacevim_version . ' ＠' . v:version . ' ]',
                \]

    augroup SPACEVIM_START
        autocmd!
        autocmd VimEnter * if !argc() | Startify | endif
    augroup END
    let g:startify_list_order = [
                \ ['   Recent Files:'],
                \ 'files',
                \ ['   Project:'],
                \ 'dir',
                \ ['   Sessions:'],
                \ 'sessions',
                \ ['   Bookmarks:'],
                \ 'bookmarks',
                \ ['   Commands:'],
                \ 'commands',
                \ ]
endif
" }

" nerdtree {
if IsDir('nerdtree')
    let g:NERDTreeShowHidden=1
    let g:NERDTreeAutoDeleteBuffer=1
    let g:NERDTreeDirArrowExpandable = '➤'
    let g:NERDTreeIgnore=[
                \ '\.py[cd]$', '\~$', '\.swo$', '\.swp$',
                \ '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$',
                \ ]
    " close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif
" }

"nerdtree-git-plugin {
if IsDir('nerdtree-git-plugin')
    let g:NERDTreeIndicatorMapCustom = {
                \ 'Modified'  : '✹',
                \ 'Staged'    : '✚',
                \ 'Untracked' : '✭',
                \ 'Renamed'   : '➜',
                \ 'Unmerged'  : '═',
                \ 'Deleted'   : '✖',
                \ 'Dirty'     : '✗',
                \ 'Clean'     : '✔︎',
                \ 'Unknown'   : '?'
                \ }
endif
" }

" vim-nerdtree-syntax-highlight {
if IsDir('vim-nerdtree-syntax-highlight')
    " let g:NERDTreeFileExtensionHighlightFullName = 1
    " let g:NERDTreeExactMatchHighlightFullName = 1
    " let g:NERDTreePatternMatchHighlightFullName = 1
    " let g:NERDTreeLimitedSyntax = 1

    " you can add these colors to your .vimrc to help customizing
    let s:brown = '905532'
    let s:aqua =  '3AFFDB'
    let s:blue = '689FB6'
    let s:darkBlue = '44788E'
    let s:purple = '834F79'
    let s:lightPurple = '834F79'
    let s:red = 'AE403F'
    let s:beige = 'F5C06F'
    let s:yellow = 'F09F17'
    let s:orange = 'D4843E'
    let s:darkOrange = 'F16529'
    let s:pink = 'CB6F6F'
    let s:salmon = 'EE6E73'
    let s:green = '8FAA54'
    let s:lightGreen = '31B53E'
    let s:white = 'FFFFFF'
    let s:rspec_red = 'FE405F'
    let s:git_orange = 'F54D27'

    let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
    let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue
    let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
    let g:NERDTreeExtensionHighlightColor['python'] = s:green " sets the color of css files to blue
    let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
    let g:NERDTreeExtensionHighlightColor['org'] = s:pink " sets the color of css files to blue

    let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
    let g:NERDTreeExactMatchHighlightColor['tex'] = s:rspec_red " sets the color of css files to blue
    let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
    let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files
    let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
    let g:NERDTreeExactMatchHighlightColor['.ipynb'] = s:lightPurple " sets the color for .ipynb files
    let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
    let g:NERDTreeExactMatchHighlightColor['.py'] = s:red " sets the color for .ipynb files

    let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
    let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb
    let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
    let g:NERDTreePatternMatchHighlightColor['*.py$'] = s:red " sets the color for files ending with _spec.rb
endif
" }

" vim-ctrlp {
if IsDir('ctrlp.vim')
    let g:ctrlp_working_path_mode = 'ra'	" search for nearest ancestor like .git, .hg, and the directory of the current file
    let g:ctrlp_match_window_bottom = 0		" show the match window at the top of the screen
    let g:ctrlp_by_filename = 1
    let g:ctrlp_max_height = 10				" maxiumum height of match window
    let g:ctrlp_switch_buffer = 'et'		" jump to a file if it's open already
    let g:ctrlp_use_caching = 1				" enable caching
    let g:ctrlp_clear_cache_on_exit=0  		" speed up by not removing clearing cache evertime
    let g:ctrlp_mruf_max = 250 				" number of recently opened files
    let g:ctrlp_custom_ignore = {
                \   'dir':  '\v[\/]\.(git|hg|svn|build)$',
                \   'file': '\v\.(exe|so|dll)$',
                \   'link': 'SOME_BAD_SYMBOLIC_LINKS',
                \ }
    let g:ctrlp_match_window_bottom = 0		" show the match window at the top of the screen
    let g:ctrlp_by_filename = 1
    let g:ctrlp_max_height = 10				" maxiumum height of match window
    let g:ctrlp_switch_buffer = 'et'		" jump to a file if it's open already
    let g:ctrlp_regexp = 1
    " If ag available, use it to replace grep
    if executable('ag')
        " Use Ag over Grep
        set grepprg=ag\ --nogroup\ --nocolor
        " Use ag in CtrlP for listing files.
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
        " Ag is fast enough that CtrlP doesn't need to cache
        let g:ctrlp_use_caching = 0
    else
        let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
    endif
endif
" }

" delimitMate {
if IsDir('delimitMate')
    let g:delimitMate_expand_cr=1
endif
" }

" The decoration of statusline was stealed from
" https://github.com/junegunn/dotfiles/blob/master/vimrc.
"
" %< Where to truncate
" %n buffer number
" %F Full path
" %m Modified flag: [+], [-]
" %r Readonly flag: [RO]
" %y Type:          [vim]
" fugitive#statusline()
" %= Separator
" %-14.(...)
" %l Line
" %c Column
" %V Virtual column
" %P Percentage
" %#HighlightGroup#
function! Buf_total_num()
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction
function! File_size(f)
    let l:size = getfsize(expand(a:f))
    if l:size == 0 || l:size == -1 || l:size == -2
        return ''
    endif
    if l:size < 1024
        return l:size.' bytes'
    elseif l:size < 1024*1024
        return printf('%.1f', l:size/1024.0).'k'
    elseif l:size < 1024*1024*1024
        return printf('%.1f', l:size/1024.0/1024.0) . 'm'
    else
        return printf('%.1f', l:size/1024.0/1024.0/1024.0) . 'g'
    endif
endfunction
set statusline=%<%1*[B-%n]%*
" TOT is an abbreviation for total
set statusline+=%2*[TOT:%{Buf_total_num()}]%*
set statusline+=%3*\ %{File_size(@%)}\ %*
set statusline+=%4*\ %F\ %*
set statusline+=%5*『\ %{exists('g:loaded_ale')?ALEGetStatusLine():''}』%{exists('g:loaded_fugitive')?fugitive#statusline():''}%*
set statusline+=%6*\ %m%r%y\ %*
set statusline+=%=%7*\ %{&ff}\ \|\ %{\"\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"\ \|\"}\ %-14.(%l:%c%V%)%*
set statusline+=%8*\ %P\ %*
" default bg for statusline is 236 in space-vim-dark
hi User1 cterm=bold ctermfg=232 ctermbg=179
hi User2 cterm=None ctermfg=214 ctermbg=242
hi User3 cterm=None ctermfg=251 ctermbg=240
hi User4 cterm=bold ctermfg=169 ctermbg=239
hi User5 cterm=None ctermfg=208 ctermbg=238
hi User6 cterm=None ctermfg=246 ctermbg=237
hi User7 cterm=None ctermfg=250 ctermbg=238
hi User8 cterm=None ctermfg=249 ctermbg=240
silent! if emoji#available()
let s:ft_emoji = map({
            \ 'c':          'baby_chick',
            \ 'clojure':    'lollipop',
            \ 'coffee':     'coffee',
            \ 'cpp':        'chicken',
            \ 'css':        'art',
            \ 'eruby':      'ring',
            \ 'gitcommit':  'soon',
            \ 'haml':       'hammer',
            \ 'help':       'angel',
            \ 'html':       'herb',
            \ 'java':       'older_man',
            \ 'javascript': 'monkey',
            \ 'make':       'seedling',
            \ 'markdown':   'book',
            \ 'perl':       'camel',
            \ 'python':     'snake',
            \ 'ruby':       'gem',
            \ 'scala':      'barber',
            \ 'sh':         'shell',
            \ 'slim':       'dancer',
            \ 'text':       'books',
            \ 'vim':        'poop',
            \ 'vim-plug':   'electric_plug',
            \ 'yaml':       'yum',
            \ 'yaml.jinja': 'yum'
            \ }, 'emoji#for(v:val)')

function! S_filetype()
    if empty(&filetype)
        return emoji#for('grey_question')
    else
        return get(s:ft_emoji, &filetype, '['.&filetype.']')
    endif
endfunction

function! S_modified()
    if &modified
        return emoji#for('kiss').' '
    elseif !&modifiable
        return emoji#for('construction').' '
    else
        return ''
    endif
endfunction

function! S_fugitive()
    if !exists('g:loaded_fugitive')
        return ''
    endif
    let head = fugitive#head()
    if empty(head)
        return ''
    else
        return head == 'master' ? emoji#for('crown') : emoji#for('dango').'='.head
    endif
endfunction

let s:braille = split('"⠉⠒⠤⣀', '\zs')
function! Braille()
    let len = len(s:braille)
    let [cur, max] = [line('.'), line('$')]
    let pos  = min([len * (cur - 1) / max([1, max - 1]), len - 1])
    return s:braille[pos]
endfunction

hi def link User1 TablineFill
let s:cherry = emoji#for('cherry_blossom')
function! MyStatusLine()
    let mod = '%{S_modified()}'
    let ro  = "%{&readonly ? emoji#for('lock') . ' ' : ''}"
    let ft  = '%{S_filetype()}'
    let fug = ' %{S_fugitive()}'
    let sep = ' %= '
    let pos = ' %l,%c%V '
    let pct = ' %P '

    return s:cherry.' [%n] %F %<'.mod.ro.ft.fug.sep.pos.'%{Braille()}%*'.pct.s:cherry
endfunction

" Note that the "%!" expression is evaluated in the context of the
" current window and buffer, while %{} items are evaluated in the
" context of the window that the statusline belongs to.
set statusline=%!MyStatusLine()
endif

execute 'source' fnamemodify(expand('<sfile>'), ':h') . '/keybindings.vim'
