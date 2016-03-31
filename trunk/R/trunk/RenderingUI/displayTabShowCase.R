output$UiElementShowSingleCase <- renderUI(
  box(
    textInput(inputId = "caseId", label = "Case ID"),
    actionButton(inputId = "requestSingleCase", label = "Show me case!"),
    textOutput(outputId = "ShowCase"),
    width = 12
  )
)