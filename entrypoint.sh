#!/bin/sh
# entrypoint.sh

# Ensuring environment variables are available is typically handled in docker-compose
# This script now simply invokes the management command which will use the environment variables

#!/bin/sh
# Ensure all environment variables are used:
echo "Waiting for PostgreSQL to start..."

# Use netcat-traditional's nc command with environment variables for PostgreSQL host and port
while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
  sleep 0.1
done
echo "PostgreSQL started"

echo "Applying database migrations..."
python /app/manage.py migrate --noinput

echo "Creating superuser..."
python /app/manage.py create_superuser

echo "Starting uWSGI server..."
exec "$@"