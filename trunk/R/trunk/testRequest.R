source("HTTPRequests/authenticate.R")
token<-authenticate("root", "x", aServer, aPort)
urlEndpoint <- "http://10.12.51.90:3000/reprisk_db_single_case/list.json"
requestJSON <- 
'
{
  "pageSize": 100,
  "attributes": [
      "id",
      "classification.policy_name",
      "entry_date"
    ],
    "filters": [
      {
        "is": {
          "case_code": "TST"
        }
      }
    ],
  "attributeNames": true
}
'


h <- basicTextGatherer()
HTTPState <- curlPerform(
  url=urlEndpoint, 
  httpheader=c(paste("x-authentication: ", token, sep=""), "Content-Type: application/json;charset=UTF-8"),
  postfields=requestJSON ,sep=""),
  verbose=TRUE ,
  writefunction = h$update)
JSONResponse <- h$value()
h$reset()