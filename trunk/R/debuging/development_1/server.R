# Shiny server.R v20
# Original project server file

shinyServer( function(input, output, session) {
  
  
  # Importing login/logout functionality
  source("functions/login.R", local = TRUE)
  source("functions/logout.R", local = TRUE)
  
  # Importing data download functions
  source("functions/loadTable.R", local = TRUE)
  # source("functions/DataImport.R", local = TRUE)
  
  # Reactive environment checking for token
  observe({
    if(!is.null(userSession$key)){
      
      #Displaying dynamic menu
      source("partsUI/menu.R", local = TRUE)
      displayMenu(output)
      
      #Displaying dynamic body structure
      source("partsUI/body.R", local = TRUE)
      displayBody(output)
      
      #Displaying dynamic body structure
      source("partsUI/displayUserInfo.R", local = TRUE)
      #Displaying dynamic table view
      source("functions/loadTable.R", local = TRUE)
      source("partsUI/displayTable.R", local = TRUE)
      source("partsUI/displayInputCase.R", local = TRUE)
      source("partsUI/displaySingleCase.R", local = TRUE)
      
      displayUserInfo(output)
      loadTable(input,output)
      displayTable(output)
      displayInputCase(output)
      displayCase(output)
      
      if(!is.null(input$exportCase)) {
        if (input$exportCase > 0) {
          sendCase(input, output)
        }
      }
      
      if(!is.null(input$importCase)) {
        if (input$importCase > 0) {
          loadCase(input, output)
        }
      }
      
      if(!is.null(input$logout)) {
        if (input$logout > 0) {
          loggingOut()
        }
      }
      
    }
    else{
      # Displaying login functionality
      source("partsUI/displayLogin.R", local = TRUE)
      displayLogin(output)
    }
    
  })
} )