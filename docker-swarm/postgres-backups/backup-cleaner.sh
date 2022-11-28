#!/bin/bash

EXPIRE_DAYS=7
BACKUPS_PATH=/path/backup
FILES=$(find $BACKUPS_PATH -type f)

for file in $FILES;
   do
         timestamp=$(date -r $file +%Y%m%d);
         echo "Processing $file file..";
         date1yrs=$(date -d "$timestamp" +%Y);
         date1days=$(date -d "$timestamp" +%j);
         date2yrs=$(date +%Y);
         date2days=$(date +%j);
         diffYear=$(expr "$date2yrs" - "$date1yrs");
         diffYear2days=$(expr "$diffYear" \* 365);
         diffDays=$(expr "$date2days" - "$date1days");
         DAYS=$(expr "$diffYear2days" + "$diffDays");

         if [ "$DAYS" -ge $EXPIRE_DAYS ]
           then
                echo "Deleting $file file...";
                rm "$file";
         fi
   done

echo 'Done'
