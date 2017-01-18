"ANY OF COMMANDS WANTS TO ADDIN TO THE .VIMRC NEEDS TO BE ADD HERE"
"THIS FILE IS ONLY FOR TJ"
"THE COMMAND HERE NEEDS TO FOLLOW .VIMRC TYPE"


"move of the split window"
"+ means up ;- means down ; 4 means left ; 6 means right"
nmap + <C-W>+    
nmap - <C-W>-
nmap 6 <C-W>>
nmap 4 <C-W><
"map <F7> :Tlist<CR>"

"Tagbar"
let g:tagbar_autofocus = 1
nnoremap <silent> <F8> :TagbarToggle<CR>

"Tabnew exchange"
"nmap , :tabprev<CR>
"nmap . :tabnext<CR> 

"Add Custom Header to CPP file"
autocmd bufnewfile *.cpp so /home/tj/icoding/test/cpp_header.txt 
autocmd bufnewfile *.cpp exe "1," . 10 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.cpp exe "1," . 10 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.cpp execute "normal ma"
autocmd Bufwritepre,filewritepre *.cpp exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.cpp execute "normal `a"

set colorcolumn=0
