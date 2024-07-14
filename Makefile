# default virtual env directory
VENV := venv

# default target, when make executed without arguments
all-install: venv devtools dbtools install

all-tox: venv devtools tests lint docs

all: venv devtools dbtools build tests lint install docs

venv:
	python3 -m venv $(VENV)
	./$(VENV)/bin/pip install --upgrade pip setuptools wheel build

devtools:
	./$(VENV)/bin/pip install tox bump-my-version

dbtools:
	./$(VENV)/bin/pip install pgcli

tests: devtools
	./$(VENV)/bin/tox

lint: devtools
	./$(VENV)/bin/tox -e lint

docs: devtools
	./$(VENV)/bin/tox -e gendocs
	./$(VENV)/bin/tox -e docs

build: venv
	./$(VENV)/bin/python3 -m build

install:
	./$(VENV)/bin/pip install .

clean:
	rm -r .pytest_cache || true
	rm -r .tox || true
	rm -r build || true
	rm -r src/quackamollie_core.egg-info || true
	rm -r dist || true
	rm -r $(VENV) || true
	find src/ -type f -name '*.pyc' -delete

.PHONY: all venv devtools dbtools install tests lint docs clean
