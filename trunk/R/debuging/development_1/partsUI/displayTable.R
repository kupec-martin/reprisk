#Displaying table with data, curl request in another function loadtable

displayTable <- function(output) {
  output$UiElementShowTable <- renderUI(
    box(
      actionButton(inputId = "requestTable", label = "Show me!"),
      dataTableOutput(outputId = "ShowTable"),
      width = 12
    )
  )
}