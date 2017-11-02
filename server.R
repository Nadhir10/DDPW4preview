## Server of digital data products W4 peer review

library(shiny)
library(datasets)
library(plotly)
data(trees)

shinyServer(function(input, output) {
  # provide your code
  model1<-reactive({
    x<-trees[, input$xaxis]
    y<-trees[, input$yaxis]
    lm(y ~ x)
  })
  
  output$plot1 <- renderPlotly({
    xname<-input$xaxis
    yname<-input$yaxis
    colname<-input$color
    x<-trees[, xname]
    y<-trees[, yname]
    color<-trees[, colname]
    plotname<-paste(yname," vs ", xname)
    
    if (input$showcolor)
    p<-plot_ly(x = ~x, y = ~y, color=color,type = "scatter", name=plotname)%>%
      layout(
        title = plotname,
        xaxis = list(title = xname),
        yaxis = list(title = yname))
    else
    p<-plot_ly(x = ~x, y = ~y, type = "scatter", name=plotname) %>%
      layout(
        title = plotname,
        xaxis = list(title = xname),
        yaxis = list(title = yname))
    
    if(input$showModel){
      p %>% add_lines( y = fitted(model1()), name ="Regression Model")
    }
    else p
    
  })
  output$print1<-renderPrint({
    print(model1()$coef)
  })
})
