.DEFAULT_GOAL = help

SHELL = /bin/bash

.PHONY: install uninstall run run-batch help

VIRTUAL_ENV = $(PWD)/build/deeptune
PYTHON_VERSION = 3.6
PYTHON = $(VIRTUAL_ENV)/bin/python$(PYTHON_VERSION)
PIP = $(VIRTUAL_ENV)/bin/pip$(PYTHON_VERSION)

venv = source $(VIRTUAL_ENV)/bin/activate &&

# list of Jupyter notebooks. This is used by the `run-batch` target, which
# converts each of them to standalone python scripts and runs them.
notebooks = $(patsubst %.ipynb,%,$(wildcard %.ipynb))

# install Jupyter kernel and python packages
# note that Keras pulls in tensorflow as a dependency, wheras we want to use
# the tensorflow-gpu package. Possible workaround is to use --no-deps when
# installing Keras, but there may be other valuable dependencies lost. My
# approach is to simply uninstall the tensorflow pulled in by keras after
# install. See: https://github.com/fchollet/keras/issues/5766
install: .ipython/kernels/e2e-dl/kernel.json $(VIRTUAL_ENV)/bin/clgen
	$(MAKE) -C ../data essential
	mkdir -p ~/.ipython/kernels
	test -d ~/.ipython/kernels/e2e-dl || cp -Rv .ipython/kernels/e2e-dl ~/.ipython/kernels
	$(venv) $(PIP) install -r requirements.txt
	$(venv) $(PIP) uninstall -y tensorflow
	$(venv) $(PIP) install --upgrade --force-reinstall tensorflow-gpu==1.0.1

# make Jupyter kernel
.ipython/kernels/e2e-dl/kernel.json: .ipython/kernels/e2e-dl/kernel.json.template
	cp $< $@
	sed "s,@PYTHON@,$(PYTHON)," -i $@

# build patched CLgen 0.2.15
$(VIRTUAL_ENV)/bin/clgen: $(VIRTUAL_ENV)/bin/activate
	$(venv) curl -s https://raw.githubusercontent.com/ChrisCummins/clgen/0.2.15/install-deps.sh | bash
	test -d build/clgen || git clone https://github.com/ChrisCummins/clgen.git build/clgen
	cd build/clgen && git reset --hard 0.2.15
	cd build/clgen && git cherry-pick 6f891cb3ca02b2ed6e25af038a6550a61ff4a5fe
	cd build/clgen && git apply ../../clgen-0.2.15-unknown-device-type.patch
	$(venv) cd build/clgen && ./configure --batch --with-opencl --with-cuda
	$(venv) cd build/clgen && make
	$(venv) cd build/clgen && make install
	$(venv) cd build/clgen && make test

# create Python virtualenv
$(VIRTUAL_ENV)/bin/activate:
	virtualenv -p python$(PYTHON_VERSION) $(VIRTUAL_ENV)

uninstall:
	$(MAKE) -C ../data clean
	rm -rf  .ipython/kernels/e2e-dl/kernel.json \
		~/.ipython/kernels/e2e-dl \
		$(VIRTUAL_ENV) \
		$(addsuffix .py,$(notebooks))

run:
	$(venv) jupyter notebook

run-batch:
	@for f in $(notebooks); do \
		echo "$(venv) jupyter-nbconvert --to script \"$$f.pynb\""; \
		$(venv) jupyter-nbconvert --to script "$$f.ipynb"; \
		echo "$(PYTHON) \"$$f.py\""; \
		$(PYTHON) "$$f.py"; \
		rm "$$f.py"; \
	done

help:
	@echo "usage: make {install,run,run-batch,uninstall}"
