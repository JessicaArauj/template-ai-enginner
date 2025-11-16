<span align="justify">

## Overview

Insert descripition

## Project scope

Insert scope

## Prerequisites

Insert requirements

## Robots helper scripts

Automation helpers that live in `robots/` make repetitive tasks easier. Run them from the repository root using Git Bash, WSL, or any Unix-like shell:

- `bash robots/aut_setup.sh`: creates (or recreates) `.venv`, upgrades `pip`, purges the cache, and installs dependencies from `requirements.txt`. Set `PYTHON_BIN="py -3.11"` or similar if you need a custom interpreter.
- `bash robots/aut_extraction.sh`: downloads the latest SISAGUA vigilance ZIP, saves it under `backup/`, and extracts the CSVs so you can inspect or pre-process them offline.
- `bash robots/aut_git.sh [--options]`: stages every change, prompts for a Conventional Commit-style message (unless `-m/--message` is provided), commits, and optionally pushes to the current branch. Pass `--no-push` to skip `git push`.

Each script is idempotent and prints its progress so you can confirm every step succeeded.

## Pipeline steps

Insert steps

## Project structure

Insert structure

## Architecture

Insert architecture

## Key environment variables

Insert environment variables

## Open source & community

This repository is released under the [MIT License](LICENSE), which allows reuse in commercial and government contexts provided attribution is preserved. Contributions from the community are welcome review [CONTRIBUTING.md](CONTRIBUTING.md) for the workflow and reference the [Code of Conduct](Code%20of%20Conduct.md) when engaging with other contributors.

</span>
