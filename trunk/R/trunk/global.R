#Importing all libraries
library(shiny)
library(shinydashboard)
library(RCurl)
library(jsonlite)
library(ggplot2)

#Global parameters
pageTitle <- "Reputational Risk"
pageSkin <- "green"
protocol <- "http"
aServer <- "10.12.51.94"  # localhost "127.0.0.1" , bank ip "10.12.51.85" , docker container ip "172.17.0.36"
aPort <- "3000"
today <- as.character(Sys.Date())
systemBirth <- "2015-06-01"
