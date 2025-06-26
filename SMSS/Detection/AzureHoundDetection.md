# AzureHound Detection

The MSFT Defender XDR portal has just released a Threat Analytics Report on the AzureHound Framework. AzureHound, part of the BloodHoundAD project on GitHub, is the official tool for collecting Azure data for BloodHound and BloodHound Enterprise. This command-line tool, which can be built from source, is utilized for both offensive and defensive security testing. The report includes two advanced hunting queries focused on AzureHound cmdlets and reconnaissance activities using network logs. Additionally, I have contributed another KQL query to GitHub for detecting AzureHound usage, which is not included in the Threat Analytics Report.

## Sentinel
```KQL
let WhitelistedObjects = dynamic(["obj1", "obj2"]);
let UniqueRequestThreshold = 1000; // Depends on Entra ID tentant size. You can use the function 0.5 * TotalAzure Resources to get this number. KQL: arg("").Resources | count
let TotalResponseSizeTHreshold = 1000000; // Depends on Entra ID tentant size
let ResourceThreshold = 4;
let ReconResources = dynamic(["organization","groups","devices","applications","users","rolemanagement","serviceprincipals"]);
MicrosoftGraphActivityLogs
| where RequestMethod == "GET"
| where ResponseStatusCode == 200
| extend ParsedUri = tostring(parse_url(RequestUri).Path)
| extend GraphAPIPath = tolower(replace_string(ParsedUri, "//", "/"))
| extend GraphAPIResource = tostring(split(GraphAPIPath, "/")[2])
| where GraphAPIResource in (ReconResources)
| extend ObjectId = coalesce(UserId, ServicePrincipalId)
// Filter whitelist
| where not(ObjectId in (WhitelistedObjects))
| summarize TotalResponseSize = sum(ResponseSizeBytes), UniqueRequests = dcount(RequestId), Requests = make_set(RequestUri, 1000), Paths = make_set(GraphAPIPath), Resources = make_set(GraphAPIResource), UniqueResourceCount = dcount(GraphAPIResource) by UserId, bin(TimeGenerated, 1h), UserAgent, ObjectId
| where UniqueRequests >= UniqueRequestThreshold and TotalResponseSize >= TotalResponseSizeTHreshold and UniqueResourceCount >= ResourceThreshold
```

## Threat Hunting AzureHound Usage


Link: https://security.microsoft.com/threatanalytics3/ec964e9b-f365-4dc3-b5b4-44f1532198b5/

```KQL
MicrosoftGraphActivityLogs
| where TimeGenerated > ago(90d)
| where UserAgent has "azurehound"
| extend ObjectID = iff(isempty(UserId), ServicePrincipalId, UserId)
| join kind=leftouter IdentityInfo on $left.ObjectID == $right.AccountObjectId
| where isnotempty(AccountUPN)
| project-reorder TimeGenerated, AppId, IPAddress, AccountUPN, AccountCreationTime, AssignedRoles, ServicePrincipalId, RequestId, RequestMethod, ResponseStatusCode, RequestUri, ResponseSizeBytes, Roles
```



