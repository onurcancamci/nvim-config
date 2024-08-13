set termguicolors
nnoremap S s
map s :w<CR>
nnoremap <leader><space> :noh<CR>

" add surround
nmap <leader>s ysiw

" <C-d/f> half page down/up + zz center
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-u>
nnoremap <C-u> <C-u>zz
map <leader>p \"_dP

let g:highlightedyank_highlight_duration = 1000

" useful stuff
" cs"' is change surrounding. that will change " to '
" ys + iw / i{ + ' ys -> add surround, iw aw i{ selector, next key is added surround
" % ile matching bracket
