# AzureATK

**AzureATK** is a production-safe Azure and Entra ID audit framework designed to help security teams review configurations, validate security assumptions, and assess real-world exposure without (i hope ;) ) breaking production.

Originally created to support live tenant audits, AzureATK combines methodology, tools, documentation, and reporting templates to make Azure security audits more structured, repeatable, and actionable.

## Why this project exists

Traditional security reviews often stop at configuration checks, while offensive testing is frequently limited to labs. In real environments, both approaches leave gaps.

AzureATK aims to bridge that gap by providing:

- a structured audit methodology
- production-safe validation steps
- practical tooling references
- reporting and evidence collection guidance
- a framework that can evolve with community contributions

This work is based on production audit experience and is intended to improve over time.

## Core principles

- **Production-safe first**: avoid destructive testing and uncontrolled validation in live environments.
- **Identity-driven focus**: prioritize Azure and Entra ID control plane exposure.
- **Methodology over tooling**: tools support the audit, but they are not the audit.
- **Repeatability matters**: the same approach should be reusable across tenants.
- **Evidence over assumptions**: findings should be backed by logs, configuration data, and documented review steps.
- **Community improvement**: this repository is a starting point, not a finished standard.

## My methodology in 5 phases

### 1. Start with the end in mind
Define the scope, expected outcomes, production constraints, and desired deliverables before touching any tooling.

### 2. Study
Research attack paths, defensive controls, Microsoft documentation, community tooling, and lessons from prior audits.

### 3. Explore
Test tools in a lab, understand required permissions, measure generated logs and noise, and identify what can be safely validated in production.

### 4. Build the framework
Turn research and field experience into a reusable audit structure with domains, validation types, evidence collection, and reporting logic.

### 5. Share findings
Document findings, procedures, templates, and lessons learned in a way that others can reuse and improve.

## Audit domains

AzureATK currently focuses on the following audit domains:

- Identity surface
- Privileged access
- App and workload permissions
- Cross-tenant trust
- Logging and detection readiness

## Tooling philosophy

AzureATK does not depend on a single tool. It combines native Microsoft capabilities and community tooling depending on the audit objective, available access, and production safety constraints.

Examples include:

### Native Microsoft tooling
- Microsoft Graph PowerShell
- Az PowerShell
- Entra Portal
- Azure Portal
- Microsoft Sentinel

### Community tooling
- PingCastle
- Monkey365
- ScubaGear
- ORCA
- AADInternals
- GraphSpy 

The goal is not to collect more output, but to support a structured audit methodology with useful evidence.

## Suggested repository structure

```text
AzureATK/
├── README.md
├── CONTRIBUTING.md
├── LICENSE
├── methodology/
├── audit-domains/
├── tools/
├── templates/
├── demos/
└── references/
```

## Who this is for

This repository is intended for:

- security consultants
- defenders and blue teams
- purple teams
- cloud security architects
- Microsoft security practitioners
- anyone building a structured Azure and Entra ID audit approach

## What this repository is not

AzureATK is **not**:

- a destructive red-team playbook
- a collection of unsafe production attack steps
- a guarantee of security coverage
- a replacement for authorization, change control, or stakeholder alignment

## Contribution

Contributions are more than welcome.

If you have:
- better tools
- safer validation steps
- improved methodology
- stronger templates
- corrections or clarifications

please open an issue or submit a pull request.

See [CONTRIBUTING.md](CONTRIBUTING.md) for contribution guidance.

## Disclaimer

Use only in environments where you have explicit authorization.

This project is intended to support **production-safe security validation**. Avoid destructive testing, uncontrolled phishing, broad privilege manipulation, or any action that may disrupt business operations without proper approval and scope.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE).
