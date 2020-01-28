#!/bin/bash
# export passwords to external file

touch pass_output

for i in $HOME/.password-store/*; do 
	filename=$(basename -- "$i")
	file="${filename%.*}"
	echo "${file}" >> pass_output
	gpg --decrypt $i >> pass_output
	echo " " >> pass_output
done
