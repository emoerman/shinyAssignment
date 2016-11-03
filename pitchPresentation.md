The investment return (interest) App
========================================================
author: Etienne Moerman
date: 2016/11/03

The problem
========================================================

Sometimes you have some money and you want to decide what to do with it. You want to know what the end result will be. 

It is possible to ~~calculate this manually~~ or ~~look for the correct formulas in excel and setup the calculation~~ there.

The solution
========================================================

Use the investment return (interest) App and let it calculate the resulting amount and the aggregated interest amount.

<h3>Under the hood</h3>

What's the App calculating?
The App is using the compound interest calculation

$$
  \begin{aligned}
  finalAmount & = amount * (1 + r) ^ {year}
  \end{aligned}
$$

<small>r = the interest rate or investment return</small>.

$$
  \begin{aligned}
  compoundedInterest &= finalAmount - amount
  \end{aligned}
$$

The code
========================================================

The basic code for the calculation and plot.


```r
library(ggplot2)
intrestRate <- 8 / 100 # This is a 8% interest rate
amount <- 1000
years <- 5
# Interest build up in the given number of years
finalAmount <- round(((1 + intrestRate) ^ years) * amount, 2)
compoundedInterest <- round(finalAmount - amount, 2)
time <- (1:years)
savings <- round(((1 + intrestRate) ^ time) * amount, 2)
interest <- round(savings - amount, 2)
colNr <- c("blue", "red")
ggplot() +
        geom_line(
                data = data.frame(x = time, y = savings, meaning = rep("Total amount", length(time))), 
                aes(x = x, y = y, colour = meaning)
                ) + 
        geom_line(
                data=data.frame(x = time, y = interest, meaning = rep("Aggregated interest", length(time))), 
                aes(x = x, y = y, colour = meaning)
                ) +
        labs(title = "Return on savings/investment account", x = "Duration in years", y = "Amount")
```

The plot
========================================================

The plot shows the compounded interest and the amount achieved as a function of the number of years.

![plot of chunk unnamed-chunk-2](pitchPresentation-figure/unnamed-chunk-2-1.png)

