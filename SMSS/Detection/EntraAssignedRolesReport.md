# Summary Rules - Entra Assigned Roles Report

## Sentinel
```KQL
IdentityInfo
| summarize arg_max(TimeGenerated, *) by AccountObjectId
| mv-expand AssignedRoles
| where isnotempty(AssignedRoles)
| summarize TotalRoles = dcount(tostring(AssignedRoles)), Roles = make_set(tostring(AssignedRoles), 100) by AccountObjectId, AccountDisplayName, AccountUPN
| extend ReportDate = now()
```
