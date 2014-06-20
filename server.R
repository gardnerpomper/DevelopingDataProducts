library(shiny)
library(markdown)

shinyServer(
    function(input, output) {
        ##
        ## ----- load the description from the markdown file associated with the topic
        ##
        output$description <- renderUI(
            {
                fname <- input$topic
                if( file.exists(fname) )
                    text <- includeMarkdown(fname)
                else {
                    text <- paste0('## Topic not found\n','The application was unable to option the file *',
                                   input$topic, '*. You should check the *topics.csv* file on the server',
                                   ' to make sure the correct filename is listed for this topic')
                    writeLines(text,'error.md')
                    text <- includeMarkdown('error.md')
                }
                withMathJax(text)
            })
        ##
        ## ----- if a formula was entered, render it as an image
        ##
        ##output$latex <- renderUI({
        ##    input$showButton
        ##    withMathJax(paste0('$$',isolate(input$text1),'$$'))
        ##})
        ##
        ## ----- load the custom app controls for the topic (if any)
        ##
        output$app <- renderUI( {
            if (is.null(input$topic))
                return()
            ##
            ## ----- we have a "kmeans" app
            ##
            switch(input$topic,
                   "latex.md" = fluidRow(
                       column(3,
                              textInput(inputId="latex_formula",label="Formula (latex format)"),
                              actionButton("latex_go","Show!")),
                       column(6,withMathJax(),uiOutput('latex_render'))
                       ),
                   "kmeans.md" = fluidRow(
                       column(3,wellPanel(
                           selectInput('kmeans_xcol', 'X Variable', names(iris)),
                           selectInput('kmeans_ycol', 'Y Variable', names(iris),
                                       selected=names(iris)[[2]]),
                           numericInput('kmeans_clusters', 'Cluster count', 3,
                                        min = 1, max = 9)
                           )),
                       column(9,plotOutput('kmeans_plot'))
                       ),
                   "")
        })
        ##
        ## ======================================================================
        ## the blocks for each custom app follow
        ## NOTE the convention that the variable names match the app
        ## ======================================================================
        ##
        ## LATEX: (input$latex_formula, output$latex_render)
        ##
        output$latex_render <- renderUI({
            input$latex_go
            withMathJax(paste0('$$',isolate(input$latex_formula),'$$'))
        })
        ##
        ## KMEANS: (input$kmeans_xcol, kmeans_ycol, kmeans_clusters, output$kmeans_plot)
        ##
        selectedData <- reactive({iris[, c(input$kmeans_xcol, input$kmeans_ycol)]})
        clusters <- reactive({kmeans(selectedData(), input$kmeans_clusters)})
        output$kmeans_plot <- renderPlot({
            par(mar = c(5.1, 4.1, 0, 1))
            plot(selectedData(),
                 col = clusters()$cluster,
                 pch = 20, cex = 3)
            points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
        })

    })

