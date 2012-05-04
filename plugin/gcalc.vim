scriptencoding utf-8
function! GCalc(...)
  let word = a:1

  let dom = webapi#xml#parseURL('http://www.google.co.jp/complete/search?output=toolbar&q='.webapi#http#escape(word))

  if !exists("dom.find('calculator_suggestion').attr")
    echoerr "GCcalc: Invailed formula format."
    return
  endif

  echo dom.find('calculator_suggestion').attr['data']

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

