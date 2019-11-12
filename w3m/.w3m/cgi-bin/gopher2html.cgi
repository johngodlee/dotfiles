#!/bin/sh

case "${QUERY_STRING#gopher://*/}" in
0*)
	export GOPHER2HTML_TYPE="file"
	echo Content-type: text/plain
	;;
9*)
	export GOPHER2HTML_TYPE="bin"
	echo Content-type: binary
	;;
*)
	echo Content-type: text/html
	;;
esac
echo
curl "$QUERY_STRING" | ~/.w3m/gopher2html.awk
