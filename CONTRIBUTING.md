<span align="justify">

# Contributing Guidelines

Thank you for helping improve this open-source water-quality classification pipeline! Follow the steps below to propose changes.

## Getting started

1. Fork the repository (or create a feature branch if you have write access).
2. Create and activate a virtual environment: `python -m venv .venv && .\.venv\Scripts\activate`.
3. Install dependencies: `pip install -r requirements.txt`.

## Development workflow

- If your change touches docs or configuration, update `README.md`, `RAI.md`, `SECURITY.md`, or other relevant files.

## Commit & pull request

1. Keep commits focused (one feature or fix per commit when possible).
2. Use descriptive commit messages (e.g., `feat: add retries`).
3. Push to your branch and open a Pull Request:
   - Describe the motivation and any trade-offs.
   - Note which backend(s) were tested.
   - Mention potential follow-up work.

## Code style & expectations

- Favor readability and small, composable functions.
- Document new environment variables or configuration flags.
- Avoid committing secrets, API keys, or real customer data.
- Respect the [Code of Conduct](Code%20of%20Conduct.md) and follow the [Security Policy](SECURITY.md) when reporting issues.

## Review process

Maintainers will review PRs for correctness, tests, and documentation. Please respond to feedback promptly; unresolved comments may delay merging. Large or sensitive changes might require additional approval from security or compliance teams.

We appreciate your contributions!

</span>
