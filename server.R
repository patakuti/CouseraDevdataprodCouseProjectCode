library(shiny)
data(mtcars)

shinyServer(
  function(input, output) {
    am <- mtcars$am
    am[am == 0] <- ":automatic"
    am[am == 1] <- ":manual"
    mtcars$am <- factor(am)

    output$predictors <- reactive({
      selectedVars <- input$selectedVars
      if (is.null(selectedVars)) {
        selectedVars <- ""
      }
      indexes <- c(9, as.numeric(unlist(strsplit(selectedVars, ","))))
      predictors <- paste(names(mtcars)[indexes], collapse=", ")
      mtcars2 <- mtcars[,c(indexes,1)]
      fit  <- lm(mpg ~ ., mtcars2)
      coef <- summary(fit)$coefficients
      coef <- cbind(names = rownames(coef), coef)
      #print(coef)
      output$coefTable <- renderDataTable(coef, options=list(paging=FALSE, searching=FALSE))
      predictors
    })
  }
)
