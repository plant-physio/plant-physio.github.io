#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
#install.packages("shiny")
library(shiny)
library(cowplot)
library(reshape2)

#server.R
library(shiny)

shinyServer(function(input,output){
  
  
  output$plot1 <- renderPlot({
    
    #carbon_dioxide = (carbon_dioxide*input$pressure)/1000
    leakiness = input$leakiness
    a = input$a
    Ci = input$Ci
    Ca = input$Ca
    b3 = input$b3
    ai = input$ai
    b4 = input$b4
    carbon_dioxide = seq(0,1,0.1)

    ci_ca = input$Ci/input$Ca
    D13C = a + (b4+ leakiness*(b3-ai)-a)*(ci_ca)
    D13C_line = a + (b4+ leakiness*(b3-ai)-a)*(carbon_dioxide)
    plot_data = data.frame(D13C,ci_ca)
    plot_data2 = data.frame(D13C_line)
    #vc_fxn = function(x) (vcmax_val*x)/(x+Kc*(1+(o/Ko)))
    #vc = vc_fxn(carbon_dioxide)

    my_font_size = 20
    #my_font = "Helvetica-Narrow"
    line_size = 1.5
    #######
    #plot(carbon_dioxide, RUBP_sat_rate,col="red",pch=20, cex=1.5,ylim=c(-100,100))
    #points(carbon_dioxide,RUBP_lim,col = "green",
    #       pch = 20, cex = 1.5, ylab = "Photosynthesis")
    #points(carbon_dioxide, RUBP_lim_AOX, col = "black", pch = 20, cex = 1.5)
    
    ggplot(plot_data, aes(x = ci_ca, y = D13C))+
      geom_point(size = 3)+
      ylab(expression(atop(paste("Discrimination"))))+
      xlab(expression("Ci / Ca"))+
      ylim(c(0,10))+
      xlim(c(0,1))+
      geom_line(data = plot_data2, aes(x=carbon_dioxide, y = D13C_line))+
      theme(axis.text = element_text( size =my_font_size),
            axis.title = element_text( size =my_font_size))
  })
  output$text1 <- renderText({
    #  paste("OMG you're modeling", input$vcmax_val)
  })
  output$text2<- renderText({
    #  paste("You have chosen a range that goes from", input$range[1],"to", input$range[2])
  })
  
  output$text3<- renderText({
    #  paste("NADPH requirement with whole chain",input$var)
  })
  
}
)

