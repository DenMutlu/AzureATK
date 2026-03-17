# Phase 6 — Disclaimer and Safety Notes

AzureATK is built around a production-safe philosophy.

This repository is intended to help practitioners validate Azure and Entra ID security assumptions in authorized environments without creating unnecessary operational risk.

## Authorized use only

Use this framework only in environments where you have explicit authorization.

Do not use this repository, its procedures, or related tooling against systems, tenants, or identities outside approved scope.

## Production-safe philosophy

This project prefers:

- reduced scope
- controlled validation
- test identities where possible
- evidence collection
- visibility and detection checks
- minimal operational impact

The goal is to validate assumptions safely, not to prove how much damage could be caused.

## What to avoid by default

Unless explicitly approved, avoid:

- destructive testing
- uncontrolled phishing
- broad privilege changes
- disruptive policy manipulation
- tenant-wide experiments
- actions likely to interrupt operations
- any unsafe validation step without stakeholder agreement

## Scope matters

Before validating anything, define:

- who approved the work
- what tenant or subscriptions are in scope
- what identities may be used
- what time window is allowed
- what business risk is acceptable
- what must never be touched

## Evidence and privacy

Collect only the evidence needed to support findings.

Be careful with:

- tokens
- secrets
- personal data
- mailbox content
- customer business data
- screenshots containing sensitive context

Sanitize shared output when needed.

## Tooling caution

Some tools referenced in this repository may support advanced or offensive workflows.

That does not make them appropriate for every audit.

Always evaluate:

- required permissions
- generated logs
- operational noise
- safety in the target environment
- whether a safer alternative exists

## Final principle

If a validation step cannot be explained, scoped, approved, and justified, it should not be part of a production-safe audit.

Safety is not a limitation. It is part of the methodology.
