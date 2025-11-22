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

## Dependency locking

Regenerate `uv.lock` whenever `requirements.txt` changes to keep deployments reproducible:

```bash
del uv.lock          # on macOS/Linux use: rm uv.lock
uv pip compile requirements.txt -o uv.lock
```

## Test metrics dashboard

Visualize the latest pipeline metrics with Streamlit:

```bash
streamlit run dashboards/test_metrics_dashboard.py
```

## Pipeline steps

Insert steps

## Project structure

Insert structure

## Architecture

The end-to-end solution follows a layered layout so each concern can be tested and evolved independently:

- **Automation layer (`robots/`)** – `robots/aut_tests.sh` bootstraps `.venv`, installs dependencies, runs `pytest`, and (when available) launches the Streamlit metrics dashboard. Other helpers in `robots/` manage dataset extraction and Git automation.
- **Core services (`script/python`)** – `aut.py` orchestrates ingestion, preprocessing, model execution (LLM, BERT, Hugging Face API, classical ML, or local pipelines), reporting, visualization, and notifications. Supporting modules (config, IO, modeling, reporting, visualization) encapsulate each responsibility.
- **Testing layer (`tests/`)** – Every critical module has targeted unit tests (`tests/test_modeling_utils.py`, `tests/test_preprocessing_utils.py`, etc.). Running `python -m pytest` or `bash robots/aut_tests.sh` executes the suite. `pytest.ini` excludes helper directories (e.g., `dashboards/`) from discovery to keep runs deterministic.
- **Quality dashboards (`dashboards/`)** – `dashboards/test_metrics_dashboard.py` visualizes `METRICS_FILE` via Streamlit, exposing backend metadata, vectorizer scores, classification reports, and feature-importance tables immediately after each run.
- **Artifacts & observability** – Outputs under `output/` (tagged Excel, word clouds, distribution charts) plus `inputs/nlp_metrics.json` provide traceability and power both the dashboard and audit processes.

## Key environment variables

Insert environment variables

## Open source & community

This repository is released under the [MIT License](LICENSE), which allows reuse in commercial and government contexts provided attribution is preserved. Contributions from the community are welcome review [CONTRIBUTING.md](CONTRIBUTING.md) for the workflow and reference the [Code of Conduct](Code%20of%20Conduct.md) when engaging with other contributors.

</span>
