# Audit Domain — Identity Surface

The identity surface is the foundation of the Azure and Entra ID control plane.

This domain focuses on how identities are created, authenticated, exposed, delegated, and monitored.

## Objectives

- understand which identities exist and why
- review how they authenticate
- identify exposure paths
- assess how identity actions are logged and governed
- reduce assumptions around tenant identity security

## In scope

This domain may include:

- users
- groups
- administrative identities
- external identities
- service principals
- managed identities
- authentication methods
- sign-in patterns
- registration and recovery paths

## Key review areas

### User population
Review the types of users present in the tenant.

Questions to consider:

- Are administrative accounts separated from standard user accounts?
- Are test, break-glass, and emergency accounts identified?
- Are guest users reviewed and justified?
- Are stale, disabled, or abandoned accounts present?

### Group structure
Review groups that affect identity risk and delegated access.

Questions to consider:

- Which groups control privileged access?
- Are dynamic groups used safely?
- Are group ownership and membership review processes clear?
- Are nested groups creating hidden access paths?

### Authentication methods
Review which authentication methods are enabled and who can register or modify them.

Questions to consider:

- Which methods are allowed?
- Is MFA registration governed?
- Are temporary or recovery methods well controlled?
- Are there roles that can modify authentication methods too broadly?

### Device code exposure
Review whether device code authentication is understood, allowed, restricted, or monitored.

Questions to consider:

- Is device code flow expected in this environment?
- Is it visible in logs?
- Is it restricted where appropriate?
- Would the SOC notice abnormal use?

### Service principals and managed identities
Review workload identities as part of the identity surface.

Questions to consider:

- Which apps and managed identities exist?
- Are their permissions justified?
- Are ownership and lifecycle clear?
- Are workload identities monitored?

### External identities
Review guest access and external trust relationships.

Questions to consider:

- Is guest access governed?
- Are cross-tenant trust settings understood?
- Are external collaboration defaults too permissive?
- Are MFA trust assumptions documented?

## Validation types commonly used

- configuration review
- manual review
- evidence collection
- log validation
- safe simulation with test identities where appropriate

## Useful evidence

Examples of evidence for this domain:

- sign-in logs
- audit logs
- user and group exports
- authentication method settings
- screenshots of key policies
- notes on identity ownership and exceptions

## Common findings themes

Examples:

- overexposed authentication paths
- weak governance around privileged identities
- unmanaged guest access
- unclear ownership of workload identities
- missing visibility on high-risk sign-in activity
- broad authentication method administration rights

## Reporting guidance

When reporting identity surface findings, focus on:

- blast radius
- visibility gaps
- governance weakness
- operational ownership
- whether the issue can be validated safely in production
