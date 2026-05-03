#!/bin/bash
FILE="/app/bbk.log"
/usr/bin/timeout 120 /app/bbk --quiet > $FILE
	TIMESTAMP=$(date '+%s')
	UPLOAD=$(awk '{print $3}' $FILE)
	PING=$(awk '{print $1}' $FILE)
	DOWNLOAD=$(awk '{print $2}' $FILE)
  echo -e "{\n    \"Download\": $DOWNLOAD,\n    \"Upload\": $UPLOAD,\n    \"Ping\": $PING\n}"