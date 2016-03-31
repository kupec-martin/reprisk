source("HTTPRequests/DataImportFromDbSingleCase.R", local = TRUE)

# DataImportFromDb.R function
CaseData <- eventReactive(input$requestSingleCase, { CaseImport(userSession$key, aServer, aPort, input$caseId) }) 

output$ShowCase <- renderPrint({
  caseNames<-names(CaseData)
  for(i in 1:length(caseNames)) {
    
  }
  cat("Case Code: ",CaseData()$case_code,"\n");
  cat("Legal Entity: ",CaseData()$legal_entity$acronym,"\n");
})
