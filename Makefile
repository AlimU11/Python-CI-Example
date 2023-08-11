PYTHON_VERSION=3.10
GITIGNORE_TEMPLATE=python

.PHONY: init
init:
	@echo "Initializing project..."
	poetry init --no-interaction --python "^$(PYTHON_VERSION)"
	poetry add --group dev \
		pre-commit \
		pre-commit-hooks \
		add-trailing-comma \
		git-ignore \
		black \
		isort \
		autoflake \
		unify \
		mypy \
		wemake-python-styleguide
	poetry add --group test \
		pytest \
		pytest-clarity \
		pytest-cov \
		pytest-sugar \
		pytest-xdist

	@echo "Creating gitignore..."
	git-ignore $(GITIGNORE_TEMPLATE)

	@echo "Creating README.md and .env..."
	touch README.md .env

	@echo "Setting up CI config..."
	mkdir .github
	cd .github
	mkdir workflows
	cd ..
	mv python-ci.yml .github/workflows/python-ci.yml

	@echo "Initializing git repository..."
	git init
	git add .

	@echo "Installing pre-commit hooks..."
	pre-commit install
	pre-commit autoupdate

.PHONY: lint
lint:
	@echo "Linting project..."
	git stash -k
	pre-commit run --all-files
	git add -u
	git stash pop
	rm -rf .mypy_cache
