
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

ui <- dashboardPage(
  dashboardHeader(title = pageTitle),
  dashboardSidebar(sidebarMenuOutput(outputId = "menu" )),
  dashboardBody(uiOutput(outputId = "body"))
)

shinyUI(ui)
