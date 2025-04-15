#!/bin/bash
while IFS=',' read -r bug_id branch dev_name priority excel_desc dev_desc
do
  Q3/commit.sh "$bug_id" "$branch" "$dev_name" "$priority" "$excel_desc" "$dev_desc"
done < Q3/bugs.csv

