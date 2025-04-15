#!/bin/bash

# קבלת ערכים מהשורה בקובץ CSV
bug_id=$1
date_time=$(date +"%Y-%m-%d %H:%M:%S")
branch=$2
dev_name=$3
priority=$4
excel_desc=$5
dev_desc=$6

# צור הודעת קומיט בפורמט הדרוש
commit_message="BugID:$bug_id:$date_time:$branch:$dev_name:$priority:$excel_desc:$dev_desc"

# בצע קומיט עם ההודעה
git commit --allow-empty -m "$commit_message"

