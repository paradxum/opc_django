FROM python:$$PYTHON_VER$$-alpine
ENV PYTHONUNBUFFERED 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD .image_files/requirements.txt /usr/src/app/.image_files/requirements.txt

RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev postgresql-dev \
    && apk add postgresql-client \
    && pip3 install -r .image_files/requirements.txt \
    && apk del build-deps \
    && rm -rf /var/cache/apk/*

COPY . /usr/src/app/
RUN if [ ! -d /usr/src/app/mediafiles ]; then mkdir /usr/src/app/mediafiles; fi
RUN if [ ! -d /usr/src/app/staticfiles ]; then mkdir /usr/src/app/staticfiles; fi
RUN chown 1000 -R /usr/src/app 
USER 1000

#ENTRYPOINT ["/usr/src/app/.image_files/entrypoint.sh"]
CMD ["gunicorn","$$PROJECT_NAME$$.wsgi:application","--bind","0.0.0.0:8000"]
