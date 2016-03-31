# Importing functionality

DataImport <- function(token, aServer, aPort, aService, input){
  
  # Service dependant URL and postData
#   if(aService==""){
#     serviceURL <- "/"
#     servicePostData <- paste("",
#                              sep="")
#   }
#   else if(aService==""){
#     serviceURL <- "/"
#     servicePostData <- paste("",
#                              sep="")
#   }
#   else if(aService==""){
#     serviceURL <- "/"
#     servicePostData <- paste("",
#                              sep="")
#   }
  
  #test 
  serviceURL <- "/inventory_currency/list.json"

  # Generating URL endpoint
  urlEndpoint <- paste("http://",aServer,":",aPort,serviceURL,sep="")
  
  h <- basicTextGatherer()
  HTTPState <- curlPerform(
    url=urlEndpoint, 
    httpheader=c(paste("x-authentication: ", token, sep=""), "Content-Type: application/json;charset=UTF-8"),
    postfields='{
        "pageSize": 0,
        "attributes": [
        "name",
        "isocode",
        "id"
        ],
        "export": true
    }',#servicePostData,
    #       "rowCount": false,
    #         "resultRowCount": false,
    #         "pageSize": 50,
    #         "offset": 100,
    verbose=TRUE,
    writefunction = h$update)
  JSONResponse <- h$value()
  h$reset()
  
  # Parsing JSON response and returning the items dataframe
  importedData <- fromJSON(JSONResponse)
  resultDataframe <- as.data.frame(importedData$items)
  return(resultDataframe)  
}


# 
# # Test load
# token<-authenticate("root", "x", aServer, aPort)
# testdata<-DataImport(token, aServer, aPort, "aService", "input")
# print(testdata)
