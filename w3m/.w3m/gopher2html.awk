#!/usr/bin/awk -f

function urlize(type, selector, host, port)
{

	return encode("gopher://" host ":" port "/" type selector)
}


function encode(html)
{

	gsub(/&/, "\\&amp;", html)
	gsub(/</, "\\&lt;", html)
	gsub(/>/, "\\&gt;", html)
	gsub(/"/, "\\&quot;", html)
	gsub(/'/, "\\&#39;", html)

	return html
}

function header()
{
	if (ENVIRON["GOPHER2HTML_TYPE"] != "file" && 
		ENVIRON["GOPHER2HTML_TYPE"] != "bin") {
		# Print the header
		print "<html>"
		print "<body>"
		print "<pre>"
	}
}

function footer()
{
	if (ENVIRON["GOPHER2HTML_TYPE"] != "file" && 
		ENVIRON["GOPHER2HTML_TYPE"] != "bin") {
		# Print the footer
		print "</pre>"
		print "</body>"
		print "</html>"
	}
}

BEGIN {
	FS = "\t"
	# XXX: Strictly speaking RS should be `\r\n'. However, in the wild it
	# XXX: can happens that the `\r' is missing. Address that and then strip
	# XXX: trailing `\r' when parsing responses.
	RS = "\n"

	TYPE["file"] = "0"
	TYPE["directory"] = "1"
	TYPE["error"] = "3"
	TYPE["search"] = "7"
	TYPE["image"] = "I"
	TYPE["gif"] = "g"
	TYPE["html"] = "h"
	TYPE["info"] = "i"
	TYPE["picture"] = "p"
	TYPE["sound"] = "s"
	TYPE["bin"] = "9"

	header()
}

{
	sub(/^\r/, "")
	sub(/\r$/, "")

	test0 = $0  # All the string
	type = substr($1, 1, 1)  # e.g. 9 for binary file
	user_name = substr($1, 2)  #  
	selector = $2
	host = $3
	port = $4
}

$0 == "." {
	# (nothing)
	next
}

# Text entry
ENVIRON["GOPHER2HTML_TYPE"] == "file" {
	printf("%s\n", $0)
	next
}

# Binary file, like a pdf
ENVIRON["GOPHER2HTML_TYPE"] == "bin" {
	printf("%s\n", $0)
}

type == TYPE["file"] || type == TYPE["directory"] {
	printf("<a href=\"%s\">%s</a>\n", urlize(type, selector, host, port), encode(user_name))
}

type == TYPE["bin"] {
	url = selector	# strip `URL:' prefix
	printf("<a href=\"%s\">%s</a>\n", test0, encode(user_name))
}

type == TYPE["error"] {
	# TODO
}

type == TYPE["search"] {
	printf("<form action=\"%s\">", urlize(type, selector, host, port))
	printf("<input type='text' />")
	printf("<input type='submit' />")
	printf("</form>\n")
}

type == TYPE["info"] {
	printf("%s\n", encode(user_name))
}

type == TYPE["html"] {
	url = substr(selector, 5)	# strip `URL:' prefix
	printf("<a href=\"%s\">%s</a>\n", encode(url), encode(user_name))
}

type == TYPE["image"] || type == TYPE["gif"] || type == TYPE["picture"] {
	printf("<img src=\"%s\" alt=\"%s\" />\n",
	   urlize(type, selector, host, port), encode(user_name))
}

END {
	footer()
}
