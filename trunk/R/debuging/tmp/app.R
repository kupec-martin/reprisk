library(shiny)

runApp(list(
  
  ui = pageWithSidebar(
    
    headerPanel("'Reset inputs' button example"),
    
    sidebarPanel(
      numericInput("mynumber", "Enter a number", 20),
      textInput("mytext", "Enter a text", "test"),
      tags$hr(),
      actionButton("write", "Write it"),
      actionButton("reset_input", "Reset inputs")
    ),
    
    mainPanel(
      h4("Summary"),
      textOutput("summary")
    )
    
  ),
  
  server = function(input, output, session) {
    myo<-reactiveValues(A="")
    
    observeEvent(input$write, {
      output$summary <- renderText({
        # pom<-()
        myo$A<-myo$A,paste(isolate(input$mytext), isolate(input$mynumber))
        return(myo$A)
      })
    })
    
    observeEvent(input$reset_input,{
      updateNumericInput(session, "mynumber", value = 20)
      updateTextInput(session, "mytext", value = "test")
    })
  }
  
))