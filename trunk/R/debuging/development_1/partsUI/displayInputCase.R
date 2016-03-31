#Displaying input fields for export from Shiny UI to the DB
source("functions/DataExport.R", local = TRUE)

displayInputCase <- function(output) {
  output$UiElementInputCase <- renderUI(
    box(
      textInput(inputId = "name",label = "Name of currency to create"),
      textInput(inputId = "isocode",label = "Isocode of currency"),
      actionButton(inputId = "exportCase", label = "Send it!"),
      textOutput(outputId = "myprint")
    )
  )
}

sendCase <- function(input, output) {
  CaseDataResponse <- eventReactive(input$exportCase, {DataExport(userSession$key, aServer, aPort, "aService", input)})
  CaseDataInput <- eventReactive(input$exportCase,paste(input$name,input$isocode))
  if(!is.null(CaseDataResponse()$Status)) {
    if (CaseDataResponse()$Status ) {
      output$myprint <- renderText(paste(CaseDataInput(),"WAS written.", CaseDataResponse()$Message))
    }
    else{
      output$myprint <- renderText(paste("There was a problem.", CaseDataResponse()$Message))
    }
  } 
  
  print(CaseDataResponse()$Message)
  print(CaseDataResponse()$Status)
  print(CaseDataInput())
}