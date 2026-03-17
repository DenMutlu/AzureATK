# Audit Domain — Cross-Tenant Trust

Cross-tenant trust can create exposure that is poorly understood, especially when collaboration, guest access, synchronization, and trust inheritance are involved.

This domain focuses on the relationships between the tenant and external identities or other tenants.

## Objectives

- understand which external trust relationships exist
- review collaboration defaults and exceptions
- assess risk introduced by guest access and tenant trust
- validate whether trust assumptions are visible and governed
- reduce hidden exposure paths across tenant boundaries

## In scope

This domain may include:

- guest users
- B2B collaboration
- cross-tenant access settings
- external collaboration defaults
- trust of MFA or device claims
- cross-tenant synchronization
- external sharing assumptions tied to M365 workloads

## Key review areas

### Guest access and external collaboration
Questions to consider:

- Is guest access used intentionally?
- Are guest users reviewed and cleaned up?
- Are collaboration defaults too permissive?
- Are guest lifecycle and ownership clear?

### Cross-tenant access settings
Questions to consider:

- Which tenants are explicitly trusted?
- Are inbound and outbound settings understood?
- Are trust exceptions documented?
- Are defaults creating more exposure than intended?

### Trust of external claims
Questions to consider:

- Is external MFA trusted?
- Are device or compliance claims trusted from other tenants?
- Are these trust decisions justified and reviewed?
- Is the operational impact of that trust understood?

### Cross-tenant synchronization
Questions to consider:

- Is synchronization enabled?
- Which identities or groups are synchronized?
- Who owns the relationship?
- Does synchronization create privilege or visibility concerns?

### M365-linked exposure
Questions to consider:

- Does collaboration expand data exposure through Teams, SharePoint, or OneDrive?
- Are external sharing assumptions aligned with identity trust settings?
- Is blast radius across identity and data paths understood?

## Validation types commonly used

- configuration review
- manual review
- evidence collection
- safe validation using approved test guests where possible
- log validation for external access events

## Useful evidence

Examples of evidence for this domain:

- guest user inventories
- cross-tenant access screenshots and exports
- external collaboration settings
- trust configuration details
- external sign-in logs
- notes on business purpose and ownership

## Common findings themes

Examples:

- overly broad guest collaboration defaults
- stale guest population
- undocumented tenant trust relationships
- over-trust of external MFA or device claims
- poor ownership of cross-tenant sync
- weak visibility into external identity activity

## Reporting guidance

When reporting cross-tenant findings, focus on:

- hidden exposure paths
- ownership and governance
- trust assumptions
- visibility gaps
- blast radius across tenant boundaries
