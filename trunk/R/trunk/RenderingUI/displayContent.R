
displayContent<- function(output){
  output$menu <- renderMenu({
    sidebarMenu(
      menuItem(text = "User", icon = icon("user"), tabName =  "user", selected = TRUE),
      menuItem(text = "Tool", icon = icon("cog") , tabName =  "tool"),
      menuItem(text = "Table", icon = icon("television") , tabName =  "table"),
      menuItem(text = "Single Case", icon = icon("folder-o") , tabName =  "singleCase")
    )
  })
  output$body <- renderUI({
    tabItems(
      tabItem(tabName = "user", uiOutput(outputId = "userPage")),
      tabItem(tabName = "tool", uiOutput(outputId = "UiElementInputCase")),
      tabItem(tabName = "table", uiOutput(outputId = "UiElementShowTable")),
      tabItem(tabName = "singleCase", uiOutput(outputId = "UiElementShowSingleCase"))
    )
  })
}