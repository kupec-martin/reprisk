# Main wrapper file
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Dynamic sidebar"),
  dashboardSidebar(sidebarMenuOutput("menu")),
  dashboardBody(uiOutput("mybody"))
)

server <- function(input, output) {
  logvar<-reactiveValues(logged=FALSE)
  
  observeEvent(input$login, {
    print("login button press")
    print(as.numeric(input$logout))
    logvar$logged <- TRUE
  })
  observeEvent(input$logout, {
    print("logout button press")
    print(as.numeric(input$logout))
    logvar$logged <- FALSE
  })
  observe({
    if(!logvar$logged) output$mybody <- renderUI({ box(actionButton(inputId="login", label="Login"), renderText(input$login )) })
    else output$mybody <- renderUI(box(renderText(a<-"Hello"),
                                        actionButton(inputId="logout", label="logout"), renderText(input$login )
                                       )
                                   )
  })
  
          
  output$menu <- renderMenu({
    sidebarMenu()
  })
}
#   
#   observe({
#     
#     if(logvar()){
#       output$menu <- renderMenu({
#         sidebarMenu(
#           menuItem("Menu item", icon = icon("calendar"), tabName = "1"),
#           menuItem("second item", icon = icon("user"), tabName = "2")
#         )
#       })
#       output$mybody <- renderUI(
#         tabItems(
#           tabItem(tabName = "1",
#                   box(
#                     "first Thing", actionButton(inputId = "but1",label = "1")
#                   )
#           ),
#           
#           tabItem(tabName = "2",
#                   "second", actionButton(inputId = "but2",label = "2")
#           )
#         ) 
#       )
#     }
#     else {
#       output$mybody <- renderUI({
#         box(actionButton(inputId="login", label="Login"))
#       })
#       
#       output$menu <- renderMenu({
#         sidebarMenu()
#       })
#     }
#     
#     
#   })
# }

shinyApp(ui = ui, server = server)

