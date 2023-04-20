#!/bin/bash
url=https://github.com/Dolfost/NAU-LaTex-Template
git clone "$url" "./$1/LaTex"

subjectpath="data/subject.txt"

if [[ $# -ge 2 ]]; then
	echo $2 > "./$1/LaTex/$subjectpath"
fi

cd "./$1/LaTex"
