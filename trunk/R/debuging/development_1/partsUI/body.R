#Rendering the main body pages

displayBody<- function(output){
  
  #Creating main structure
  output$body <- renderUI({
    tabItems(
      
    #1st page - user Info & login/logout
      tabItem(tabName = "user", uiOutput("userPage")),
      
    #2nd page - dashboard
      tabItem(
        tabName="dashboard",  
        #uiOutput("dashboardPage"),
        paste("Hello ",userSession$name,", dashboard will be here soon!!!",sep=""),
        uiOutput(outputId = "UiElementShowTable")
      ),
    
    #3rd page - Single case display/search
      tabItem(
        tabName="SingleCase",
        uiOutput(outputId = "UiElementShowSingleCase")
      ),
        
    #4th page - reports
      tabItem(
        tabName="newCase", uiOutput("newCasePage"),
        uiOutput(outputId = "UiElementInputCase")
        )
    )
  })
  
  output$userPage <- renderUI({
    uiOutput("userInfo")
  })
  
}