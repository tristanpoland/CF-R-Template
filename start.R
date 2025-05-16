# start.R - Startup script for Cloud Foundry

# Install required packages
if (!require("shiny")) install.packages("shiny", repos="https://cran.rstudio.com/")
if (!require("ggplot2")) install.packages("ggplot2", repos="https://cran.rstudio.com/")

# Get port from Cloud Foundry environment
port <- as.numeric(Sys.getenv("PORT", "8080"))

# Start Shiny application
shiny::runApp(
  appDir = ".",
  host = "0.0.0.0",
  port = port
)