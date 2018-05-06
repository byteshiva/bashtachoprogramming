!#/bin.bash

# pipe seq of # from 1 to 105 to get xkcd images 
seq 1 105 | xargs -i bash -c "curl -s https://xkcd.com/"{}"/info.0.json | jq -r '.img'"

# Get number from input_file.txt for retrieving images from xkcd
awk '{for(i=1; i<=NF; i++) system("curl -s https://xkcd.com/"$i"/info.0.json | jq -r '.img' ")}' input_file.txt

# tail log files with numbers
tail -f /var/log/foo.log | less -N

# Redirect retrieve files to an output file to avoid repeated calls to server
seq 1 1989 | xargs -i bash -c "curl -s https://xkcd.com/"{}"/info.0.json | jq -r '.img'" >> xkcdimgs.list
