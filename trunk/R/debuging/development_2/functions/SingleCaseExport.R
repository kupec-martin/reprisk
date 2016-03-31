# test setup

SingleCaseExport <- function(token, aServer, aPort, aService, input) {
  v1 <- 1:3
  v2 <- c("TST CASE 1","test case 2","test case 3")
  df1<-data.frame(v1,v2)
  v3 <- c(1,1:3)
  v4 <- c("dec 1","dec 1.2","dec 2","dec 3")
  df2<-data.frame(v3,v4)
  v5<-c(1,1,2,3)
  v6<-c(20,15,6,24)
  df3<-data.frame(v5,v6)
  
  #Creating list for response, all 3 tables included
  res<-list()
  res$SingleCase  <- df1[df1[,1]==input$caseId,]
  res$Decision    <- df2[df1[,1]==input$caseId,]
  res$Exposure    <- df3[df1[,1]==input$caseId,]
  return(res)
}