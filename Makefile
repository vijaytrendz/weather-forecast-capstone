## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test


install:
	# This should be run from inside a virtualenv
	sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
	sudo chmod +x /bin/hadolint
	sudo curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/0.63.0/eksctl_Linux_amd64.tar.gz" | tar xz -C /tmp
	sudo mv /tmp/eksctl /usr/local/bin
	

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	
	hadolint Dockerfile --ignore DL3013
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
#	pylint --disable=R,C,W1203 app.py

all: install lint test