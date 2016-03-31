###### Login functionality - v0.2

# Locally sourcing authentication functionality
source("functions/authenticate.R", local = TRUE)

userSession <- reactiveValues(key = NULL)
userSession <- reactiveValues(startTime = NULL)
userSession <- reactiveValues(name = NULL)
# userSession <- reactiveValues(notisData = data.frame(text = "Welcome!",
#                                                       status = "success"))

output$feedback <- renderText({  
  if (is.null(userSession$key)) {
    if (!is.null(input$login)) {
      if (input$login > 0) {
        Username <- isolate(input$user)
        Password <- isolate(input$pass)
        token <- authenticate(Username, Password, aServer, aPort)
        if (!is.null(token)) {
          userSession$key <- token
          userSession$startTime <- Sys.time()
          userSession$name <- Username
        } 
        else {
          "Please enter correct credentials! User name or password was not correct."
        }
      } 
    }
  }
})
