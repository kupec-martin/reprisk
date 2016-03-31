# Test setup UI

source("title.R")

myMenu <- dashboardSidebar(
  sidebarMenu(
    menuItem("User", tabName = "user", icon = icon("user")),
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Display single case", tabName = "SingleCase", icon = icon("list-alt"))
  )
)

# myMenu <-dashboardSidebar(
#   sidebarMenu(
#     menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
#     menuItem("Widgets", tabName = "widgets", icon = icon("th"))
#   )
# )

myBody <-  dashboardBody(
  tabItems(
    tabItem(tabName = "user", "user hello"),
    tabItem(tabName="dashboard","db hello",uiOutput(outputId = "UiElementShowSingleCase")),
    tabItem(tabName="SingleCase","sp hello")
  )
)
# myBody <- dashboardBody(
#   tabItems(
#     # First tab content
#     tabItem(tabName = "dashboard",
#             fluidRow(
#               box(plotOutput("plot1", height = 250)),
#               
#               box(
#                 title = "Controls",
#                 sliderInput("slider", "Number of observations:", 1, 100, 50)
#               )
#             )
#     ),
#     
#     # Second tab content
#     tabItem(tabName = "widgets",
#             h2("Widgets tab content")
#     )
#   )
# )

ui <- dashboardPage(
  dashboardHeader(title = mytitle),
  myMenu,
  myBody
)