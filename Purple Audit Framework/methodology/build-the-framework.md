# Phase 4 — Build the Framework

This phase turns research and field experience into a repeatable production-safe audit method.

The framework should be simple enough to reuse, structured enough to scale, and explicit enough to improve over time.

## Objectives

- define audit domains
- define validation types
- standardize evidence collection
- structure findings and recommendations
- make the process reusable across tenants

## Core idea

The goal is not to build a giant checklist.

The goal is to create a method that helps you answer:

- what should be reviewed
- how it should be reviewed
- what evidence should be collected
- what should never be done in production
- how findings should be reported

## Suggested audit domains

A practical starting point:

- identity surface
- privileged access
- app and workload permissions
- cross-tenant trust
- logging and detection readiness

You may expand this later depending on scope and customer maturity.

## Validation types

Use a limited set of validation types so the methodology stays clear.

### Configuration review
Review tenant configuration, policy settings, assignments, and security controls.

### Safe simulation
Perform controlled, low-risk validation steps using test identities or reduced scope.

### Log validation
Verify that relevant actions are visible in logs and can be investigated or detected.

### Manual review
Review architecture, ownership, process, and operational assumptions with stakeholders.

### Evidence collection
Collect screenshots, exports, logs, and structured notes to support findings.

## Example framework logic

For each control or audit objective, capture:

- domain
- control name
- why it matters
- validation type
- tool or source used
- evidence collected
- result
- risk
- recommendation

## Evidence philosophy

Evidence should be:

- lightweight
- structured
- useful for remediation
- understandable by others
- reproducible where possible

Avoid collecting evidence that is impressive but not actionable.

## Reporting philosophy

The framework should produce output that is:

- safe to share internally
- easy to prioritize
- tied to operational decisions
- reusable in future audits

## Output of the framework phase

At the end of this phase, you should have:

- a stable audit structure
- repeatable review steps
- an evidence model
- reporting templates
- a foundation for a repository and future contributions

## Practical notes

- keep the framework smaller than your knowledge
- prioritize repeatability over exhaustiveness
- document assumptions
- mark high-risk validation steps clearly
- keep unsafe or destructive actions out of the default methodology

## Transition to the next phase

Once the method is usable, share it:

- findings
- templates
- procedures
- lessons learned
- contribution paths
