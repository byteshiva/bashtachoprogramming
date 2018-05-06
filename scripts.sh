!#/bin.bash

seq 1 105 | xargs -i bash -c "curl -s https://xkcd.com/"{}"/info.0.json | jq -r '.img'"
awk '{for(i=1; i<=NF; i++) system("curl -s https://xkcd.com/"$i"/info.0.json | jq -r '.img' ")}' input_file.txt
