#!/usr/local/bin/zsh
cmd="pandoc -d userinfo -d refs -d syllabus-latex -d pdf-xelatex --quiet $1 -o ${1:r}.pdf"
echo $cmd
eval $cmd
open ${1:r}.pdf