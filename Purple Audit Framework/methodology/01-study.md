# Phase 2 — Study

Before validating anything in production, study the terrain.

This phase is about reducing guesswork and building context before touching tools in a live tenant.

## Objectives

- understand relevant Azure and Entra ID attack paths
- identify existing defensive controls
- review Microsoft documentation and operational guidance
- map the tooling landscape
- collect community knowledge and prior field lessons
- define the first draft of the audit scope

## What to study

### Attack paths
Focus on identity-driven attack paths rather than specific tools first.

Examples:

- token-centric access paths
- app and workload permissions
- privileged roles and elevation paths
- Conditional Access exposure
- MFA registration and authentication method risks
- cross-tenant trust and collaboration paths
- logging and detection blind spots

### Control plane exposure
Study how access is granted, inherited, delegated, and monitored across:

- Entra ID
- Azure subscriptions and management groups
- enterprise applications
- app registrations
- managed identities
- M365-connected workloads

### Existing controls
Review what is already supposed to protect the tenant, such as:

- Conditional Access
- MFA and authentication strengths
- PIM
- RBAC and role assignments
- app consent controls
- Sentinel rules and detections
- audit and sign-in logging

## Sources of knowledge

Build this phase from multiple sources.

### Official sources
- Microsoft documentation
- product guidance
- architecture references
- best practice documentation

### Research sources
- conference talks
- training material
- technical blogs
- community write-ups
- tool documentation

### Field sources
- prior audit notes
- incident patterns
- lessons learned from production environments
- common customer misconfigurations
- recurring blind spots

## Tooling landscape

During the study phase, map the tools you may rely on later.

### Native Microsoft tooling
- Microsoft Graph PowerShell
- Az PowerShell
- Entra Portal
- Azure Portal
- Microsoft Sentinel
- Microsoft Secure Score
- Configuration Analyzer

### Community and specialized tooling
- PingCastle
- Monkey365
- ScubaGear
- ORCA
- AADInternals
- GraphSpy
- other scoped research tools as needed

Important: the goal is not to collect tools. The goal is to understand what each tool helps validate.

## Outputs of the study phase

At the end of this phase, you should have:

- a list of relevant attack paths
- a list of controls worth validating
- a mapped tooling set
- known gaps and blind spots
- a first version of your audit domains
- a better idea of what can be safely validated in production

## Practical notes

- start with the path, not the script
- do not confuse tool familiarity with audit readiness
- study what is realistic in the customer environment
- focus on reusable understanding, not only one-off techniques

## Transition to the next phase

Once the landscape is understood, move into exploration:

- test tools safely
- validate assumptions
- understand generated logs and noise
- learn where theory breaks in practice
