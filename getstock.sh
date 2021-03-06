#!/bin/sh

# getstock - given a stock ticker symbol, 

url="https://finance.yahoo.com/quote/"

if [ $# -ne 1 ] ; then
  echo "Usage: $(basename $0) stocksymbol" >&2 
  exit 1
fi

value="$(lynx -dump "$url$1" | grep 'Last price:' | \
  awk -F: 'NF > 1 && $(NF) != "N/A" { print $(NF) }')"

if [ -z $value ] ; then
  echo "error: no value found for ticker symbol $1." >&2
  exit 1
fi

echo $value

exit 0
