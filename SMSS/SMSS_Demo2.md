# Demo 02 — Authenticated Enumeration with **ROADTools**

# !! You need to adapt the credentials to your context !!

> **Goal:** Use a low‑privilege account to enumerate key objects inside the *mutlulabs* tenant or your lab tenant.  
> **Tools:** ROADTools (roadrecon) · internal AAD Graph 1.61 API  
> **Runtime:** 15‑20 minutes  

---

## Task

* As **test@mutlulabs.onmicrosoft.com**:  
  * Enumerate **application‑role assignments** for the **Operations** group on the **Finance Management System** app  
  * Determine which **OAuth2 permissions** the **AdminAppSimulation** application has on user **John Doe**  

* Bonus: dump **Conditional Access Policies** accessible with normal user rights.  

---

## 🛠Walk‑through

### 0  Prep — activate the Python virtual environment

```powershell
# From the tools folder
cd C:\AzAD\Tools\ROADTools

# Activate the venv (created during tool install)
.\venv\Scripts\activate
```

Prompt changes to:

~~~
(venv) PS C:\AzAD\Tools\ROADTools>
~~~

---

### 1  Authenticate with the test user

```powershell
(venv) PS C:\AzAD\Tools\ROADTools> roadrecon auth `
    -u test@mutlulabs.onmicrosoft.com `
    -p V3ryH4rdt0C32554ef4Gu355Fer543Us3r
```

Output:

~~~
Tokens were written to .roadtools_auth
~~~

---

### 2  Gather everything the account can read

```powershell
(venv) PS C:\AzAD\Tools\ROADTools> roadrecon gather
```

Sample log tail:

~~~
Starting data gathering phase 1 of 2 (objects)
Starting data gathering phase 2 of 2 (properties & relationships)
ROADrecon gather executed in 31.35 seconds and issued 2037 HTTP requests.
~~~

---

### 3  Launch the local GUI

```powershell
(venv) PS C:\AzAD\Tools\ROADTools> roadrecon gui
```

Server banner:

~~~
* Running on http://127.0.0.1:5000
Press CTRL+C to quit
~~~

Open <http://127.0.0.1:5000> in the VM’s browser.

---

### 4  Answer the **lab questions**

| Question | Where to look in GUI | How‑to |
|----------|---------------------|--------|
| App roles assigned to **Operations** group on **Finance Management System** | **Application Roles** tab | Search “Operations”; check **Description** column for role names |
| OAuth2 permissions that **AdminAppSimulation** has on **John Doe** | **OAuth2 Permissions** tab | Filter **Resource/App** to *AdminAppSimulation*; Scope column lists permissions |

---

### 5  (Extra) Enumerate Conditional Access Policies

The legacy internal Graph endpoint `internal-1.61` lets any user read policy definitions:

```powershell
(venv) PS C:\AzAD\Tools\ROADTools> roadrecon plugin policies
```

Output:

~~~
Results written to caps.html
~~~

Open **caps.html** (same folder) to review policy JSON in a formatted table.

---

## ✔️ Outcome

* Extracted **role assignments**: confirmed what the *Operations* group can do inside *Finance Management System*.  
* Identified **OAuth2 scopes** granted to *AdminAppSimulation* for user *John Doe*.  
* Exported **Conditional Access Policies** using ROADTools’ *policies* plugin — useful for attack‑path mapping and detection tuning.  

> **Next:** Visualise relationships in BloodHound or ROADTools graph view, then plan privilege‑escalation paths based on app‑role chains and CA policy gaps.
