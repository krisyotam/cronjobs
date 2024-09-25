#!/bin/bash

# Define the cron job
CRON_JOB="0 3 * * * /path/to/automated_updates.sh"

# Check if this script is already scheduled in cron
if crontab -l | grep -qF "$CRON_JOB"; then
    echo "The cron job for automated_updates.sh is already set up."
else
    # Add the cron job if not found
    (crontab -l; echo "$CRON_JOB") | crontab -
    echo "Cron job added: $CRON_JOB"
fi

# Update and upgrade the system
echo "Running system updates..."
apt update && apt upgrade -y

# Clean up unused packages
apt autoremove -y

echo "System updates completed."
