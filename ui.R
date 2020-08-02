library(shiny)

shinyUI(
  
  fluidPage(
    
    titlePanel("Stock Performance"),
    
    sidebarLayout(
      
      sidebarPanel(
        
        helpText("Enter upto 5 stock symbols"),
        textInput(inputId = "ticker1", label = "Symbol 1", 
                  value = "AAPL"),
        textInput(inputId = "ticker2", label = "Symbol 2", 
                  value = "FB"),
        textInput(inputId = "ticker3", label = "Symbol 3", 
                  value = "AMZN"),
        textInput(inputId = "ticker4", label = "Symbol 4", 
                  value = "MSFT"),
        textInput(inputId = "ticker5", label = "Symbol 5", 
                  value = "NFLX"),
        
        
        dateRangeInput(inputId = "dates",
                       label = "Enter date range",
                       start = "2010-1-1",
                       end = Sys.Date()),
        
      ),
      
      
      mainPanel(
        
        plotOutput(outputId = "stockchart")
        
      )
      
    )
  )
  
)
