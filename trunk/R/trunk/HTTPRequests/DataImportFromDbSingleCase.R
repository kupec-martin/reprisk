CaseImport <- function(token, aServer, aPort, input){
  # print("data import curl function run")
  #test 
  serviceURL <- "/reprisk_db_single_case/list.json"
  
  # Generating URL endpoint
  urlEndpoint <- paste("http://",aServer,":",aPort,serviceURL,sep="")
  
  h <- basicTextGatherer()
  HTTPState <- curlPerform(
    url=urlEndpoint, 
    httpheader=c(paste("x-authentication: ", token, sep=""), "Content-Type: application/json;charset=UTF-8"),
    postfields=paste('{
        "pageSize": 100,
        "attributes": [
            "id",
            "classification.policy_name",
            "entry_date"
          ],
          "filters": [
            {
              "is": {
                "case_code": "',input,'"
              }
            }
          ],
        "attributeNames": true
      }',sep=""),
    verbose=TRUE,
    writefunction = h$update)
  JSONResponse <- h$value()
  h$reset()
  
  # Parsing JSON response and returning the items dataframe
  importedData <- fromJSON(JSONResponse)
  resultDataframe <- as.data.frame(importedData$items)
  return(resultDataframe)  
}

# Test load
token<-authenticate("root", "x", aServer, aPort)
myinput<- "TST"
CaseData<-CaseImport(token, aServer, aPort,myinput)
str(CaseData)
# names(CaseData)
# caseNames<-names(CaseData)
# 
# 
# writeItDown<-function(names, data){
#   
# }
# for(i in 1:length(CaseData)) {
#   cat(caseNames[i],": ",eval(parse(text=paste("CaseData$",caseNames[i],sep = ""))),"\n");
# }
# eval(parse(text = paste("1 +","1",sep = "")))
# i<-4
# CaseData$id
# # parse(text = 
# eval(paste("CaseData$","caseNames[i]",sep = ""))
# eval(parse(paste("CaseData$",caseNames[i],sep = "")))
