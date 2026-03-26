#!/bin/bash
# Script 3: Disk Auditor

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

for DIR in "${DIRS[@]}"; do
 if [ -d "$DIR" ]; then
  PERMS=$(ls -ld $DIR | awk '{print $1, $3, $4}')
  SIZE=$(du -sh $DIR 2>/dev/null | cut -f1)
  echo "$DIR => $PERMS | Size: $SIZE"
 fi
done

CONFIG_DIR="/etc/apache2"

if [ -d "$CONFIG_DIR" ]; then
 echo "Apache Config:"
 ls -ld $CONFIG_DIR
fi
