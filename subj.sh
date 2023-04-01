#!/bin/bash
url=https://github.com/Dolfost/NAU-LaTex-Template
git clone "$url" "./$1/LaTex"

subjectpath="data/subject.txt"

if [[ $# -ge 1 ]]; then
	echo $(tr $2 -d '\n') >> "./$1/LaTex/$subjectpath"
fi
