# AzureATK
Azure Audit Toolkit is a process using Tools, process, docs to audit and review security configuration on Azure Tenant

**Commmit For the Swiss Microsoft Security Summit coming the 29.05.2025**

# Azure Security Configuration and Baseline Audit Methodology

This methodology outlines a three-step process to review and audit Azure Security configurations and baselines. The process includes preparation, utilizing specific tools, and presenting the results.

## Step 1: Preparation

### Creating the Audit Excel File

Begin by creating an Excel file to document the audit process. The file should contain the following columns:

- **ID**: A unique identifier for each control.
- **Name of the Control**: The name of the security control being audited.
- **Description**: A brief description of the control.
- **Result**: The result of the audit (e.g., compliant, non-compliant).
- **Findings**: Detailed findings from the audit.
- **Name of Audit**: The name or identifier of the audit.
- **Comment**: Additional comments or notes.


## Step 2: Tools Used

Utilize the following tools to conduct the audit:

### Microsoft 365 Secure Score
Integrated into the Microsoft portal, this tool provides a measurement of an organization's security posture and offers recommendations for improvement.

### Configuration Analyzer in Microsoft 365 Defender
A tool within Microsoft 365 Defender that analyzes security configurations and provides recommendations for improving security settings.

### [Ping Castle](https://github.com/vletoux/pingcastle)
An advanced Active Directory security assessment tool that evaluates the security posture of your Active Directory environment.

### [ScubaGear](https://github.com/cisagov/ScubaGear) by CISA
A tool provided by the Cybersecurity and Infrastructure Security Agency (CISA) for auditing security configurations.

### [ORCA](https://github.com/cammurray/orca) (Office 365 Recommended Configuration Analyzer)
A PowerShell module that analyzes Exchange Online Protection (EOP) rules, attachment and link management policies, and anti-phishing policies. It focuses on Microsoft Defender for Office 365.

### [Monkey365](https://github.com/silverhack/monkey365)
An open-source tool for auditing multiple services within the Microsoft 365 ecosystem, including OneDrive, Exchange Online, SharePoint, Teams, Security & Compliance, and Microsoft Entra ID.

## Step 3: Presentation of Results

Compile the findings into a PowerPoint presentation. Each slide should include:

- **ID**: The unique identifier for each control.
- **Findings**: A summary of the audit findings.
- **Outcome**: The outcome of the audit, highlighting areas of compliance and non-compliance.
