setl fdm=expr
setl fde=BrsFold(v:lnum)
setl fml=2

function! BrsFold(lnum)
    let line = getline(a:lnum)
    if line =~? '\v^\s*$'
        return '-1'
    endif

    let indent = indent(a:lnum)
    let prevIndent = indent(prevnonblank(a:lnum - 1))
    let nextIndent = indent(nextnonblank(a:lnum + 1))

    if line =~? '\v^\s*(function|sub|if|for\s+each|while|if|else\s+if|else|print|select)\s'
        return indent + 1
    elseif line =~? '\v^\s*(exit|next|return|end\s+function|end\s+sub|end\s+if|end\s+for|end\s+while|end\s+else|endif|endfor|endwhile|endselect)'
        return prevIndent - 1
    elseif nextIndent > indent
        return nextIndent
    elseif nextIndent < indent
        return indent
    else
        return indent
    endif
endfunction

func! s:indentCt(lnum)
    return indent(a:lnum) / &shiftwidth
endfunc
