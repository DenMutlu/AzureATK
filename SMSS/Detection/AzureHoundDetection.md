# AzureHound Detection

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

