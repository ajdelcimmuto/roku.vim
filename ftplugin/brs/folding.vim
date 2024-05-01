setl fdm=expr
setl fde=BrightScriptFolding()

function! BrightScriptFolding()
  let line = getline(v:lnum)
  let level = indent(v:lnum) / &shiftwidth

  if line =~# '^\s*\(sub\|function\)'
    return 'a1'
  elseif line =~# '^\s*\(if\|for\|while\)'
    return 'a' . (level + 1)
  elseif line =~# '^\s*\(else\|elseif\)'
    return 's1'
  elseif line =~# '^\s*end\(sub\|function\|if\|for\|while\)'
    return 's1'
  else
    return ''
  endif
endfunction
