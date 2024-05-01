setl fdm=expr
setl fde=BrsFold(v:lnum)
setl fml=2

function! BrsFold(lnum)
    let line = getline(a:lnum)
    if line =~? '\v^\s*$'
        return '0'
    endif

    let indent = indent(a:lnum)
    let prevIndent = indent(prevnonblank(a:lnum - 1))
    let nextIndent = indent(nextnonblank(a:lnum + 1))

    if line =~? '\v^\s*(function|sub|if|for\s+each|while|else\s+if|else)\s'
        if nextIndent > indent
            return 'a1'
        else
            return '='
        endif
    elseif line =~? '\v^\s*(end\s+function|end\s+sub|end\s+if|end\s+for|end\s+while|end\s+else)'
        if prevIndent > indent
            return 's1'
        else
            return '='
        endif
    else
        return '='
    endif
endfunction

func! s:indentCt(lnum)
    return indent(a:lnum) / &shiftwidth
endfunc
