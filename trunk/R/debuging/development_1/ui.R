# Original project UI

#Header line of the Dashboard
header <-  dashboardHeader(title = pageTitle)

#Sidebar 
sidebar <- dashboardSidebar(sidebarMenuOutput("menu"))


#Normal main body of the dashboard
# body <-  dashboardBody(uiOutput("body"))

body <-  dashboardBody(tags$head(tags$link(rel = "stylesheet",
                                           type = "text/css",
                                           href = "custom.css")),
                       uiOutput("body"))

#

#Dashboard page overall
dashboardPage(
  skin = pageSkin,
  header,
  sidebar,
  body
)