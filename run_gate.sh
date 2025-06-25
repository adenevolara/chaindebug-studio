#!/usr/bin/env bash
set -e
pytest
flake8
mypy .
bandit -r src/
pip-audit
trivy fs .
echo "GATE PASSED"
