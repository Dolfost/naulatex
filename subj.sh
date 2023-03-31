#!/bin/bash
url=https://github.com/Dolfost/NAU-LaTex-Template
git clone "$url" "./$1/LaTex"

if [ "$#" -qt 1 ]; then
	echo $(tr $2 -d '\n') >> "./$1/LaTex/subject.txt"
fi
