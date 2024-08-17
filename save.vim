let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
let Db_ui_buffer_name_generator =  0 
let TabbyTabNames = "{\"1\":\"Main\"}"
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
badd +26 lua/keymaps.lua
badd +6 term://~/.config/nvim//55523:/bin/zsh
badd +30 lua/plugins/tabline.lua
badd +1 lua/lsp-config.lua
badd +1 lua/util-config.lua
badd +5 init-backup.vim
badd +1 init.lua
badd +3 lua/plugins/utils.lua
badd +59 save.vim
badd +4 lua/plugins/oil.lua
badd +155 lua/plugins/telescope.lua
badd +1 recipes.lua
badd +28 ~/.config/nvim/lua/plugins/lsp.lua
badd +38 ~/.config/nvim/lua/plugins/treesitter.lua
badd +6 recipes.txt
badd +23 example/ex1.txt
badd +113 lua/plugins/cmp.lua
badd +24 ~/.config/nvim/lua/plugins/autoformat.lua
badd +27 ~/.config/nvim/lua/plugins/luasnip.lua
badd +1 ~/.config/nvim/lua/plugins/bufferline.lua
badd +57 ~/.config/nvim/lua/plugins/lualine.lua
badd +19 ~/.config/nvim/lua/plugins/colorschems.lua
badd +31 ~/.config/nvim/lua/plugins/harpoon.lua
badd +22 lua/lazy-init.lua
badd +1 ~/.config/nvim/lua/plugins/undotree.lua
badd +1 ~/.config/nvim/lua/plugins/git.lua
badd +6 ~/.config/nvim/lua/plugins/gc-comment.lua
badd +5 ~/.config/nvim/lua/plugins/autopairs.lua
badd +14 ~/.config/nvim/lua/plugins/autotag.lua
badd +21 ~/.config/nvim/lua/plugins/indent-lines.lua
badd +17 ~/.config/nvim/lua/plugins/marks.lua
badd +10 ~/.config/nvim/lua/plugins/notify.lua
badd +1 ~/.config/nvim/lua/plugins/backup/surround.lua.bak
badd +1 ~/.config/nvim/lua/configs/backup/neotree-config.lua.bak
badd +1 ~/.config/nvim/lua/configs/snippets.lua
badd +3 lua/keymaps/save.lua
badd +9 ~/.config/nvim/lua/keymaps/init.lua
badd +1 lua/keymaps-config.lua
badd +9 ~/.config/nvim/lua/keymaps/movement.lua
badd +23 ~/.config/nvim/lua/keymaps/find-and-navigation.lua
badd +25 ~/.config/nvim/lua/keymaps/lsp.lua
badd +6 ~/.config/nvim/lua/keymaps/copy-paste.lua
badd +1 ~/.config/nvim/lua/keymaps/git.lua
badd +17 ~/.config/nvim/lua/keymaps/tabs-and-panels.lua
badd +4 ~/.config/nvim/lua/keymaps/annoyance-fixes.lua
badd +29 ~/.config/nvim/lua/keymaps/edit-utils.lua
badd +5 ~/.config/nvim/lua/configs/init.lua
badd +45 ~/.config/nvim/lua/configs/opts.lua
badd +2 ~/.config/nvim/lua/configs/autocommands.lua
badd +20 ~/.config/nvim/lua/plugins/database.lua
badd +22 term://~/.config/nvim//45178:/bin/zsh
badd +1 oil:///Users/onurcan/.config/nvim/
argglobal
%argdel
$argadd oil:///Users/onurcan/.config/nvim/
edit ~/.config/nvim/lua/plugins/luasnip.lua
argglobal
balt lua/plugins/cmp.lua
let s:cpo_save=&cpo
set cpo&vim
nnoremap <buffer>  vca <Cmd>lua vim.lsp.buf.code_action()
nnoremap <buffer> K <Cmd>lua vim.lsp.buf.hover()
nnoremap <buffer> gd <Cmd>lua vim.lsp.buf.definition()
nnoremap <buffer> gD <Cmd>lua vim.lsp.buf.declaration()
nnoremap <buffer> gi <Cmd>lua vim.lsp.buf.implementation()
nnoremap <buffer> go <Cmd>lua vim.lsp.buf.type_definition()
nnoremap <buffer> gr <Cmd>Telescope lsp_references
nnoremap <buffer> gS <Cmd>lua vim.lsp.buf.signature_help()
nnoremap <buffer> gl <Cmd>lua vim.diagnostic.open_float()
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
setlocal statusline=%#lualine_a_command#\ COMMAND\ %#lualine_transitional_lualine_a_command_to_lualine_c_normal#î‚°%<%#lualine_c_normal#\ luasnip.lua\ %#lualine_c_normal#%=%#lualine_c_normal#\ ó°€±\ 1\ 2\ 3\ %#lualine_c_normal#\ %=\ %#lualine_transitional_lualine_y_filetype_DevIconLua_command_to_lualine_c_normal#î‚²%#lualine_y_filetype_DevIconLua_command#\ î˜ \ %#lualine_b_command#lua\ %#lualine_b_command#%#lualine_b_command#\ Bot\ %#lualine_transitional_lualine_a_command_to_lualine_b_command#î‚²%#lualine_a_command#\ î‚ \ main\ 
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
let s:l = 26 - ((25 * winheight(0) + 30) / 61)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 26
normal! 0
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
