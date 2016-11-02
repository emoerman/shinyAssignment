library(shiny)

shinyUI(fluidPage(
        titlePanel("Calculate the interest on your savings account"),
        sidebarLayout(
                sidebarPanel(
                        h2("Your input"),
                        p("Enter the savings amount you start with"),
                        
                        numericInput(inputId = "amount",
                                     label = "Enter your amount (as an integer number)", 
                                     value = 1000,
                                     step = 1000),
                        
                        p("Enter the number of years you want to put that amount on the account or investment"),
                        numericInput(inputId = "years",
                                     label = "Enter the number of years (as an integer number)", 
                                     value = 5,
                                     step = 1),
                        
                        p("Drag the slider to set the expected return or interest"),
                        sliderInput(inputId = "interestRate",
                                    label = "Set the return rate (as a percentage)",
                                    value = 0.8,
                                    min = -2,
                                    max = 15, step=0.05)
                ),
                mainPanel(
                        h2("Result"),
                        p("Using an annuity calculation the final amount is calculated. From that the initial amount is subtracted to obtain the total interest you received."),
                        h3("Aggregated interest received"),
                        p(textOutput(outputId = "totalInterestReceived")),
                        h3("Final amount"),
                        p(textOutput(outputId = "finalAmount")),
                        h3("Evolution (interest) amount"),
                        p("This graph shows the amount saved from the start to the last year."),
                        p(plotOutput(outputId = "savingsPlot"))
                )
        )))