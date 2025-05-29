# Demo 01 — Reconnaissance of **mutlulabs**
## !! You need to adapt the credentials to your context !!

> **Goal:** Gather fast intel on the *mutlulabs* tenant (Or your lab tenant).  
> **Tools:** AADInternals · o365creeper · MicroBurst  
> **Runtime:** ~10 minutes  

---

## Task

* Verify the organisation is on **Entra ID**  
* Discover the **Tenant ID**  
* Validate a handful of **e‑mail addresses**  
* Identify which **Azure services** are in use  

---

## Walk‑through

### 1  Check Entra ID presence & tenant basics

```powershell
# PowerShell: start in the tooling folder
cd C:\AzAD\Tools\

# Import AADInternals
Import-Module .\AADInternals\AADInternals.psd1

# Probe the tenant (any username under the domain will do)
Get-AADIntLoginInformation -UserName admin@mutlulabs.onmicrosoft.com
```

Example (trimmed):

~~~
Account Type              : Managed        ← confirms cloud-managed Entra ID
Domain Name               : mutlulabs.onmicrosoft.com
Cloud Instance            : microsoftonline.com
Federation Brand Name     : Mutlu Labs
~~~

---

### 2  Grab the Tenant ID

```powershell
Get-AADIntTenantID -Domain mutlulabs.onmicrosoft.com
```

Output:

~~~
2d50as29-5r5b-48f4-5844-fe75a941adb6
~~~

---

### 3  Validate addresses with **o365creeper**

> In production you’d harvest addresses via OSINT or breach dumps.  
> For the lab we’ll use a short word‑list.

```powershell
# Check each address in emails.txt and log valids
C:\Python27\python.exe .\o365creeper\o365creeper.py `
    -f .\emails.txt `
    -o .\validemails.txt
```

Sample result:

~~~
admin@mutlulabs.onmicrosoft.com   - VALID
root@mutlulabs.onmicrosoft.com    - INVALID
user1@mutlulabs.onmicrosoft.com    - VALID
contact@mutlulabs.onmicrosoft.com - INVALID
~~~

---

### 4  Enumerate Azure sub‑services with **MicroBurst**

```powershell
# Import once per session
. .\MicroBurst\Misc\Invoke-EnumerateAzureSubDomains.ps1

# Brute‑force sub‑domains (few minutes)
Invoke-EnumerateAzureSubDomains -Base mutlulabs -Verbose
```

Typical findings:

| Sub‑domain                                   | Service                   |
|----------------------------------------------|---------------------------|
| mutlulabs.mail.protection.outlook.com        | Exchange Online (EOP)     |
| mutlulabs.onmicrosoft.com                    | Microsoft‑hosted domain   |
| mutlulabs-my.sharepoint.com                  | OneDrive / SharePoint     |
| mutlulabs.sharepoint.com                     | SharePoint Online         |

---

## ✔️ Outcome

* **mutlulabs** confirmed as an *Entra ID* tenant  
* Tenant ID: `2d50as29-5r5b-48f4-5844-fe75a941adb6`  
* Two valid user aliases (`admin`, `user1`) identified  
* Core cloud services spotted: Exchange Online + SharePoint / OneDrive  

> **Next:** weaponise the valid accounts (password spray or OAuth consent‑phish), then pivot to deeper graph enumeration (`ROADrecon`).
