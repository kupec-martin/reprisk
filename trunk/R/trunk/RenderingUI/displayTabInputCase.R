#Displaying input fields for export from Shiny UI to the DB
source("HTTPRequests/DataExportToDb.R", local = TRUE)

displayInputCase <- function(output) {
  if(T){ # exists("input$exportCase")
    output$UiElementInputCase <- renderUI(
      box(
        textInput(inputId = "name",label = "Name of currency to create"),
        textInput(inputId = "isocode",label = "Isocode of currency"),
        actionButton(inputId = "exportCase", label = "Send it!"),
        textOutput(outputId = "myprint")#,
        # renderText(input$exportCase)
      )
    )
  }
  else{
    output$UiElementInputCase <- renderUI(
      box(
        actionButton(inputId = "exportCase", label = "Send it!"),
        textOutput(outputId = "myprint"),
        renderText(input$exportCase)
      )
    )
  }
  
}

sendCase <- function(session, input, output) {#
  CaseDataResponse <- eventReactive(input$exportCase, {DataExport(userSession$key, aServer, aPort, "aService", input)})
  CaseDataInput <- eventReactive(input$exportCase,paste(input$name,input$isocode))
  if(!is.null(CaseDataResponse()$Status)) {
    if (CaseDataResponse()$Status ) {
      output$myprint <- renderText(paste(CaseDataInput(),"WAS written.", CaseDataResponse()$Message))
      # updateTextInput(session, inputId = "name", value = "")
      # updateTextInput(session, inputId = "isocode", value = "")
    }
    else{
      output$myprint <- renderText(paste("There was a problem.", CaseDataResponse()$Message))
    }
  } 
  
  print(CaseDataResponse()$Message)
  print(CaseDataResponse()$Status)
  print(CaseDataInput())
}