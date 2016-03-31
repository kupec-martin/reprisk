#Rendering menu

displayMenu <- function(output){
  output$menu <- renderMenu({
    sidebarMenu(
      # sidebarSearchForm(textId = "searchText", buttonId = "searchButton", label = "Search cases..."),
      menuItem("User", tabName = "user", icon = icon("user")),
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"), selected = TRUE),
      menuItem("Display single case", tabName = "SingleCase", icon = icon("list-alt")),
      menuItem("Create new case", tabName = "newCase", icon = icon("exchange"))
    )
  })
}