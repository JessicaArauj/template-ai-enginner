# Agents Guide Template

> Use this template to describe automated agents, their roles, capabilities, and operational expectations.

## 1. Document Metadata
| Field | Value |
| --- | --- |
| Author(s) | _Names and contact info_ |
| Version | _SemVer or date_ |
| Last Updated | _YYYY-MM-DD_ |
| Related Docs | _Architecture, runbooks, RFCs_ |

## 2. Overview
- **Purpose**: _Why the agent exists and the business problem it solves._
- **Scope**: _Boundaries of responsibility; what the agent must and must not do._
- **Status**: _Prototype / Beta / Production._

## 3. Agent Catalog
| Agent ID | Name | Primary Role | Owner | Status |
| --- | --- | --- | --- | --- |
| `agent-001` | _Human-friendly name_ | _Core responsibility_ | _Team/person_ | _Active / Paused_ |

## 4. Capabilities and Behaviors
### 4.1 Skills Matrix
| Capability | Description | Agent(s) | Confidence/Accuracy |
| --- | --- | --- | --- |
| _Intent classification_ | _What the skill does_ | `_agent-001`, `_agent-002` | _95%_ |

### 4.2 Policies
- **Input Requirements**: _Supported languages, formats, authentication needs._
- **Decision Rules**: _Key heuristics, guardrails, escalation paths._
- **Output Guarantees**: _Latency targets, completeness, response format._

## 5. Interaction Flows
- **Triggering Events**: _User actions, cron, webhooks, other agents._
- **Conversation Patterns**: _Sample dialogues, expected tone, fallback behavior._
- **Handoff Protocols**: _When to hand off to humans or peer agents._

## 6. Architecture Integration
- **Dependencies**: _APIs, databases, message buses, external services._
- **Data Contracts**: _Input/output schemas, validation rules, PII handling._
- **Runtime Environment**: _Hosting platform, scaling strategy, observability hooks._

## 7. Safety and Compliance
- **Guardrails**: _Content filters, rate limits, domain restrictions._
- **Monitoring**: _Metrics, alerts, dashboards for drift or regression._
- **Privacy**: _Retention policies, encryption, consent capture._

## 8. Operational Playbooks
- **Deployment**: _CI/CD steps, feature flag strategy, rollout checklist._
- **Incident Response**: _Runbooks, on-call rotation, escalation contacts._
- **Continuous Improvement**: _Feedback loops, retraining cadence, evaluation datasets._

## 9. Open Issues and Roadmap
| Item | Owner | Due Date | Notes |
| --- | --- | --- | --- |
| _e.g., extend knowledge base_ | _Name_ | _YYYY-MM-DD_ | _Context_ |

## 10. Appendix
- _Glossary of agent-specific terms._
- _Example prompts, test cases, benchmark results._
- _Links to monitoring dashboards or analytics notebooks._
