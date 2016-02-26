
# This is the server logic for a Shiny web application.
library(shiny)

# Code to Run at App Launch only
data(mtcars)

shinyServer(function(input, output) {
  
  # run this code on any change in input selection
  Fit <- reactive({
    # construct the list of regressors from checkbox selection
    regressors <- paste(input$checkboxes, collapse="+")
    
    # run the linear regression function
    with(mtcars, lm(formula(paste("mpg ~ ", regressors, sep=""))))
  })
  
  # output the regression formula
  output$RegressionFormula <- renderText({ 
    # construct the list of regressors from checkbox selection
    regressors <- paste(input$checkboxes, collapse="+")
    # return the formula in text
    return(paste("Regression Formula: mpg ~ ", regressors, sep=""))
  })
  
  # construct a table of regression results that includes R Squared and Sigma (Residual Standard Error)
  output$RSQ_Sigma_Table <- renderTable({ 
    fit <- Fit()
    sfit <- summary(fit)
    df = data.frame(R_Square=sfit$r.sq
                    ,Residual_StdError=sfit$sigma
                    ,row.names=NULL
                    )
    return(df)
  })
  
  # return the table that contains the coefficients
  output$Coeff_Table <- renderTable({ 
    fit <- Fit()
    return(summary(fit)$coeff)
  })
  
  # render the regression analysis plot
  output$LM_Plots <- renderPlot({
    fit <- Fit() 
    par(mfrow=c(2,2))
    plot(fit)
  })
  
  output$Documentation <- renderText({
    if (input$ToggleDoc %% 2 == 1) return("")
    if (input$ToggleDoc %% 2 == 0) return("Documentation:\n(toggle using Documentation Show/Hide button)\n- Goal: This App provides an interactive environment for doing regression analysis to find out which variables have an effect on MPG.\n- Data Set: mtcars data\n- Predictor: MPG is the predictor\n- Regressors: all the other variables in the mtcars dataset can be selected as a regressors.\n- User Interface: Select one of more regressors from teh Checkboxes. The regression formula is dynamically created and passed to the lm function.\n- Plots: I provided the standard plot to analyze regressions using the plot function.\n- Table: I provided the standard results provided by the lm function including the coefficient results, R-Squared, and Sigma.")
    
  })
  
})
