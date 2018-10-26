#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Fitting model
  model1 <- lm(weight ~ height, data = women)
  
  # Predicting weight corresponding to the given height
  model1pred <- reactive({
    heightinput <- input$Independent_Variable_Height
    predict(model1, newdata = data.frame(height = heightinput))
  })
  
  output$New_Plot <- renderPlot({
    heightinput <- input$Independent_Variable_Height
    
    # Rendering plot
    plot(women$height, women$weight, xlab= "Height in Inches", ylab = "Weight in lbs", xlim = c(50,80), ylim = c(90,200), bty = "n", pch = 16)
    if(input$showModel1){abline(model1,col="blue", lwd = 2)}
    
    points(heightinput, model1pred(), col = "blue", pch= 16, cex = 2)
    
  })
  
  output$pred1 <- renderText({
    model1pred()
  }) 
})