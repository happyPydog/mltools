.PHONY: test coverage install

check_poetry:
	@command -v poetry >/dev/null 2>&1 || { echo >&2 "Poetry is not installed. Installing poetry..."; \
		curl -sSL https://install.python-poetry.org | python3 -; }

coverage:
	poetry run pytest --cov \
		--cov-config=.coveragerc \
		--cov-report xml \
		--cov-report term-missing:skip-covered

test:
	python -m pytest

install: check_poetry
	poetry config virtualenvs.in-project true
	poetry install

typecheck:
	poetry run mypy .