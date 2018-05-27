FOLDER = venv
PYVERSION = $(shell python -V 3>&1 | sed 's/Python //g' | cut -c 1)
.DEFAULT_GOAL := all

ifneq ($(PYVERSION), 3)
	PYTHON = python3
else
	PYTHON = python
endif


all: jupyter_extend

venv:
	$(PYTHON) -m venv $(FOLDER) 

activate: venv
	bash -c "source $(FOLDER)/bin/activate; pip install -r requirements.txt"

jupyter_extend: activate
	bash -c "source $(FOLDER)/bin/activate; jupyter nbextension enable --py --sys-prefix widgetsnbextension"

run:
	bash -c "source $(FOLDER)/bin/activate; jupyter-notebook"

clean:
	rm -rf $(FOLDER)


