library(shiny)
##
## ----- load the topic list from a host-side CSV file
##
raw.topics <- read.csv("topics.csv",strip.white=TRUE)
topics <- raw.topics[order(raw.topics$Topic),]
topicChoices <- topics$prefix
names(topicChoices) <- topics$Topic
##
## ----- the page is roughly this format:
##
## |---------------------------------
## | title
## |--------------------------------------
## | topic selections
## |--------------------------------------
## | ----------------------------
## | |Description |  Sample App |
## | |-----------------------------------
## | |                                  |
## | |                                  |
## | |                                  |
## | |-----------------------------------
## |--------------------------------------
## 
## where the Sample App tab contains a custom UI for each topic (optional)
##
shinyUI(fluidPage(
    titlePanel("Study notebook"),
    fluidRow(selectInput("topic","Topic:",topicChoices)),
    fluidRow(
        withMathJax(),
        tabsetPanel(type="tabs",
                    tabPanel("Notes",uiOutput('description')),
                    tabPanel("Sample App", uiOutput('app'))
                    )
        )
    ))
