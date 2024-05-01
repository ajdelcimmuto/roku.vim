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

    if line =~? '\v^\s*(sub|function)\s+\w+\s*\(.*\)'
        if nextIndent > indent
            return 'a1'
        else
            return '='
        endif
    elseif line =~? '\v^\s*(end\s+sub|end\s+function)'
        if prevIndent > indent
            return 's1'
        else
            return '='
        endif
    elseif line =~? '\v^\s*(if|while|for\s+each)\s+.*\s+then'
        if nextIndent > indent
            return 'a1'
        else
            return '='
        endif
    elseif line =~? '\v^\s*else\s+if\s+.*\s+then'
        if nextIndent > indent
            return '='
        else
            return 's1'
        endif
    elseif line =~? '\v^\s*else'
        if nextIndent > indent
            return '='
        else
            return 's1'
        endif
    elseif line =~? '\v^\s*end\s+if'
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
