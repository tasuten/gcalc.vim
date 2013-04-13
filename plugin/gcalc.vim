" GCalc.vim

if exists('g:loaded_gcalc')
  finish
endif
let g:loaded_gcalc = 1

let s:save_cpo = &cpo
set cpo&vim


if !exists(':GCalc')
  command! -nargs=+ -complete=custom,gcalc#complete GCalc
      \ call gcalc#gcalc(<q-args>)
endif


let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set fdm=marker ts=2 sw=2 sts=2 et:
" __END__
