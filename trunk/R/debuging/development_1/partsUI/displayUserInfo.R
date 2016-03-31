#User info displayed

displayUserInfo <- function(output){
  output$userInfo <- renderUI({
    fluidPage(
      box(
        title = paste(sep = "", "Hello ", userSession$name, "!"),
        height = "250px",
        p(paste(sep = "", "Your session started at: ", userSession$startTime, ".")),
        actionButton(inputId="logout", label="Logout")
      )
    )
    
  })
}