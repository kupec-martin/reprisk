
displayBody<- function(output){
output$body <- renderUI({
  tabItems(
    tabItem(tabName = "user", uiOutput(outputId = "userPage")),
    tabItem(tabName = "tool", "This is tool")
  )
})
output$menu <- renderMenu({
  sidebarMenu(
    menuItem(text = "User", icon = icon("user"), tabName =  "user"),
    menuItem(text = "Tool", icon = icon("cog") , tabName =  "tool")
  )
})
}