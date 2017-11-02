
## Ui of digital data products W4 peer review
library(shiny)
library(datasets)
library(plotly)

shinyUI(fluidPage(
  # page name
  titlePanel("W4preview"),
  # I choose to work with web page that has a side bar and a main panel (sidebar layout)
  # the side bar wil have the variables and the main bar will contain a plot
  sidebarLayout(
    # the sidebar will contain two lists of variables
    sidebarPanel(
      # don't forget "," if there is multiple commands, except for the last one
      selectInput("xaxis", "X axis", choices = names(trees), selected = names(trees)[1]),
      selectInput("yaxis", "Y axis", choices = names(trees), selected = names(trees)[2]),
      checkboxInput("showModel", "Show/Hide Model", value = FALSE),
      checkboxInput("showcolor", "Show third parameter as color", value = FALSE),
      selectInput("color", "color", choices = names(trees), selected = names(trees)[3])
    ),
    # then the main panel     
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Demo", br(), plotlyOutput("plot1"),h4("Model details"),verbatimTextOutput("print1")),
                  tabPanel("Documentation", br(), 
                           h2("How does it works"),
                           h5("This app uses 'trees' data form datasets R package and allows you 
                              to play and visualize the relation between the three parameters :"),
                           h5("- Girth: Tree diameter in inches"),
                           h5("- Height: Height in ft"),
                           h5("- Volume: Volume of timber in cubic ft"),
                           h4("How to use ?"),
                           h5("1- Choose in the first list the variable you want to use in th x-axis"),
                           h5("2- Choose in the second list the vaiable you want to plot"),
                           h5("3- The first checkbox helps you plot or hide the related regression model."),
                           h5("4- The second checkbox helps you to visualize a third variable using colors."),
                           h5("5- You can change the color variable using the last list."),
                           h6("Note 1: The figure changes instantly as you change the inputs."),
                           h6("Note 2: We used plotly package so you can manipulate the figure as you wish (zoom in, zoom out...)"))
                  
    )
  ))
))

