# Opinionated Django Project Creator

# Description
This script creates a Django project with a bunch of additional "stuff" to make it much easier to work on
and eventually get to a production type environment. This is not meant to be a FINAL configuration for you,
but rather a consistant starting point so you don't always spend half a day getting projects set up

## The main things it does are:
* Create the Django Project
* Create a superuser of admin/admin in django for your local dev environment
* Create docker images for:
..* Main Django App (gunicorn)
..* Postgres Database
..* Nginx to serve media/static files
..* Redis for caching
* Create a docker-compose file for local dev/testing
* Load up django-extensions, django debug toolbar and debugger
* Copy in some quick access scripts so you don't have to remeber how to start everything up
* Add in the basic gitlab project stuff
* Setup basic continuous integration through gitlab-ci
* Create your gitlab project and do an inital upload
* Create a basic helm chart for running on kube
* Setup a kube cd pipeline for a "test" environment

# Usage:
1. Download the latest version of the script (JUST the script) from the releases page:
...https://github.com/paradxum/opc_django/releases
1. Customize the script file. Decide if you want the helm, gitlab, kubernettes parts
1. Run the script to create the project
...```create_django_project <project name> <app name>```
1. It will create the project in a directory named &lt;project name&gt; and a logfile with the .log extension
1. If you are setting up the CI/CD stuff (helm chart, kube deployment) be sure to read CICD_SETUP within the project 

# Credit to those that have come before me
* gitlab-semantic-versioning
...https://github.com/mrooding/gitlab-semantic-versioning
* Dockerizing Django/Postgres/Gunicorn/Nginx
...https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/
* Dockerized Django CI testing
...https://peakwinter.net/blog/modern-devops-django/
* Gitlab CI - Helm - Deploy
...https://about.gitlab.com/2017/09/21/how-to-create-ci-cd-pipeline-with-autodeploy-to-kubernetes-using-gitlab-and-helm/
* Redis Caching
...http://michal.karzynski.pl/blog/2013/07/14/using-redis-as-django-session-store-and-cache-backend/
