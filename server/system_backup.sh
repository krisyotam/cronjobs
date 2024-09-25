#!/bin/bash

# Variables
BACKUP_DIR="/mnt/nas_backup/system_backups"
TIMESTAMP=$(date +%F_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/system_backup_$TIMESTAMP.tar.gz"
SOURCE_DIR="/"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Create a tarball of the system
tar -czf $BACKUP_FILE $SOURCE_DIR --exclude=$BACKUP_DIR --exclude=/proc --exclude=/sys --exclude=/dev --exclude=/mnt --exclude=/media --exclude=/lost+found

echo "Backup created at: $BACKUP_FILE"
