# Audit Domain — Logging and Detection

Security validation is incomplete if you cannot see the activity you care about.

This domain focuses on whether key security-relevant actions are logged, searchable, and actionable for defenders.

## Objectives

- verify visibility into identity and control plane events
- review whether key audit and sign-in data is available
- assess whether detection coverage exists for important scenarios
- identify blind spots between actions, logs, and alerts
- improve confidence in investigation readiness

## In scope

This domain may include:

- Entra sign-in logs
- Entra audit logs
- PIM logs
- Azure activity logs
- resource-specific logs
- Microsoft Sentinel data collection and detections
- investigative workflows for identity-centric events

## Key review areas

### Log availability
Questions to consider:

- Are required logs enabled and retained?
- Are important data sources missing?
- Is access to logs available for the right teams?
- Are logs searchable and usable during an investigation?

### Identity-centric visibility
Questions to consider:

- Are sign-in events visible and attributable?
- Are authentication method changes visible?
- Are app and consent changes logged?
- Are privileged activations and role changes visible?

### Detection coverage
Questions to consider:

- Are there detections for the most important identity and control plane events?
- Are alerts meaningful or too noisy?
- Do existing rules reflect real tenant usage?
- Would defenders notice abnormal but valid use of expected features?

### Operational usefulness
Questions to consider:

- Can analysts investigate from available logs?
- Are entity relationships clear enough?
- Are timestamps, IPs, and identities usable?
- Are there gaps between what is logged and what is investigated?

### Validation of controls
Questions to consider:

- Can a safe action be observed end to end?
- Can a known event be correlated in Sentinel?
- Are there expected alerts that do not fire?
- Does telemetry reflect production reality?

## Validation types commonly used

- log validation
- configuration review
- evidence collection
- safe simulation of low-risk events
- manual review of detection logic and workflow

## Useful evidence

Examples of evidence for this domain:

- screenshots or exports of relevant logs
- sign-in event examples
- audit log examples
- Sentinel rule references
- notes on missing telemetry
- investigation workflow observations

## Common findings themes

Examples:

- missing or weak log coverage
- important events visible but not monitored
- poor correlation between identity and resource activity
- high noise reducing analyst confidence
- detections not aligned with real tenant behavior
- unclear ownership of log quality and detection coverage

## Reporting guidance

When reporting logging and detection findings, focus on:

- visibility
- searchability
- detectability
- investigative usefulness
- operational next steps
