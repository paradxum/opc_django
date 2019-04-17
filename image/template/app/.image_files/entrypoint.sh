#!/bin/sh

if [ "$SQL_ENGINE" = "django.db.backends.postgresql" ]; then
	echo "Waiting for postgres..."
	while ! nc -z $SQL_HOST $SQL_PORT ; do
		sleep 0.1
		done
	echo "PostgreSQL started"
	fi

python$$PYTHON_VER$$ manage.py migrate --noinput
python$$PYTHON_VER$$ manage.py collectstatic --noinput
exec "$@"
