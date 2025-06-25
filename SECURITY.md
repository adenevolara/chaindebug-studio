# Security & CI/CD Gates

On every pull request, we automatically run:

1. **pytest**  
   ```bash
   pytest
flake8
mypy .
bandit -r src/
pip-audit
trivy fs .
