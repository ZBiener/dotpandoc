#!/usr/local/bin/zsh
cmd="pandoc -d userinfo -d refs -d scholar-html -d syllabus-html --verbose $1 -o ${1:r}.html"
echo $cmd
eval $cmd
open ${1:r}.html