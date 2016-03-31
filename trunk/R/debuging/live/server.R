
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  source("InternalFunctions/login.R", local = TRUE)
  source("InternalFunctions/logout.R", local = TRUE)
  
  observe({
    if(!is.null(userSession$key)){
      source("RenderingUI/displayContent.R", local = TRUE)
      displayBody(output)
      output$userPage<-renderUI(
          box("Hello user", actionButton(inputId="logout", label="Logout"))
        )
      
      
      # if(!is.null(input$logout)) { observeEvent(input$logout,{ logout() }) }
      if(!is.null(input$logout)) {
        print(input$logout)
        
        if (input$logout > 0) {
          logout()
        }
      }
    }
    else{
      
      source("RenderingUI/displayLogin.R", local = TRUE)
      displayLogin(output)
    }
  })
  # print(input$logout)
})
