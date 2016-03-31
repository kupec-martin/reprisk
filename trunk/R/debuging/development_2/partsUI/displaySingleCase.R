# Display single case 
source("functions/SingleCaseExport.R", local = TRUE)


displayCase <- function(output) {
  output$UiElementShowSingleCase <- renderUI(
    box(
      numericInput(inputId = "CaseId",label = "Case ID", value = "", min = 1, step = 1),
      actionButton(inputId = "importCase", label = "Show me case!"),
      textOutput(outputId = "SingleCasePrint")
    )
  )
}

loadCase <- function(input, output) {
  CaseDataPrint <- eventReactive(input$importCase,input$CaseId)
  output$SingleCasePrint <- renderText(as.character(CaseDataPrint()))
  

}