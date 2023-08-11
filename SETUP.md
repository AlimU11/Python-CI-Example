When setting up project, consider to check the following:

- Makefile:
  - check python version
  - check gitignore template
- .pre-commit-config.yaml
  - check python version
  - adjust `check-added-large-files` args
  - check `default-stages`
  - check line length for black
- setup.cfg
  - check line length for flake8
- .gitignore
  - add additional content if needed
- .env
  - set up required variables
- .github/workflows/python-ci.yml
  - check python version
  - update `on` section
  - check uses section for actions versions update
