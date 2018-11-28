#!/bin/sh

export TEXT_FILES=$(file * | grep -E 'ASCII|UTF' | cut -d: -f1)

cat $TEXT_FILES | tr -c a-zA-Z '\n' | sort | uniq -c | sort -n
