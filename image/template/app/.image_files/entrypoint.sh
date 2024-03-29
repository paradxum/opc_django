#!/bin/sh

if [ "$SQL_ENGINE" = "django.db.backends.postgresql" ]; then
    echo "Waiting for postgres..."
    while ! nc -z $SQL_HOST $SQL_PORT ; do
        sleep 0.1
        done
    # Bitnami postgres likes to start, setup, stop then start again... so give it a chance to do that.
    sleep 3
    while ! nc -z $SQL_HOST $SQL_PORT ; do
        sleep 0.1
        done
    echo "PostgreSQL started"
    fi

python3 manage.py migrate --noinput
python3 manage.py collectstatic --noinput
exec "$@"
