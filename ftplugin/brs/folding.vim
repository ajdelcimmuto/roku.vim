setl fdm=expr
setl fde=BrsFold(v:lnum)
setl fml=2

function! BrsFold(lnum)
    let line = getline(a:lnum)
    if line =~? '\v^\s*$'
        return '0'
    endif

    let indent = indent(a:lnum)
    let nextIndent = indent(nextnonblank(a:lnum + 1))

    if line =~? '\v^\s*(function|sub|if|for\s+each|while|else\s+if|else)\s'
        return '>' . nextIndent
    elseif line =~? '\v^\s*(end\s+function|end\s+sub|end\s+if|end\s+for|end\s+while|end\s+else)'
        return '<' . indent
    else
        return '='
    endif
endfunction

func! s:indentCt(lnum)
    return indent(a:lnum) / &shiftwidth
endfunc
