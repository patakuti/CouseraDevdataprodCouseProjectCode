library(shiny)
data(mtcars)

shinyUI(
  pageWithSidebar(
    headerPanel("Relationships of Transmission and MPG"),
  
    sidebarPanel(
      checkboxGroupInput("selectedVars", "Select Variables",
                         c("cyl"  = "2",
                           "disp" = "3",
                           "hp"   = "4",
                           "drat" = "5",
                           "wt"   = "6",
                           "qsec" = "7",
                           "vs"   = "8",
                           "gear" = "10",
                           "carb" = "11")),
      submitButton('Submit'),
      width = 3
    ),
    mainPanel(
        h3('Results of calculation'),
        h4('predictor variables'),
        verbatimTextOutput("predictors"),
        h4('Coefficients'),
        dataTableOutput("coefTable"),
        h4('Help'),
        p("Documentation:",a("Help File",href="HelpFile.html"))
    )
  )
)

