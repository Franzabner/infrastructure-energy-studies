# EPI Energy Framing Boundary

Status: scaffolded
Publication state: public scaffold
Release state: not released

## Purpose

This file defines the narrow public-safe boundary for using Energy Per Intelligence (EPI) language inside infrastructure energy studies.

It exists only to support generic energy-framing vocabulary. It does not include measured values, hardware measurements, model outputs, benchmark outputs, raw traces, deployment language, production language, or customer outcome language.

## Allowed Framing

| Framing area | Public-safe use | Boundary |
| --- | --- | --- |
| Energy vocabulary | Discuss energy as a review category in synthetic AI study planning. | No measured energy value or hardware behavior claim. |
| Assumption discipline | Name assumptions that would need review before publication. | No private workload, site, facility, endpoint, topology, or operational detail. |
| EPI relation | Point to EPI as a taxonomy for useful-work-per-energy discussion. | No EPI score, ranking, proof, or public result. |
| Review gates | Require human review before stronger public claims. | No approval implied by scaffold status. |

## Required Exclusions

Do not include:

- measured values;
- raw traces;
- hardware measurements;
- private workloads;
- private corpora;
- model identifiers;
- energy output claims;
- production procedures;
- deployment language;
- customer or client outcome language;
- safety approval or certification language;
- external release-surface claims.

## Routing Rule

Use `data-model-infrastructure` for model and evaluation boundaries, `engineering-simulation-lab` for synthetic study framing, and `engineering-standards-and-validation` for claim language. This file is only the energy-framing boundary.
