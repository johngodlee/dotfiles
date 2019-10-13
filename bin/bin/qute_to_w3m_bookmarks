#!/bin/bash

touch ~/.w3m/bookmark.html

echo "<html><head><title>Bookmarks</title></head>
<body>
<h1>Quickmarks</h1>
<ul>" > ~/.w3m/bookmark.html

while read line; do
    if [[ $line != *"qute"* ]]; then
        url=$(echo $line | sed 's@.* @@')
        desc=$(echo $line | sed 's/\(.*\) .*/\1/') 
        echo "<li><a href=\"$url\">$desc</a>" >> ~/.w3m/bookmark.html
    fi
done < ~/.qutebrowser/quickmarks 

echo "</ul>" >> ~/.w3m/bookmark.html

echo "<h1>Other bookmarks</h1>
<ul>" >> ~/.w3m/bookmark.html

while read line; do
    if [[ $line != *"qute"* ]]; then
        url=$(echo $line | cut -d " " -f 1) 
        desc=$(echo ${line#* }) 
        echo "<li><a href=\"$url\">$desc</a>" >> ~/.w3m/bookmark.html
    fi
done < ~/.qutebrowser/bookmarks/urls 

echo "</ul>
</body>
</html>" >> ~/.w3m/bookmark.html
