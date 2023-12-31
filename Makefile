check_poetry:
	@command -v poetry >/dev/null 2>&1 || { echo >&2 "Poetry is not installed. Installing poetry..."; \
		curl -sSL https://install.python-poetry.org | python3 -; }

coverage:
	pytest --cov \
		--cov-config=.coveragerc \
		--cov-report xml \
		--cov-report term-missing:skip-covered

test:
	pytest tests

install:
	pip install --upgrade pip setuptools
	pip install -r requirements.txt
	pip install -r requirements-dev.txt

lint:
	black .
	mypy .