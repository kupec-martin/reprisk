displayTabUser<- function(output){
  output$userPage<-renderUI({
    box("Hello user", actionButton(inputId="logout", label="Logout"))
  })
}
