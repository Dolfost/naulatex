let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +127 preamble/preamble.tex
badd +1 document.tex
badd +1 matter/backmatter.tex
badd +1 matter/frontmatter.tex
badd +1 commands/commands.tex
badd +6 setup.tex
badd +1 subjects/amp/mod/body.tex
badd +9 subjects/amp/mod/setup.tex
badd +1 term://~/LaTeX//10791:/bin/zsh
badd +1 variables/texvariables.tex
badd +1 variables/variables.tex
badd +1 subjects/objecto/lab/body.tex
badd +9 subjects/objecto/lab/setup.tex
badd +1 preamble
badd +0 ~/Lib/NAU/Algoritmic_languages_and_programing/Labs/Sem_2/Lab_2/LaTex/setup/amp/lab/body.tex
argglobal
%argdel
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit subjects/objecto/lab/body.tex
argglobal
balt subjects/amp/mod/body.tex
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 20 - ((19 * winheight(0) + 31) / 62)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 20
normal! 068|
tabnext
edit ~/Lib/NAU/Algoritmic_languages_and_programing/Labs/Sem_2/Lab_2/LaTex/setup/amp/lab/body.tex
argglobal
balt subjects/objecto/lab/body.tex
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 154 - ((37 * winheight(0) + 31) / 62)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 154
normal! 0
tabnext
edit document.tex
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 19 - ((18 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 19
normal! 04|
tabnext
edit setup.tex
argglobal
balt subjects/amp/mod/setup.tex
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 3 - ((2 * winheight(0) + 31) / 62)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 025|
tabnext
edit preamble/preamble.tex
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 127 - ((30 * winheight(0) + 31) / 62)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 127
normal! 0
lcd ~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX
tabnext
edit ~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX/matter/frontmatter.tex
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt ~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX/matter/backmatter.tex
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 9 - ((8 * winheight(0) + 15) / 31)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 9
normal! 044|
wincmd w
argglobal
if bufexists(fnamemodify("~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX/matter/backmatter.tex", ":p")) | buffer ~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX/matter/backmatter.tex | else | edit ~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX/matter/backmatter.tex | endif
if &buftype ==# 'terminal'
  silent file ~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX/matter/backmatter.tex
endif
balt ~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX/matter/frontmatter.tex
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 19 - ((14 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 19
normal! 07|
wincmd w
argglobal
if bufexists(fnamemodify("~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX/document.tex", ":p")) | buffer ~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX/document.tex | else | edit ~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX/document.tex | endif
if &buftype ==# 'terminal'
  silent file ~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX/document.tex
endif
balt ~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX/matter/backmatter.tex
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 19 - ((18 * winheight(0) + 31) / 62)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 19
normal! 013|
wincmd w
wincmd =
tabnext
edit ~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX/variables/variables.tex
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt ~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX/variables/texvariables.tex
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 4 - ((3 * winheight(0) + 31) / 62)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 030|
wincmd w
argglobal
if bufexists(fnamemodify("~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX/variables/texvariables.tex", ":p")) | buffer ~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX/variables/texvariables.tex | else | edit ~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX/variables/texvariables.tex | endif
if &buftype ==# 'terminal'
  silent file ~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX/variables/texvariables.tex
endif
balt ~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX/setup.tex
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 19 - ((18 * winheight(0) + 31) / 62)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 19
normal! 08|
wincmd w
wincmd =
tabnext
edit ~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX/commands/commands.tex
argglobal
balt ~/Lib/NAU/Object_orinented_programing/Labs/Lab1/LaTeX/matter/frontmatter.tex
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 31) / 62)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 058|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
