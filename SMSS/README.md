# Azure Attack Lab 🏗️

> **Purpose**  
> Hands-on lab for reproducing common Azure / Entra ID attack paths *and* testing your detections with Microsoft Defender XDR & Sentinel.  
> **Audience:** Red-, Blue-, and budding Purple-teamers.  
> **Status:** v1 – aligned with SMSS “Common Azure Attacks and Detection Strategies” talk (May/June 2025). KQL Detection & Defense strategies coming for August 2025

---

## 1  Why this repo exists
1. **Demystify modern Azure attacks** — show how attackers chain APIs, tokens and misconfiguration.  
2. **Provide reproducible tooling** — all scripts are public/open-source, pinned to known-good commits.  
3. **Bridge to detection** — The final foal is to every attack step is paired with at least one Sentinel / Defender XDR hint.

> ⚠️ **Lab-only**  
> Run everything inside an isolated tenant / subscription you are authorised to break.  
> The maintainers take no responsibility for misuse.

---

## 2  Lab design at a glance

| Component | Notes |
|-----------|-------|
| **Lab Tenant** | Fresh Azure AD (Entra ID) tenant on Pay-As-You-Go or MSDN credit or CDX tenant or MVP tenant if you have access. |
| **Subscriptions** | _prod-sub_ (target) and _tool-sub_ (attacker tooling). |
| **Identity tiers** | Global Admin, Help-Desk, Standard User, Guest. |
| **Data targets** | 1× Automation Account, 1× Key Vault, 2× VMs, 1× Storage Account. |
| **SIEM + XDR** | Microsoft Sentinel workspace + Defender for Cloud / XDR enabled if possible, more Defender tools more fun ;). |

![simplified lab diagram](Coming soon)

---

## 3  Tool stack (quick links)

| Kill-chain phase | Primary tools | Repo |
|------------------|--------------|------|
| Recon | **AADInternals**, O365creeper, MicroBurst | <https://github.com/Gerenios/AADInternals> |
| Initial Access | **MSOLSpray**, FireProx, Evilginx 2 | <https://github.com/dafthack/MSOLSpray> |
| Enumeration | **ROADrecon**, AzureHound, StormSpotter | <https://github.com/dirkjanm/ROADtools> |
| Priv-Esc | **AADInternals**, Cloud Katana playbooks | <https://github.com/Azure/Cloud-Katana> |
| Lateral Move | ROADtoken, Mimikatz (cloudap / PRT) | <https://github.com/gentilkiwi/mimikatz> |
| Persistence | AzADAppSecret, ConvertTo-AADIntBackdoor | see tools list |
| Data Mining | GraphRunner, AzCopy, MicroBurst | <https://github.com/dafthack/GraphRunner> |
| Detection test | **Cloud Katana**, Sentinel hunting queries | see `/detections` (_coming soon_) |

*See [`tools/README.md`](tools/README.md) for the full curated catalogue.*

---

## 4  Example of Lab walk-through

> *Estimated time: 60-90 min.*

| Step | Phase | What you’ll do | Slide ref. |
|------|-------|----------------|-----------|
| 0 | Prep | Deploy the template that spins up the lab resources & Sentinel workspace. | 70-75 |
| 1 | Recon | `Invoke-AADIntReconAsOutsider` to enumerate domains & Tenant ID. | 77 |
| 2 | Password Spray | `MSOLSpray -UserList users.txt -Password Winter2025!` via FireProx rotating IPs. | 78 |
| 3 | Consent Phish | Evilginx 2 config → capture OAuth code & exchange for **Access Token**. | 79 |
| 4 | Enumeration | `roadrecon` dump → import into Neo4j, visualise in BloodHound. | 80-81 |
| 5 | Priv-Esc | Abuse Automation Account Run-As to mint new Service Principal secret. | 82 |
| 6 | Key Vault loot | `az keyvault secret download` using stolen SP creds. | 82 |
| 7 | Persistence | `ConvertTo-AADIntBackdoor -AppId …` to add hidden credential. | 83 |
| 8 | Detection | Run Cloud Katana playbook **KV.SecretGet** and confirm Sentinel rule fires. | 86-89 |

---

## 5  Example of Detection quick-wins

1. **PrimaryRefreshToken usage outside Intune-managed device**  
   - Sentinel table: `SigninLogs` where `IncomingTokenType == "PrimaryRefreshToken"`.
2. **Runbook or Automation Account modifications**  
   - `AzureActivity` where `OperationNameValue == 'MICROSOFT.AUTOMATION/AUTOMATIONACCOUNTS/RUNBOOKS/WRITE'`.
3. **Service Principal credential added**  
   - `AuditLogs` where `OperationName == "Add service principal credential"`.

> Tip: copy-paste queries from the **Detections** folder once published.

---

## 6  Swiss Microsoft Security Summit Demos



---

## 7  Credits & inspiration

*Slides and process by **Deniz Mutlu** (Swiss Post Cybersecurity).*  
Big thanks to: Andy Robbins, Nikhil Mittal, Thomas Naunheim, Fabian Bader, community maintainers of every linked tool — and especially Deniz’ wife for her late-night patience.

---

## 8  License

This repository is released under the **MIT License**.  
_All external tools keep their original licenses — consult each project before use._
