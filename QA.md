# Quality and Engineering Plan

This project follows internationally recognized quality standards (ISO, IEEE, ABNT) and maturity models (SEI/CMMI, SPICE) to guarantee a controlled, auditable, and continuously improving delivery process.

## 1. Product Focus (ISO 9126 / NBR 13596 / ISO 14598 / ISO 12119 / IEEE P1061)

- **Quality characteristics** (functionality, usability, reliability, efficiency, maintainability, portability) are enforced through:
  - comprehensive unit tests run via robots/aut_tests.sh, which executes "python -m pytest" across script/python;
  - structured metric reports (reporting_utils.save_metrics_summary) that capture model choice, accuracy, and run metadata;
  - proactive validation (preprocessing_utils.validate_training_data) that stops the pipeline when inputs are incomplete or mislabeled.
- **Product evaluation** (ISO 14598 / IEEE P1061) is supported through recurring accuracy tracking, word clouds, and class-distribution plots.
- **Software package discipline** (ISO 12119) is maintained with reproducible installs (requirements.txt, uv.lock) and usage documentation (README.md).

## 2. Development Process (ISO 12207 / NBR ISO 9001 / NBR ISO 9000-3 / NBR ISO 10011)

- **Defined workflow**: script/python/aut.py documents the end-to-end flow (ingestion -> preparation -> classification -> reporting), mirroring ISO 12207 process areas.
- **Assurance & auditability**: generated artifacts (output/tagged_file.xlsx, output/nlp_metrics.json, visualizations under output/nlp_visualizations/) provide traceability for ISO 9001 and NBR ISO 10011 audits.
- **Continuous improvement**: regression-safe unit tests plus stored metrics give quick feedback loops, aligning with ISO 9000-3 principles.

## 3. Process Maturity (CMMI / SPICE ISO 15504)

- **Capability evidence**: consistent Git workflows, scripted automation (robots/*.sh), and explicit configuration (script/python/config.py) reflect Managed/Defined maturity levels.
- **Assessment hooks**: logs, test reports, and metric files serve as measurable artifacts for SPICE/CMMI evaluations across requirements, engineering, and verification disciplines.

## 4. IT Service Quality (COBIT / ITIL)

- **COBIT alignment**: monitoring controls (dashboards, word clouds, classification metrics) and data-governance safeguards (io_utils.resolve_input_file) uphold governance objectives.
- **ITIL alignment**: automated emailing (email_utils.send_result_email) and consistent reporting support Service Delivery and Continual Service Improvement practices.

## 5. Applied Engineering Practices

1. **Configuration & dependency management** – config.py consolidates parameters; robots/aut_tests.sh guarantees deterministic environments; dependency locks are regenerated with "del uv.lock" (or "rm uv.lock") followed by "uv pip compile requirements.txt -o uv.lock".
2. **Quality automation** – a single "pytest" entry point validates preprocessing_utils, modeling_utils, llm_utils, and every auxiliary module before deployment.
3. **Data validation** – functions like preprocess_text, combine_text_columns, and validate_training_data detect bad inputs before they reach model training.
4. **Observability** – reporting_utils, visualization_utils, and the metrics JSON expose accuracy, feature importance, and distribution insights for audits.
5. **Documentation** – README.md, RAI.md, QA.md, and CONTRIBUTING.md define responsibilities, ethics, and processes, simplifying compliance with ISO/ABNT references.

These practices ensure the solution remains traceable, repeatable, and continuously improvable while staying aligned with the cited standards.
