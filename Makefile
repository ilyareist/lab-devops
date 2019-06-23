APP_PORT := $(or ${APP_PORT},${APP_PORT},8080)
APP_HOST := $(or ${APP_HOST},${APP_HOST},0.0.0.1)
PYTHONPATH := $(or ${PYTHONPATH},${PYTHONPATH},.)


.PHONY: test
test:
	@echo -n "Run tests"
	flake8 application tests && \
		isort -rc application tests &&  \
		py.test -svvv -rs --cov=application --cov-report=term-missing -x

.PHONY: run
run:
	@echo -n "Run server "
	python hello_world.py 

.PHONY: help
help:
	@echo -n "Common make targets"
	@echo ":"
	@cat Makefile | sed -n '/^\.PHONY: / h; /\(^\t@*echo\|^\t:\)/ {H; x; /PHONY/ s/.PHONY: \(.*\)\n.*"\(.*\)"/  make \1\t\2/p; d; x}'| sort -k2,2 |expand -t 20
