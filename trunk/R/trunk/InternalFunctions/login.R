###### Login functionality - v0.2

# Locally sourcing authentication functionality
source("HTTPRequests/authenticate.R", local = TRUE)

userSession <- reactiveValues(key = NULL)
userSession <- reactiveValues(startTime = NULL)
userSession <- reactiveValues(name = NULL)

observeEvent(input$login,{
  if (input$login >0) {
    Username <- isolate(input$user)
    Password <- isolate(input$pass)
    token <- authenticate(Username, Password, aServer, aPort)
    if (!is.null(token)) {
      userSession$key <- token
      userSession$startTime <- Sys.time()
      userSession$name <- Username
      print("Loged IN")
    } 
  }
})

output$feedback <- renderText({ "incorrect password feedback not working yet" })
