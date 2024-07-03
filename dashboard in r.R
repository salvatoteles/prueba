##ui.R ##

library(shinydashboard)
library(shiny)


dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody()
)

#app. R ##

library(shinydashboard)

#creamos la interfaz de usuario (como lo verá)
ui <- dashboardPage(
  dashboardHeader(title="Basic dashboard"),
  dashboardSidebar(),
  dashboardBody(
    #Boxes need to be plot in a row (or column)
    fluidRow(
      box(plotOutput("plot1", height = 250)),
      
      box(
        title="Controls",
        sliderInput("slider", "Number of observations:", 1,100,50)
      )
    )
  )
)

#creamos el servidor. Toma las entradas de la UI, las procesa y produce salidas
server <- function(input, output){
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({   #render plot es una salida para crear el gráfico
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
  
}

shinyApp(ui, server)
