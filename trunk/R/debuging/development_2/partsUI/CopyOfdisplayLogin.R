#Displaying login form, but nothing else

displayLogin <- function(output){
  output$body <- renderUI({
    box(
      textInput(inputId="user", label="Username:"),
      passwordInput(inputId="pass", label="Password:"),
      actionButton(inputId="login", label="Login"),
      textOutput(outputId="feedback")
    )
  })
  output$menu <- renderMenu({
    sidebarMenu()
  })
}