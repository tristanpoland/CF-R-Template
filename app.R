# app.R - Main Shiny application file

# Install required packages if not already installed
if (!require("shiny")) install.packages("shiny")
if (!require("ggplot2")) install.packages("ggplot2")

library(shiny)
library(ggplot2)

# Define UI
ui <- fluidPage(
  titlePanel("R Test App for Cloud Foundry"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30),
      textInput("appname", "Application Name:", "R Test App"),
      textOutput("cfInfo")
    ),
    
    mainPanel(
      plotOutput("distPlot"),
      verbatimTextOutput("systemInfo")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    # Generate random data
    x <- rnorm(500)
    
    # Draw the histogram with the specified number of bins
    ggplot(data.frame(x), aes(x)) +
      geom_histogram(bins = input$bins, fill = "steelblue", color = "white") +
      labs(title = paste("Histogram with", input$bins, "bins"),
           x = "Value", y = "Count") +
      theme_minimal()
  })
  
  output$systemInfo <- renderPrint({
    # Get system information
    info <- list(
      "R Version" = R.version.string,
      "Operating System" = Sys.info()["sysname"],
      "Host Name" = Sys.info()["nodename"],
      "Current Time" = Sys.time()
    )
    info
  })
  
  output$cfInfo <- renderText({
    paste("Running", input$appname, "on Cloud Foundry")
  })
}

# Run the application
shinyApp(ui = ui, server = server)