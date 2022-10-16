library(plotly)
library(gridlayout)
library(DT)
library(shiny)
library(ggplot2)
library(bslib)

# Chick weights investigated over three panels
ui <- navbarPage(
  title = "Forecast Ingresos",
  collapsible = FALSE,
  theme = bs_theme(bootswatch = "slate"),
  tabPanel(
    title = "Settings",
      div(
        class = "container",
        br(),
        h5("Datos Macro"),
        br(),
        DTOutput(outputId = "x1"),
        plotOutput(outputId ="plot1"),
        br(),
        actionButton(
          inputId = "myButton",
          label = "Actualizar"
        ),
        br()
      )
    )
  )


# Define server logic
server <- function(input, output) {
  
  x <-  iris
  x$Date <-  Sys.time() + seq_len(nrow(x))
  output$x1  <- renderDT(x, selection = 'none', editable = TRUE)
  
  proxy  <-  dataTableProxy('x1')
  
  observeEvent(input$x1_cell_edit, {
    info = input$x1_cell_edit
    str(info)
    i = info$row
    j = info$col
    v = info$value
    x[i, j] <<- DT::coerceValue(v, x[i, j])
    replaceData(proxy, x, resetPaging = FALSE)  # important
  })
  
  output$plot1 <- renderPlot({
    input$x1_cell_edit
    ggplot(x, aes(Sepal.Length,Sepal.Width)) +
      geom_line()
  })
  
}

shinyApp(ui, server)
