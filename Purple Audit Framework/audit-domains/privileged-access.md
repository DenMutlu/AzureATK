# Audit Domain — Privileged Access

Privileged access is one of the highest-risk areas in Azure and Entra ID.

This domain focuses on how privileged roles are assigned, activated, governed, and monitored.

## Objectives

- identify privileged roles and who holds them
- distinguish permanent access from just-in-time access
- review governance and approval logic
- assess visibility into privileged actions
- reduce unnecessary blast radius

## In scope

This domain may include:

- Entra ID privileged roles
- Azure RBAC privileged roles
- PIM eligibility and activation
- break-glass accounts
- role assignment ownership
- temporary elevation models
- role-related logging and alerting

## Key review areas

### Permanent vs eligible access
Questions to consider:

- Which privileged roles are permanently assigned?
- Which roles are eligible through PIM?
- Are there roles that should be time-bound but are permanent?
- Are dormant privileged assignments still present?

### PIM configuration
Questions to consider:

- Is PIM enabled where expected?
- Is activation protected by MFA or authentication strength?
- Are approvals required for sensitive roles?
- Are justifications and ticket references used?
- Are role settings reviewed periodically?

### Break-glass and emergency access
Questions to consider:

- Are emergency accounts documented and protected?
- Is their use monitored?
- Are they excluded from too many controls without review?
- Are they tested safely and periodically?

### Role assignment governance
Questions to consider:

- Who can assign privileged roles?
- Is ownership clear?
- Are high-impact roles overly distributed?
- Are there shadow paths through groups or app permissions?

### Logging and detection
Questions to consider:

- Are privileged activations visible?
- Are assignment changes reviewed?
- Would the SOC notice abnormal PIM activity?
- Are high-risk role changes tied to detections or alerts?

## Validation types commonly used

- configuration review
- manual review
- evidence collection
- log validation
- safe simulation with a test role activation when approved

## Useful evidence

Examples of evidence for this domain:

- PIM role exports
- role assignment lists
- screenshots of activation settings
- audit logs for role assignment and activation
- sign-in and resource audit data
- notes on business ownership

## Common findings themes

Examples:

- excessive permanent privileged access
- weak PIM configuration
- unclear ownership of sensitive roles
- missing approval or justification requirements
- poor visibility on activation or assignment changes
- emergency access accounts with weak governance

## Reporting guidance

When reporting privileged access findings, focus on:

- blast radius
- duration of exposure
- governance quality
- detectability
- remediation priority
