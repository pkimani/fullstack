#!/bin/sh
CONFIG_FILE="/usr/local/etc/redis/redis.conf"

# Ensure the environment variable is not empty
if [ ! -z "$REDIS_PASSWORD" ]; then
    # Check if requirepass is commented out
    if grep -q '^# requirepass' "$CONFIG_FILE"; then
        # Uncomment the requirepass directive and set the password
        sed -i "/^# requirepass/c\requirepass $REDIS_PASSWORD" "$CONFIG_FILE"
    else
        # If requirepass is not found, add it to the configuration
        echo "requirepass $REDIS_PASSWORD" >> "$CONFIG_FILE"
    fi
fi

# Start Redis with the modified configuration
exec redis-server "$CONFIG_FILE"
