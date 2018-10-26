#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# This apps use the 'Women' dataset in R

# Fluid Bootstrap layout
shinyUI(fluidPage(
  
  # page a title
  titlePanel("Predicting Women's Weight from Height"),
  
  # Sidebar layout
  sidebarLayout(
    sidebarPanel(
      
      hr(),
      helpText("This shiny app will predict the weight of woman corresponding to the given height. 
               The prection is based on the 'women' data set in R"),
      
      # Sidebar for height input and checkbox for selecting whether to show model ine or not
      sliderInput("Independent_Variable_Height", "Choose a height to see the predicted weight for women",50, 80, value = 65),
      checkboxInput("showModel1", "Draw AB Line to see the relationship between height and weight for women", value = TRUE)
    ),
    
    # Create a spot for the plot
    mainPanel(
      plotOutput("New_Plot"),
      h3("Predicted Weight from Specified Height"),
      textOutput("pred1")
    )
  )
))