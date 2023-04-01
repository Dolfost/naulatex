#!/bin/bash

if [ "$#" -gt 1 ]; then
    path=$1
	echo $(rt $1 -d '\n') >> subject.txt
else
    path=$(cat subject.txt | tr -d '\n')
fi

# nvim -p 1 "setup/$path/body.tex" -p 1 preamble/preamble.tex -p 1 -O 1 homework.tex -o 1 setup.tex variables/variables.tex

nvim -S data/open.txt setup/$path/body.tex preamble/preamble.tex setup.tex homework.tex variables/variables.tex se
