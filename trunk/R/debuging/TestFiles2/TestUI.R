# source("partsUI/displayTable.R")

ui <- fluidPage(
    actionButton(inputId = "requestTable", 
                 label = "Show me!"),
    tableOutput("showTable")
  # displayTable(output)
  # actionButton(inputId = "requestTable", label="Show me data!"),
#   h1("Helo user"),
#   # uiOutput("showTableStructure")
#   # box(
#     actionButton(inputId ="requestTable", label="Show me data!"),
#     tableOutput(outputId = "showTable")
  # )
)
