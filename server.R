library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
        
        # Divide by 100 because it is given in %
        intrestRate <- reactive({input$interestRate / 100})
        amount <- reactive({input$amount})
        years <- reactive({input$years})
        
        # Interest build up in the given number of years
        finalAmount <- reactive({round(((1 + intrestRate()) ^ years()) * amount(), 2)})
        compoundedInterest <- reactive({round(finalAmount() - amount(), 2)})
        
        output$totalInterestReceived <- renderText(compoundedInterest())
        output$finalAmount <- renderText(finalAmount())
        
        output$savingsPlot <- renderPlot({
                
                time <- (1:years())
                savings <- round(((1 + intrestRate()) ^ time) * amount(), 2)
                interest <- round(savings - amount(), 2)
                
                colNr <- c("blue", "red")
                
                ggplot() +
                        geom_line(data=data.frame(x=time, y=savings, meaning=rep("Total amount", length(time))), aes(x=x, y=y, colour=meaning)) + 
                        geom_line(data=data.frame(x=time, y=interest, meaning=rep("Aggregated interest", length(time))), aes(x=x, y=y, colour=meaning)) +
                        labs(title="Return on savings/investment account",
                             x="Duration in years", y="Amount")
        })
}
)