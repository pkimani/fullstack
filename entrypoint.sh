#!/bin/sh
# entrypoint.sh

# Ensuring environment variables are available is typically handled in docker-compose
# This script now simply invokes the management command which will use the environment variables

#!/bin/sh
# Ensure all environment variables are used:
echo "Applying database migrations..."
python /app/manage.py migrate --noinput  # Apply database migrations

echo "Creating superuser..."
python /app/manage.py create_superuser  # Your custom command to create superuser

echo "Starting uWSGI server..."
exec "$@"
