library(shiny)
library(tidyquant)
library(tidyverse)
library(ggthemes)

shinyServer(
  
  function(input,output) {
    
    output$stockchart <- renderPlot({
      
      ticker <- c(input$ticker1,
                  input$ticker2,
                  input$ticker3,
                  input$ticker4,
                  input$ticker5)
      
      x <- tq_get(ticker,
                  from = input$dates[1],
                  to = input$dates[2])
      
      x %>%
        group_by(symbol) %>%
        tq_mutate(select = adjusted,
                  mutate_fun = periodReturn,
                  period = 'daily',
                  col_rename = 'ret') %>%
        mutate(cr = cumprod(1 + ret)) %>%
        ggplot(aes(x = date, y = cr, color = symbol)) +
        geom_line() +
        theme_bw() +
        labs(x = 'Date',
             y = "Cumulative Returns",
             title = paste("Stock chart for", input$ticker))
      
      
    })
    
  }
  
)
