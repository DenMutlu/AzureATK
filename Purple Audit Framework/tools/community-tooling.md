# Community Tooling

Community tools can extend visibility, accelerate review tasks, and help validate assumptions that would otherwise take longer to assess manually.

They should support the methodology, not replace it.

## Core community tools often used

### PingCastle
[Ping Castle](https://github.com/vletoux/pingcastle)
**Purpose**
- assess identity security posture in Active Directory and hybrid environments

**Useful for**
- hybrid identity context
- privilege and trust reviews
- fast posture overviews

**Strengths**
- mature and well known
- strong identity posture perspective
- useful for communicating risk themes quickly

**Limits**
- strongest in AD and hybrid contexts
- should be interpreted, not followed blindly

### Monkey365
[Monkey365](https://github.com/silverhack/monkey365)
**Purpose**
- collect and analyze security posture data across Microsoft 365 and Azure services

**Useful for**
- broad environment review
- evidence collection
- rapid audit support across multiple domains

**Strengths**
- wide coverage
- good for surfacing gaps quickly
- useful for structured review support

**Limits**
- output can be large and noisy
- requires disciplined filtering and interpretation

### ScubaGear
[ScubaGear](https://github.com/cisagov/ScubaGear) by CISA
**Purpose**
- assess Microsoft 365 configuration against security baselines

**Useful for**
- baseline and standards-oriented reviews
- control validation
- policy comparison

**Strengths**
- useful benchmark perspective
- helpful for structured baseline checks

**Limits**
- baseline alignment does not equal full risk understanding
- findings still need context

### ORCA
[ORCA](https://github.com/cammurray/orca) (Office 365 Recommended Configuration Analyzer)
**Purpose**
- review Exchange Online and Defender for Office 365 security configuration

**Useful for**
- mail security configuration
- phishing control review
- M365 security settings

**Strengths**
- focused and practical
- strong for messaging security reviews

**Limits**
- narrower scope than broader Azure and Entra audits

### AADInternals
[AADInternal](https://github.com/Gerenios/AADInternals)
**Purpose**
- advanced Entra and Azure AD research and testing support

**Useful for**
- specialized validation and research scenarios
- understanding identity exposure mechanics
- lab-oriented exploration that informs safe audit design

**Strengths**
- deep identity research utility
- valuable for understanding how certain paths work

**Limits**
- not a default production audit tool
- should be used carefully and selectively

### GraphSpy
[GRAPHSPY](https://github.com/RedByte1337/GraphSpy)
**Purpose**
- token-centric Microsoft 365 / Entra research and review

**Useful for**
- specialized identity exposure understanding
- controlled review with authorized test identities
- showing blast radius from Graph-access perspective

**Strengths**
- useful for visualizing access and token-related exposure
- strong specialized research value

**Limits**
- advanced tool
- not a baseline audit requirement
- use only with explicit authorization and careful scoping

## Usage philosophy

Community tools are most useful when they are:

- scoped
- understood
- interpreted carefully
- mapped to a real audit objective
- consistent with production-safe principles

Do not turn the audit into a tool dump.

## Recommended approach

For each community tool, document:

- why it is used
- what domain it supports
- what permissions it requires
- what output is valuable
- what output is noisy
- what production-safety considerations apply

## Practical notes

- test community tools in lab first
- understand what they collect before using them in production
- prefer narrow, explainable use over broad scans
- record limitations alongside findings
