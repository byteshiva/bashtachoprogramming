!#/bin.bash

# pipe seq of # from 1 to 105 to get xkcd images 
seq 1 105 | xargs -i bash -c "curl -s https://xkcd.com/"{}"/info.0.json | jq -r '.img'"

# Get number from input_file.txt for retrieving images from xkcd
awk '{for(i=1; i<=NF; i++) system("curl -s https://xkcd.com/"$i"/info.0.json | jq -r '.img' ")}' input_file.txt

# tail log files with numbers
tail -f /var/log/foo.log | less -N

# Redirect retrieve files to an output file to avoid repeated calls to server
seq 1 1989 | xargs -i bash -c "curl -s https://xkcd.com/"{}"/info.0.json | jq -r '.img'" >> xkcdimgs.list

// Distributed crawlers pulls the webpages with 16 parallel processes 
cat urllist | xargs -P16 wget -i

// Web server load testing 
seq 1000 | xargs -P 50 -I NONE lwp-request http://localhost:3000
