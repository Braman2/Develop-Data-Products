shinyUI(pageWithSidebar (
	headerPanel("Resource"),
	sidebarPanel(
	  textInput("caption", "Data Header", "Loaded Data"),
	  numericInput("Margin","Margin %",35),
	  actionButton("goButton","Go!")
	),
	mainPanel(
	  
		p('Loaded Data'),
		tableOutput("view"),
    p('Output'),
    tableOutput("view1")
		)
))