FORMATTER=../ansible.git/docs/bin/plugin_formatter.py

.PHONY: docs test

all: test

docs:
	PYTHONPATH=../ansible.git/lib $(FORMATTER) -t rst --template-dir=../ansible.git/docs/templates --module-dir=library -o docs/
	python README.py

pyflakes:
	-pyflakes library/*.py

pep8:
	-pycodestyle --max-line-length=160 --config=/dev/null --ignore=E305,E402,E722,E741 library/ module_utils/

compile:
	python -m compileall library/ module_utils/

test: compile pyflakes pep8
