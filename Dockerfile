FROM        ec2-deploy:base

# Copy project files
COPY        .   /srv/project
WORKDIR     /srv/project

# Virtualenv path
RUN         export VENV_PATH=$(pipenv --venv); echo $VENV_PATH;
ENV         VENV_PATH $VENV_PATH

# Run uWSGI (CMD)
CMD         pipenv run uwsgi \
                --http :8000 \
                --chdir /srv/project/app \
                --home ${VENV_PATH} \
                --module config.wsgi
