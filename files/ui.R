#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(reshape2)
# ui.R

shinyUI(fluidPage(
  titlePanel("C4 Isotope Modeling"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create plots of C4 photosynthesis 
               and 13C isotopes"),
      
      
      sliderInput(inputId = "leakiness", 
                  label = "leakiness:",
                  min = 0, max = 1, value = 0.2),
      
      sliderInput(inputId = "a", 
                  label = "fractionation during diffusion of CO2 thru air",
                  min = 0, max = 6, value = 4.4,step = 0.1),
      
      sliderInput(inputId = "Ci", 
                  label = "intercellular CO2 (ppm):",
                  min = 0, max = 400, value = 300),
      
      sliderInput(inputId = "Ca", 
                  label = "atmospheric CO2 conc:",
                  min = 0, max = 400, value = 400),
      
      sliderInput(inputId = "b3", 
                  label = "b3: fract by rubisco",
                  min = 20, max = 40, value = 29),
      
      sliderInput(inputId = "ai", 
                  label = "ai: leakage fractionation",
                  min = 1, max = 2, value = 1.8),
      
      sliderInput(inputId = "b4", 
                  label = "overall fractionation by PEPC",
                  min = -7, max = -4, value = -5.7, round = F, step = 0.05),
      
      sliderInput(inputId = "gs_percent", 
                  label = "gs which controls ci/ca",
                  min = 0, max = 1, value =0.5)
      
    #  sliderInput(inputId = "curve_fact", 
     #             label = "Curvature Factor:",
      #            min = 0, max = 1, value = 0.7),
      
    #  sliderInput(inputId = "absorbance", 
     #             label = "Absorbance:",
      #            min = 0, max = 1, value = 0.85)
      
      #sliderInput(inputId = "pressure", 
      #           label = "Pressure:",
      #          min = 80, max = 150, value = 92.575)
      
      
      ),
    
    mainPanel(
      textOutput("text1"),
      textOutput("text2"),
      textOutput("text3"),
      plotOutput('plot1')
    )
  )
))
