# are these really free?
yes, see [here](https://www.gemtracks.com/free-music/)

- Free use in all projects and media, including videos, podcasts and social media (Instagram, TikTok, etc ...)
- Commercial and monetization allowed
- Must credit and link back to Gemtracks.com

# how to listen?
drag and drop any of the `.m3u` files to vlc or mpv, or make any of the two players the default player for `m3u` files in your os

# how to download?
extract the [to_download.zip](https://github.com/junguler/gemtracks_free-music/raw/main/to_download.zip) file, cd into the directory and do this (you'll need aria2)

```
for i in *.txt ; do mkdir $(echo $i | sed 's/.txt//g') ; cat $i | aria2c -i - -j 2 -d $(echo $i | sed 's/.txt//g') ; done
```

or if you prefer gui download managers just copy the content of any of the text files and paste them in the batch section and start downloading

# script?
yes, [here](https://github.com/junguler/gemtracks_free-music/blob/main/gemtracks.sh)
