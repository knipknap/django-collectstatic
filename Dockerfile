FROM python:3.8-buster

LABEL 'name'='django-collectstatic'
LABEL 'maintainer'='Samuel Abels <knipknap@gmail.com>'

LABEL 'com.github.actions.name'='Django Collectstatic'
LABEL 'com.github.actions.description'='Runs manage.py to collect static files'
LABEL 'com.github.actions.icon'='send'
LABEL 'com.github.actions.color'='green'

RUN apt-get update \
    && apt-get install minify

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
