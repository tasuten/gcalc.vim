scriptencoding utf-8
function! GCalc(...)
  let word = a:1

  let dom = webapi#xml#parseURL('http://www.google.co.jp/complete/search?output=toolbar&q='.webapi#http#encodeURI(word))

  if !exists("dom.find('suggestion').attr")
    echoerr "GCcalc: Invailed formula format."
    return
  endif

  echo dom.find('suggestion').attr['data']

endfunction

" Very Simple Completion
function! GCalcComp(ArgLead, CmdLine, CursorPos)
  return "
        \binary\n
        \octal\n
        \decimal\n
        \hexdecimal\n
        \"
endfunction

command! -nargs=+ -complete=custom,GCalcComp GCalc call GCalc(<q-args>)

