setl fdm=indent
setl fde=BrightScriptFolding()

" function! BrightScriptFolding()
"   let line = getline(v:lnum)
"   let next_line = getline(v:lnum + 1)
"   let fold_level = indent(v:lnum) / &shiftwidth

"   if line =~# '\v^\s*(\w+\s+\w+\s*\(.*\))?\s*$' && next_line =~# '\v^\s*\w+\s+\w+\s*\(.*\)\s*$'
"     return '>' . (fold_level + 1)
"   elseif line =~# '\v^\s*(if|for|while|function|sub)'
"     return 'a1'
"   elseif line =~# '\v^\s*(else|elseif)'
"     return 's1'
"   elseif line =~# '\v^\s*(end\s+(if|for|while|function|sub))'
"     return 's1'
"   else
"     return fold_level
"   endif
" endfunction

