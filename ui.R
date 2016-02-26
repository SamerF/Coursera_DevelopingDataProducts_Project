
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("mtcars Regression Analysis"),

  # Sidebar with a checkbox input: one checkbox per regressor in the mtcars dataset
  sidebarLayout(
    sidebarPanel(
    checkboxGroupInput("checkboxes", "Select one or more regressors:",
                       c("Cylinders" = "cyl", 
                         "Displacement(cu.in.)" = "disp",
                         "Gross Horsepower" = "hp",
                         "Rear Axle Ratio" = "drat",
                         "Weight" = "wt",
                         "0.25 mile time" = "qsec",
                         "V/S" = "vs",
                         "Transmission (0=auto, 1=manual)" = "am", 
                         "Gears" = "gear",
                         "Number of Carburators" = "carb"
                         ), selected="cyl"),
    actionButton("ToggleDoc", "Show/Hide Documentation")
    ),
    
    # Show a plot to show the result of regression analysis
    mainPanel(
      # header output
      h3("Exploring the relationship between the selected set of Regressors & Miles Per Gallon (MPG) as Predictor"),
      
      # Text output for Documentation
      verbatimTextOutput("Documentation"),
      
      # show the user the regression formula used for this analysis
      textOutput("RegressionFormula"),
      
      # plot the regression analysis plots
      plotOutput("LM_Plots"),
      
      # show the regressions analysis results in table format 
      tableOutput(("Coeff_Table")),
      tableOutput("RSQ_Sigma_Table")
      
    )
  )
))
