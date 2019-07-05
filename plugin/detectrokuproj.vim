augroup roku_project_detect
    au!
    au BufNewFile,BufRead manifest call s:RokuCheck() 
    au BufNewFile,BufRead *.brs call s:RokuCheck() 
    au BufNewFile,BufRead *.xml call s:RokuCheck() 
augroup END

fun! s:RokuCheck()
    if glob(fnamemodify(bufname('%'), ':p:h') . '/source/*.brs') != '' || glob(fnamemodify(bufname('%'), ':p:h') . '/*.brs') != ''
        nnoremap <buffer> <leader>; :call installpkg#RokuInstall()<cr>
        nnoremap <buffer> <leader>' :call installpkg#RokuPackage()<cr>
    else
        let s:steps = ':p:h:h'
        while glob(fnamemodify(bufname('%'), s:steps) . '/*') != glob('//*') && glob(fnamemodify(bufname('%'), s:steps) . '/manifest') == ''
            let s:steps .= ':h'
        endwhile

        if glob(fnamemodify(bufname('%'), s:steps) . '/source/*.brs') != '' &&
                    \ glob(fnamemodify(bufname('%'), s:steps) . '/manifest') != ''
            com! -nargs=? -buffer RokuInstall :call installpkg#RokuInstall(<args>)
            com! -nargs=? -buffer RokuPackage :call installpkg#RokuPackage(<args>)
            nnoremap <buffer> <leader>; :RokuInstall<cr>
            nnoremap <buffer> <leader>' :RokuPackage<cr>
        endif 
    endif
endfun