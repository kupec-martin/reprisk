#Header line of the Dashboard
header <-  dashboardHeader(title = pageTitle)

#Sidebar 
sidebar <- dashboardSidebar(sidebarMenuOutput("menu"))


#Normal main body of the dashboard
body <-  dashboardBody(uiOutput("body"))

#Dashboard page overall
ui <- dashboardPage(
  skin = pageSkin,
  header,
  sidebar,
  body
)