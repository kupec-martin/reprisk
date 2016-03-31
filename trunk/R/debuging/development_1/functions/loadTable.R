# Curl request for data table, display part in displaytable

source("functions/DataImport.R", local = TRUE)

#test setup
loadTable <- function(input, output) {
TableData <- eventReactive(input$requestTable, { (DataImport(userSession$key, aServer, aPort, "aService", input)) }) # DataImport.R function
output$ShowTable <- renderDataTable(TableData())
}  

