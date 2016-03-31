# Curl request for data table, display part in displaytable

source("HTTPRequests/DataImportFromDb.R", local = TRUE)

  # DataImportFromDb.R function
TableData <- eventReactive(input$requestTable, { DataImport(userSession$key, aServer, aPort, "aService", input) }) 

output$ShowTable <- renderDataTable(TableData())
