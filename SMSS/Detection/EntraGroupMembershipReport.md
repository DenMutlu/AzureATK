# Summary Rules - Entra Group Membership Report


## Sentinel
```KQL
IdentityInfo
| summarize arg_max(TimeGenerated, *) by AccountObjectId
| mv-expand GroupMembership
| summarize TotalMemberships = dcount(tostring(GroupMembership)), MemberOf = make_set(tostring(GroupMembership), 1000) by AccountObjectId, AccountDisplayName, AccountUPN
| extend ReportDate = now()
```
