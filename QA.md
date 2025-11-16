<span align="justify">

# Quality and Engineering Plan

This document summarizes how software quality and engineering principles are applied in this project, mapping them to the main international standards (ISO, IEEE, ABNT) and maturity models (SEI/CMMI, SPICE).

## 1. Product Focus (ISO 9126 / NBR 13596 / ISO 14598 / ISO 12119 / IEEE P1061)

- **Quality Characteristics** (Functionality, Usability, Reliability, Efficiency, Maintainability, Portability) are ensured through:
  - unit-test coverage which orchestrates the suite for the entire package;
  - metric reports that capture execution metadata and the selected models;
  - input validation to reduce defects before modeling happens.
- **Product Evaluation** (ISO 14598, IEEE P1061) occurs through continuous monitoring of accuracy metrics, class distributions, and automatic prioritization.
- **Software Packages** (ISO 12119) are handled with reproducible installation and operational guidance in `README.md`.

## 2. Development Process (ISO 12207 / NBR ISO 9001 / NBR ISO 9000-3 / NBR ISO 10011)

- **Defined Processes**: the pipeline in explicitly describes each phase (ingestion → preparation → classification → reporting), reflecting ISO 12207 process groupings.
- **Assurance and Auditing** (NBR ISO 10011, ISO 9001): artifacts in and  provide traceability for later audits.
- **Continuous Improvement** (ISO 9000-3): the automated unit tests and stored metrics deliver rapid feedback loops that support iterative enhancements.

## 3. Process Maturity (CMMI / SPICE ISO 15504)

- **Capability Levels**: consistent Git versioning, automation scripts, and centralized configuration demonstrate managed/defined maturity practices.
- **Process Assessment**: pipeline logs and test coverage act as evidence for SPICE/CMMI assessments, showing discipline across requirements, engineering, and verification.

## 4. IT Service Quality (COBIT / ITIL)

- **COBIT Alignment**: monitoring controls (word clouds, metrics dashboards) and data safeguards controlled loading insupport governance objectives.
- **ITIL Alignment**: generated results are packaged for automated email distribution, reflecting Service Delivery and Support processes.

## 5. Applied Engineering Practices

1. **Configuration Management** – centralizes parameters, maintains a controlled execution environment.
2. **Quality Automation** – the unified pipeline covers all critical modules.
3. **Data Validation** – cleaning and validation helpers detect inconsistencies early.
4. **Observability** – produce visual evidence and metrics for inspections and audits.
5. **Documentation** – `README.md`, `RAI.md`, and `QA.md` record responsibilities, ethical criteria, and quality processes, easing ISO/ABNT compliance audits.

These practices enforce adherence to the referenced standards, promoting traceability, repeatability, and continuous improvement across the project.

<span>