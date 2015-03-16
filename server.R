library(shiny)
library(xtable)
dataset <- read.csv("resources.csv",header=T,sep=",")
dataset1 <- cbind(dataset, price=0)

shinyServer(function(input,output){

output$view <- renderTable({dataset
		  })

df <- reactive({
  df <-cbind(TotalCost=dataset1$TotalCost, 
            Totalprice=(dataset1$TotalCost / (1-(input$Margin/100))),
            Margin= ((dataset1$TotalCost / (1-(input$Margin/100))) - dataset1$TotalCost),
            MarginPerc = (dataset1$TotalCost / (1-(input$Margin/100)) - dataset1$TotalCost)/
              (dataset1$TotalCost / (1-(input$Margin/100)))
  )
})


output$view1 <- renderTable({

    input$goButton

    if (input$goButton == 0) {return()}        
    else{
      df()
        }
    })
})
