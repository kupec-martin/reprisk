
DataExport <- function(token, aServer, aPort, aService, input){
  
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
  serviceURL <- "/inventory_currency/action/create.json"
  entry<-NULL
  entry$name<-input$name
  entry$isocode<-input$isocode
  servicePostData<-toJSON(entry)
  
  # Generating URL endpoint
  urlEndpoint <- paste("http://",aServer,":",aPort,serviceURL,sep="")
  
  print(urlEndpoint)
  print(servicePostData)
  
  h <- basicTextGatherer()
  HTTPState <- curlPerform(
    url=urlEndpoint, 
    httpheader=c(paste("x-authentication: ", token, sep=""), "Content-Type: application/json;charset=UTF-8"),
    postfields=servicePostData,
    verbose=TRUE,
    writefunction = h$update)
  JSONResponse <- h$value()
  h$reset()
  
  # Parsing JSON response and returning status of export
  importedData <- fromJSON(JSONResponse)
  result <- NULL
  result$Status <- importedData$success
  result$Message <- importedData$message
  return(result)
}

# 
# # Test load
# source("functions/authenticate.R", local = TRUE)
# token<-authenticate("", "", aServer, aPort)
# testinput<-NULL
# testinput$name<-"testcurr"
# testinput$isocode<-"TCR"
# testdata<-DataExport(token, aServer, aPort, "aService", testinput)
# print(testdata)
