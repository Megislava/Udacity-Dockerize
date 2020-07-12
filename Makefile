setup:
	python3 -m venv ~/.container-revolution-devops

install:
	pip install --upgrade pip &&\
	 tuo

test:
    #python -m pytest -vv --cov=myrepolib tests/*.py
    #python -m pytest --nbval notebook.ipynb

validate-circleci:
    # See https://circleci.com/docs/2.0/local-cli/#processing-a-config
	circleci config process .circleci/config.yml

run-circleci-local:
    # See https://circleci.com/docs/2.0/local-cli/#running-a-job
	circleci local execute

lint:
	hadolint demos/flask-sklearn/Dockerfile
	pylint --disable=R,C,W1203,W1202 demos/**/**.py

all: install lint test