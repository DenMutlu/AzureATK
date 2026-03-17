# Native Microsoft Tooling

Native Microsoft tooling forms the backbone of most production-safe Azure and Entra ID audits.

These tools are generally the first choice because they are supported, familiar to customer teams, and well aligned with low-risk evidence collection.

## Core tools

### Microsoft Graph PowerShell

**Why use it**
- enumerate Entra objects
- review users, groups, apps, and policies
- inspect permissions and identity relationships
- perform structured queries without relying on legacy modules

**Useful for**
- identity surface review
- app and workload permission review
- policy and configuration evidence collection
- selected validation workflows with test identities

**Strengths**
- broad Entra and M365 coverage
- scriptable
- repeatable
- well suited for evidence gathering

**Limits**
- permission scope matters
- output can be noisy without structure
- not every task is equally easy through the module

### Az PowerShell

**Why use it**
- review Azure resource plane access
- inspect subscriptions, resource groups, and RBAC
- map resource exposure and role assignments

**Useful for**
- privileged access review
- workload identity blast-radius review
- Azure resource evidence collection
- safe validation of what an identity can see in scope

**Strengths**
- native Azure administration tooling
- strong fit for RBAC and resource-level review
- scriptable and repeatable

**Limits**
- resource plane focus, not full identity picture
- output can be broad and require cleanup

### Entra Portal

**Why use it**
- fast visibility into identity configuration
- easy screenshots and evidence collection
- useful for policies, sign-in data, and governance review

**Useful for**
- Conditional Access review
- sign-in logs
- audit logs
- app configuration review
- PIM and role settings

**Strengths**
- visual
- easy to explain during workshops and presentations
- useful for stakeholder review

**Limits**
- manual and less repeatable than scripted methods
- portal navigation can vary over time

### Azure Portal

**Why use it**
- review resource configuration and Azure access patterns
- inspect RBAC and service configuration
- collect operational screenshots and evidence

**Useful for**
- resource reviews
- RBAC checks
- workload identity evidence
- Azure logging and activity review

**Strengths**
- intuitive for many customer teams
- useful for visual confirmation

**Limits**
- manual
- less scalable for repeated audits

### Microsoft Sentinel

**Why use it**
- validate whether relevant events are visible and actionable
- review detections, telemetry, and investigation readiness

**Useful for**
- logging and detection domain
- rule review
- hunt queries
- testing whether safe validation activity is visible

**Strengths**
- helps connect audit to blue team reality
- useful for showing gaps between logs and detections

**Limits**
- depends heavily on data quality and ingestion coverage
- noisy tenants may require careful scoping

## Supporting native capabilities

You may also rely on:

- Microsoft Secure Score
- Configuration Analyzer
- Defender configuration views
- sign-in and audit log exports
- portal screenshots for evidence collection

## Usage philosophy

Use native tooling first when possible.

The goal is not to avoid community tools. The goal is to establish a stable and production-safe baseline using tooling customer teams can understand and maintain.

## Practical notes

- start with read-oriented workflows
- avoid turning native tools into broad change tooling during an audit
- structure exports and screenshots so evidence stays useful
- prefer repeatable commands for recurring checks
