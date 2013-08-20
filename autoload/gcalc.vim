" GCalc.vim

let s:save_cpo = &cpo
set cpo&vim


function! s:print_error(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl None
endfunction

function! gcalc#gcalc(...)
  let word = a:1

  let dom = webapi#xml#parseURL('http://www.google.co.jp/complete/search?output=toolbar&q='.webapi#http#encodeURI(word))

  if !exists("dom.childNode('CompleteSuggestion').childNode('suggestion').attr")
        \ || dom.childNode('CompleteSuggestion').childNode('num_queries') != {}

    call s:print_error('GCcalc: Invalid formula format.')
    return
  endif

  echo dom.childNode('CompleteSuggestion').childNode('suggestion').attr['data']

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
