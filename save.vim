let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +149 lua/keymaps.lua
badd +6 term://~/.config/nvim//55523:/bin/zsh
badd +30 lua/plugins/tabline.lua
badd +170 lua/lsp-config.lua
badd +185 lua/util-config.lua
badd +5 init-backup.vim
badd +34 init.lua
badd +90 lua/plugins/utils.lua
badd +59 save.vim
badd +4 lua/plugins/oil.lua
badd +12 lua/plugins/telescope.lua
badd +48 lua/plugins/style.lua
badd +3 lua/style.lua
badd +23 recipes.lua
badd +257 ~/.config/nvim/lua/neotree-config.lua.bak
badd +6 ~/.config/nvim/lua/plugins/lsp.lua
badd +1 ~/.config/nvim/lua/plugins/snip.lua
badd +1 ~/.config/nvim/lua/plugins/treesitter.lua
badd +1 oil:///Users/onurcan/.config/nvim/
badd +6 recipes.txt
badd +22 example/ex1.txt
argglobal
%argdel
$argadd oil:///Users/onurcan/.config/nvim/
edit lua/keymaps.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 113 + 114) / 228)
exe 'vert 2resize ' . ((&columns * 114 + 114) / 228)
argglobal
balt recipes.txt
let s:cpo_save=&cpo
set cpo&vim
nnoremap <buffer>  vca <Cmd>lua vim.lsp.buf.code_action()
nnoremap <buffer> K <Cmd>lua vim.lsp.buf.hover()
nnoremap <buffer> gl <Cmd>lua vim.diagnostic.open_float()
nnoremap <buffer> gS <Cmd>lua vim.lsp.buf.signature_help()
nnoremap <buffer> gr <Cmd>Telescope lsp_references
nnoremap <buffer> go <Cmd>lua vim.lsp.buf.type_definition()
nnoremap <buffer> gi <Cmd>lua vim.lsp.buf.implementation()
nnoremap <buffer> gD <Cmd>lua vim.lsp.buf.declaration()
nnoremap <buffer> gd <Cmd>lua vim.lsp.buf.definition()
nnoremap <buffer> <F2> <Cmd>lua vim.lsp.buf.rename()
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinscopedecls=public,protected,private
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=80
setlocal comments=:---,:--
setlocal commentstring=--\ %s
setlocal complete=.,w,b,u,t
setlocal completefunc=
setlocal completeopt=
setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=\\<function\\|\\<local\\%(\\s\\+function\\)\\=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'lua'
setlocal filetype=lua
endif
setlocal fillchars=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
setlocal foldmethod=expr
setlocal foldminlines=4
setlocal foldnestmax=3
setlocal foldtext=
setlocal formatexpr=v:lua.vim.lsp.formatexpr()
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatoptions=jcroql
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=tr(v:fname,'.','/')
setlocal indentexpr=nvim_treesitter#indent()
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e,0=end,0=until
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispoptions=
setlocal lispwords=
setlocal nolist
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,hex
setlocal number
setlocal numberwidth=4
setlocal omnifunc=v:lua.vim.lsp.omnifunc
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal scrollback=-1
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=2
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=yes
setlocal smartindent
setlocal nosmoothscroll
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\\t\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=noplainbuffer
setlocal statuscolumn=
setlocal statusline=%<%#lualine_c_inactive#\ keymaps.lua\ %#lualine_c_inactive#%=%#lualine_c_inactive#\ ó°€±\ 1\ 2\ 3\ 4\ %#lualine_c_inactive#\ %=\ %#lualine_y_filetype_DevIconLua_0_inactive#\ î˜ \ %#lualine_b_inactive#lua\ %#lualine_a_inactive#\ Bot\ 
setlocal suffixesadd=.lua
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tagfunc=v:lua.vim.lsp.tagfunc
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal virtualedit=
setlocal winbar=
setlocal winblend=0
setlocal nowinfixbuf
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal winhighlight=
setlocal nowrap
setlocal wrapmargin=0
let s:l = 149 - ((49 * winheight(0) + 30) / 61)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 149
normal! 062|
wincmd w
argglobal
if bufexists(fnamemodify("lua/plugins/utils.lua", ":p")) | buffer lua/plugins/utils.lua | else | edit lua/plugins/utils.lua | endif
if &buftype ==# 'terminal'
  silent file lua/plugins/utils.lua
endif
balt lua/util-config.lua
let s:cpo_save=&cpo
set cpo&vim
nnoremap <buffer>  vca <Cmd>lua vim.lsp.buf.code_action()
nnoremap <buffer> K <Cmd>lua vim.lsp.buf.hover()
nnoremap <buffer> gl <Cmd>lua vim.diagnostic.open_float()
nnoremap <buffer> gS <Cmd>lua vim.lsp.buf.signature_help()
nnoremap <buffer> gr <Cmd>Telescope lsp_references
nnoremap <buffer> go <Cmd>lua vim.lsp.buf.type_definition()
nnoremap <buffer> gi <Cmd>lua vim.lsp.buf.implementation()
nnoremap <buffer> gD <Cmd>lua vim.lsp.buf.declaration()
nnoremap <buffer> gd <Cmd>lua vim.lsp.buf.definition()
nnoremap <buffer> <F2> <Cmd>lua vim.lsp.buf.rename()
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinscopedecls=public,protected,private
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=80
setlocal comments=:---,:--
setlocal commentstring=--\ %s
setlocal complete=.,w,b,u,t
setlocal completefunc=
setlocal completeopt=
setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=\\<function\\|\\<local\\%(\\s\\+function\\)\\=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'lua'
setlocal filetype=lua
endif
setlocal fillchars=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
setlocal foldmethod=expr
setlocal foldminlines=4
setlocal foldnestmax=3
setlocal foldtext=
setlocal formatexpr=v:lua.vim.lsp.formatexpr()
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatoptions=jcroql
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=tr(v:fname,'.','/')
setlocal indentexpr=nvim_treesitter#indent()
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e,0=end,0=until
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispoptions=
setlocal lispwords=
setlocal nolist
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,hex
setlocal number
setlocal numberwidth=4
setlocal omnifunc=v:lua.vim.lsp.omnifunc
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal scrollback=-1
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=2
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=yes
setlocal smartindent
setlocal nosmoothscroll
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\\t\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=noplainbuffer
setlocal statuscolumn=
setlocal statusline=%#lualine_a_command#\ COMMAND\ %#lualine_transitional_lualine_a_command_to_lualine_c_normal#î‚°%<%#lualine_c_normal#\ utils.lua\ %#lualine_c_normal#%=%#lualine_c_normal#\ ó°€±\ 1\ 2\ 3\ 4\ %#lualine_c_normal#\ %=\ %#lualine_transitional_lualine_y_filetype_DevIconLua_command_to_lualine_c_normal#î‚²%#lualine_y_filetype_DevIconLua_command#\ î˜ \ %#lualine_b_command#lua\ %#lualine_b_command#%#lualine_b_command#\ 84%%\ %#lualine_transitional_lualine_a_command_to_lualine_b_command#î‚²%#lualine_a_command#\ î‚ \ main\ 
setlocal suffixesadd=.lua
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tagfunc=v:lua.vim.lsp.tagfunc
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal virtualedit=
setlocal winbar=
setlocal winblend=0
setlocal nowinfixbuf
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal winhighlight=
setlocal nowrap
setlocal wrapmargin=0
1
normal! zo
let s:l = 76 - ((25 * winheight(0) + 30) / 61)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 76
normal! 0
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 113 + 114) / 228)
exe 'vert 2resize ' . ((&columns * 114 + 114) / 228)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
