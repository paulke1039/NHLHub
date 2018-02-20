#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("NHL Team Finder"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("division", "Division",
                         c("Atlantic" = "atlantic",
                           "Central" = "central",
                           "Metropolitan" = "metro",
                           "Pacific" = "pacific"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       tabsetPanel(type = "tabs",
                  tabPanel("NHL Teams", br(), DT::dataTableOutput("team_table")),
                  tabPanel("About", br(), htmlOutput("about_tab"))
       )
    )
  )
))
