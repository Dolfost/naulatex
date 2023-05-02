#!/bin/bash

subjectpath="data/subject.txt"

if [[ $# -ge 1 ]]; then
	path=$1
	echo $1 > $subjectpath
else
    path=$(cat $subjectpath | tr -d "\n")
fi

# nvim -p 1 "setup/$path/body.tex" -p 1 preamble/preamble.tex -p 1 -O 1 homework.tex -o 1 setup.tex variables/variables.tex

nvim setup/$path/body.tex  -c 'tabe preamble/preamble.tex'  -c 'tabe commands/commands.tex' -c 'tabe setup.tex' -c 'vsplit homework.tex' -c 'split variables/variables.tex' -c 'tabn 1'
