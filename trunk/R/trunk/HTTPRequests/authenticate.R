# Authentication functionality - v0.1
authenticate <- function(aName, aPassword, aServer, aPort){
  
  # Building curl request body
  postData <- toJSON(list(name=aName,password=aPassword,dummy=TRUE))
  # print(postData)
  # Building authentication endpoint
  theHost <- paste(protocol,"://",aServer,":",aPort,sep="")
  authEndpoint <- paste(theHost,"/user/authenticate.json",sep="")
  
  # print(theHost)
  if( url.exists(theHost) ) {
    h <- basicTextGatherer()
    HTTPState <- curlPerform(
      url=authEndpoint, 
      httpheader="Content-Type: application/json;charset=UTF-8",
      postfields=postData[1],
      verbose=FALSE,
      writefunction = h$update)
    JSONResponse <- h$value()
    h$reset()
    response <- fromJSON(JSONResponse)
    # print(response)
  }
  if(exists("response") && response$success){
    return(response$token)    
  }else{
    return(NULL)
  }
}

# tok<-authenticate("root", "x", aServer, aPort)
# tok
