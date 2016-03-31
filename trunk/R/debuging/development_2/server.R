# Shiny server.R v02

# shinyServer( # change for app.r logic
server <- function(input, output, session) {
  
  
  # Importing login/logout functionality
  source("functions/login.R", local = TRUE)
  source("functions/logout.R", local = TRUE)
  
  # Importing data download function
  source("functions/import.R", local = TRUE)
  
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
      displayUserInfo(output)
      

      if(!is.null(input$logout)) {
        if (input$logout > 0) {
          loggingOut()
        }
      }
      else{print("button is null")}
      
    }
    else{
      # Displaying login functionality
      source("partsUI/displayLogin.R", local = TRUE)
      displayLogin(output)
    }
  })
} #)