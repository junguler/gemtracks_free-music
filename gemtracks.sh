#!/bin/bash

# get the list of genres
curl -s https://www.gemtracks.com/free-music/ | htmlq .list-group-item -t | grep -v " " > genres.txt

# get the first page of mp3 links
for i in $(cat genres.txt) ; do curl -s https://www.gemtracks.com/free-music/\?category\=$i | grep ".mp3" | awk -F '"' '{print $8}' | sed 's| |%20|g' > A-$i.txt ; echo $i ; done

# get the rest of the links
for j in {2..30} ; do for i in $(cat genres.txt) ; do curl -s https://www.gemtracks.com/free-music/freeMusicFilter.php\?typeFile\=undefined\&sortFilter\=id_asc\&page\=$j\&category\=$i | grep ".mp3" | awk -F '"' '{print $8}' | sed 's| |%20|g' >> A-$i.txt ; echo -e "$i - $j" ; done ; done

# beatify the links
for i in A-*.txt ; do for j in $(cat $i) ; do echo $j | awk -F '/' '{print $5}' | sed -e 's|%20| |g' -e 's/.mp3//g' | awk '{print "#EXTINF:-1,"$0}' >> A$i ; echo $j >> A$i ; done ; done

# convert links to m3u streams
for i in AA-*.txt ; do sed '1s/^/#EXTM3U\n/' $i > $i.m3u ; done

# remove AA- and double extensions in streams
for i in *.m3u ; do mv "$i" "`echo $i | sed -e 's/AA-//' -e 's/.txt//'`" ; done
