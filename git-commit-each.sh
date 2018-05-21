#!/bin/bash

# Commit all modified files in commits with one modified file per commit
for FILENAME in $(git ls-files --modified --others)
do
  MESSAGE="$(echo "$FILENAME" | sed -e 's|^Library/Homebrew/||' \
                                     -e 's|^Formula/||' \
                                     -e 's|^Casks/||' \
                                     -e 's/\.rb//' \
                                     -e 's/$/: /')"
  git add "$FILENAME"
  git commit "$FILENAME" --message="${MESSAGE}${*}"
done