# Architecture Template

> Use this outline to describe a system or feature before implementation. Replace the italic guidance with the specific details for your project.

## 1. Document Metadata
| Field | Value |
| --- | --- |
| Project | _Name of the system or initiative_ |
| Authors | _Primary authors and contributors_ |
| Stakeholders | _Key reviewers and approvers_ |
| Status | _Draft / Proposed / Approved_ |
| Last Updated | _YYYY-MM-DD_ |
| Related Docs | _Links to specs, tickets, RFCs, etc._ |

## 2. Summary
### 2.1 Problem Statement
_Explain the business problem, user pain points, and strategic context this architecture addresses._

### 2.2 Goals and Non-Goals
- **Goals**
  - _Numbered or bulleted list describing desired outcomes._
- **Non-Goals**
  - _Work intentionally left out of scope to avoid ambiguity._

### 2.3 Success Metrics
- _Quantitative and qualitative metrics that indicate success (e.g., latency, adoption, revenue impact)._

## 3. Architecture Overview
### 3.1 Context Narrative
_Describe how this system interacts with upstream/downstream systems and where it fits in the broader ecosystem._

### 3.2 Diagrams
_Embed or link context, container, and component diagrams (Mermaid, PlantUML, or image links)._

### 3.3 Assumptions and Constraints
- _Technical, organizational, regulatory, or time constraints that shape the design._
- _Assumptions about traffic, data quality, partner systems, etc._

## 4. Functional Architecture
### 4.1 Feature Breakdown
_Summarize the key capabilities and flows the architecture must support._

### 4.2 Component Responsibilities
| Component | Responsibilities | Tech Stack | Owner |
| --- | --- | --- | --- |
| _Service / Module_ | _What it does and why it exists_ | _Languages, frameworks, runtimes_ | _Team / person_ |

### 4.3 API and Contract Design
- _List external and internal APIs, events, or queues, including payload shapes, protocols, and SLAs._

## 5. Data and Storage
### 5.1 Domain / Data Model
_Describe entities, relationships, and notable invariants. Include ERDs where helpful._

### 5.2 Storage Strategy
- _Datastores used, partitions, retention policies, and backup/restore approach._

### 5.3 Data Lifecycle and Governance
- _How data is produced, transformed, consumed, and deleted._
- _Privacy classifications and compliance requirements._

## 6. Quality Attributes
### 6.1 Performance and Scalability
- _Expected load, scaling patterns (vertical/horizontal), caching strategy, capacity planning assumptions._

### 6.2 Reliability and Disaster Recovery
- _Availability targets, redundancy, failover, RPO/RTO, chaos/resiliency testing plans._

### 6.3 Security and Privacy
- _Authentication, authorization, secrets management, threat model summary, data protection controls._

### 6.4 Observability
- _Logging, metrics, tracing, alerting thresholds, dashboards._

### 6.5 Compliance and Sustainability
- _Industry standards, accessibility, sustainability/finops considerations._

## 7. Deployment and Operations
### 7.1 Environment Strategy
- _List environments (dev/stage/prod), access controls, and data parity expectations._

### 7.2 CI/CD Pipeline
- _Describe build, test, and deployment automation, including rollback strategy._

### 7.3 Runtime Topology
- _Detail infrastructure layers: compute, networking, edge components, service mesh, etc._

## 8. Risks and Mitigations
| Risk | Impact | Likelihood | Mitigation / Owner |
| --- | --- | --- | --- |
| _Describe a credible risk_ | _e.g., High/Med/Low_ | _Probability_ | _Plan to reduce or accept risk_ |

## 9. Open Questions
- _Track unresolved items, dependencies, or decisions needed. Include an owner and due date for each._

## 10. Decision Log
| Date | Decision | Context | Status |
| --- | --- | --- | --- |
| _YYYY-MM-DD_ | _What was decided_ | _Why it was needed_ | _Proposed / Accepted / Superseded_ |

## 11. Appendix
- _Glossary of domain terms._
- _Links to prototypes, experiments, benchmarks, or user research._
- _Additional notes that do not fit into the sections above._
