#Displaying table with data, curl request in another function loadtable

output$UiElementShowTable <- renderUI(
  box(
    actionButton(inputId = "requestTable", label = "Show me!"),
    dataTableOutput(outputId = "ShowTable"),
    width = 12
  )
)
