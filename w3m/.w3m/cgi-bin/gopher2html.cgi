#!/bin/sh

case "${QUERY_STRING#gopher://*/}" in
0*)
	export GOPHER2HTML_TYPE="file"
	echo Content-type: text/plain
	;;
*)
	echo Content-type: text/html
	;;
esac
echo
curl "$QUERY_STRING" | ../gopher2html.awk
