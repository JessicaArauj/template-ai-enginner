<span align="justify">

## Security Policy

### Supported versions

This repository is delivered as source code. Apply the latest commits before deploying to production and pin dependencies using the provided `requirements.txt`.

### Reporting a vulnerability

1. **Do not** open public issues for suspected vulnerabilities.
2. Report privately via the GitHub Security Advisory workflow or email `security@repository.org`.
3. Provide:
   - A detailed description of the issue and potential impact.
   - Steps to reproduce, including sample data if possible (redacted/pseudonymized).
   - Suggested remediation ideas, if any.

We aim to acknowledge reports within five business days and will keep the reporter informed as we triage, validate, and fix the issue.

### Operational hardening

- Keep API keys (`API_KEY`, SMTP credentials) in secret managers, never in the repository.
- Restrict access to `inputs/` and `output/` folders because they may contain sensitive process descriptions and model outputs.
- Review dependencies periodically for CVEs (`pip list --outdated`, `pip-audit`, etc.) and update `requirements.txt` as needed.

</span>
