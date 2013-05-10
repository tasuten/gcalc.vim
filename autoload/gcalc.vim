" GCalc.vim

let s:save_cpo = &cpo
set cpo&vim


function! gcalc#gcalc(...)
  let word = a:1

  let dom = webapi#xml#parseURL('http://www.google.co.jp/complete/search?output=toolbar&q='.webapi#http#encodeURI(word))

  if !exists("dom.find('suggestion').attr")
    echoerr "GCcalc: Invalid formula format."
    return
  endif

  echo dom.find('suggestion').attr['data']

endfunction

" Very Simple Completion.
function! gcalc#complete(ArgLead, CmdLine, CursorPos)
  return "
        \binary\n
        \octal\n
        \decimal\n
        \hexdecimal\n
        \"
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set fdm=marker ts=2 sw=2 sts=2 et:
" __END__
