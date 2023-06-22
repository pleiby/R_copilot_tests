# see [GitHub Copilot for R - First impressions]https://www.youtube.com/watch?v=NGM7Z1Dd9fE&t=460s

# define a simple shiny app that displays a histogram of the iris data set
# and allows the user to select the number of bins

# load the shiny package
library(shiny)

# load the ggplot2 package
library(ggplot2)

# define the ui portion of the app
# this is the user interface that the user will see
# the ui portion is defined using the fluidPage function
# the fluidPage function takes a title and a sidebarLayout

ui <-  fluidPage(
  titlePanel("Iris Data Set"),
  sidebarLayout(
    sidebarPanel(
      selectInput("x", "x-axis", names(iris)),
      selectInput("y", "y-axis", names(iris)),
      sliderInput("bins", "Number of bins:", min = 1, max = 50, value = 30)
    ),
    mainPanel(
      plotOutput("histogram")
    )
  )
)

# define the server portion of the app
# this is the code that will generate the histogram
# the server portion is defined using the function server
# the server function takes a function with three arguments
# input, output, and session

server <- function(input, output, session) {
  output$histogram <- renderPlot({
    ggplot(iris, aes_string(x = input$x, y = input$y)) +
      geom_point() +
      geom_smooth(method = "lm") +
      labs(x = input$x, y = input$y)
  })
}

# run the app
shinyApp(ui = ui, server = server)













