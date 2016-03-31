# displayTable <- function(input,output){
# #   actionButton(inputId = "requestTable", label="Show me data!")
# #   # tableOutput(outputId = );
# #   tableOutput("showTable")
#   output$showTableStructure <- renderUI({
#     box(
#       actionButton(inputId ="requestTable", label="Show me data!"),
#       tableOutput(outputId = "showTable")
#     )
#   })
# }


server <- function(input, output) {
    # displayTable(input, output)
    data <- eventReactive(input$requestTable, {
      as.data.frame(matrix(1:4,2,2)) 
    })
    output$ShowTable <- renderTable(data()) 
    
}