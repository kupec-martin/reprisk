
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output, session){ 
  source("InternalFunctions/login.R", local = TRUE)
  source("InternalFunctions/logout.R", local = TRUE)
  observeEvent(input$logout,{ 
    logout() }) 
  
  observe({
    if(!is.null(userSession$key)){
      # MENU and BODY STRUCTURE LOGGED IN ### Load main file with basic structure of content
      source("RenderingUI/displayContent.R", local = TRUE)
      displayContent(output)
        # TAB USER ### Load first page with user information and logout
      source("RenderingUI/displayTabUser.R", local = TRUE)
      displayTabUser(output)
        # TAB INPUT CASE ### Load second page with input form 
      source("RenderingUI/displayTabInputCase.R", local = TRUE)
      displayInputCase(output)
          # INPUT CASE ### Reactive function for input case button click
      observeEvent(input$exportCase,{ sendCase(session, input, output) }) #
      
      # Rendering of different tabs and underlying functions
      source("RenderingUI/displayTabDataTable.R", local = TRUE)
      source("InternalFunctions/loadDataTable.R", local = TRUE)
      source("RenderingUI/displayTabShowCase.R", local = TRUE)
      source("InternalFunctions/loadSingleCase.R", local = TRUE)
      
    }else{
      # MENU and BODY STRUCTURE NOT LOGGED ### Load login page
      source("RenderingUI/displayLogin.R", local = TRUE)
      displayLogin(output)
    }
  })
   
})
