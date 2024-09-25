#!/bin/bash

# Define the cron job
CRON_JOB="*/5 * * * * /path/to/check_website.sh"

# Check if this script is already scheduled in cron
if crontab -l | grep -qF "$CRON_JOB"; then
    echo "The cron job for check_website.sh is already set up."
else
    # Add the cron job if not found
    (crontab -l; echo "$CRON_JOB") | crontab -
    echo "Cron job added: $CRON_JOB"
fi

# List of URLs to check
URLS=(
    "http://yourwebsite.com/dir1"
    "http://yourwebsite.com/dir2"
    "http://yourwebsite.com/dir3"
    "http://yourwebsite.com/dir4"
    "http://yourwebsite.com/dir5"
)

# Loop through each URL and check its status
for URL in "${URLS[@]}"; do
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
    if [ "$STATUS" -ne 200 ]; then
        echo "Website $URL is down! Status code: $STATUS" | mail -s "Website Alert: $URL is down" your_email@example.com
    fi
done

