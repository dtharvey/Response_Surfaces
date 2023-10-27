# user interface for response surface optimization application
library(shiny)
library(shinythemes)

ui = navbarPage("AC 3.0: Optimizing a System's Response",
     theme = shinytheme("journal"),
     header = tags$head(
       tags$link(rel = "stylesheet",
                 type = "text/css",
                 href = "style.css") 
     ),
     
     tabPanel("Introduction",
      fluidRow(
        column(width = 6,
          wellPanel(
            includeHTML("text/introduction.html") 
      )),
        column(width = 6, 
          align = "center",
          br(),
          br(),
          img(src = "badlands.png", width = "100%")
          )
      )),
     
     tabPanel("Sequential Optimization",
              fluidRow(
                column(width = 6,
                       wellPanel(
                         includeHTML("text/activity1.html")
                       )),
                column(width = 6,
                       align = "center",
                       splitLayout(
                         selectInput("eqn1","example",
                                     choices = c("example 1","example 2",
                                                 "example 3","example 4"), 
                                     selected = "example 1",
                                     selectize = FALSE, width = "200px"),
                         sliderInput("a_initial1",
                                     "factor A: initial value", 
                                     min = 0, max = 10,
                                     step = 1, value = 0, round = TRUE, 
                                     width = "200px", ticks = FALSE),
                         sliderInput("b_initial1", 
                                     "Factor B: initial value",
                                     min = 0, max = 10, step = 1, 
                                     value = 0, round = TRUE, 
                                     width = "200px", ticks = FALSE)
                       ),
                       splitLayout(
                         radioButtons("display1", "display...", 
                                      choices = c("path only",
                                                  "path & surface"),
                                      selected = "path only", 
                                      inline = FALSE,
                                      width = "50px"),
                         radioButtons("dim1","... in",
                                      choices = c("2D", "3D"),
                                      selected = "2D", inline = FALSE, 
                                      width = "50px"),
                         sliderInput("act1_turn", "rotate the xy plane",
                                     min = -180, max = 180, step = 1, 
                                     value = 45, width = "150px", 
                                     ticks = FALSE),
                         sliderInput("act1_tilt", "tilt z axis",
                                     min = -180, max = 180, step = 1, 
                                     value = 35,
                                     width = "150px", ticks = FALSE),
                       ),
                       plotOutput("act1_plot", height = "500px")
                )
              )),
    
     
     tabPanel("Steepest Ascent",
      fluidRow(
        column(width = 6,
          wellPanel(
            includeHTML("text/activity2.html")
          )),
        column(width = 6,
          align = "center",
          splitLayout(
            selectInput("eqn2","example",
                        choices = c("example 1","example 2","example 3",
                                    "example 4"), selected = "example 1",
                        selectize = FALSE, width = "200px"),
            sliderInput("a_initial2","factor A: initial value", 
                        min = 0, max = 10,
                       step = 1, value = 0, 
                       round = TRUE, width = "200px", ticks = FALSE),
            sliderInput("b_initial2", "Factor B: initial value",
                        min = 0, max = 10, step = 1, value = 0,
                        round = TRUE, width = "200px", ticks = FALSE)
          ),
          splitLayout(
          radioButtons("display2", "display...", 
                       choices = c("path only","path & surface"),
                       selected = "path & surface", inline = FALSE,
                       width = "50px"),
          radioButtons("dim2","... in",
                       choices = c("2D", "3D"),
                       selected = "3D", inline = FALSE, 
                       width = "50px"),
          sliderInput("act2_turn", "rotate the xy plane",
                      min = -180, max = 180, step = 1, value = 45,
                      width = "150px", ticks = FALSE),
          sliderInput("act2_tilt", "tilt z axis",
                      min = -180, max = 180, step = 1, value = 35,
                      width = "150px", ticks = FALSE),
          ),
          plotOutput("act2_plot", height = "500px")
          )
        )),
     tabPanel("Simplex Optimization",
              fluidRow(
                column(width = 6,
                       wellPanel(
                         includeHTML("text/activity2.html")
                       )),
                column(width = 6,
                       align = "center",
                       
                       splitLayout(
                         radioButtons("act2_show", 
                                      "display response surface?",
                                      choices = c("no","yes"), 
                                      selected = "no"),
                         sliderInput("act2_turn", "rotate the xy plane",
                                     min = -180, max = 180, step = 1, 
                                     value = 45,
                                     width = "200px", ticks = FALSE),
                         sliderInput("act2_tilt", "tilt z axis",
                                     min = -180, max = 180, step = 1, 
                                     value = 35,
                                     width = "200px", ticks = FALSE),
                       ),
                       plotOutput("act3_plot", height = "600px")
                )
              )),
     tabPanel("Wrapping Up",
              fluidRow(
                column(width = 6,
                  wellPanel(id = "wrapuppanel",
                      style = "overflow-y:scroll; max-height: 750px",
                              includeHTML("text/wrapup.html"))),
                column(width = 6,
                       align = "center",
                       plotOutput("wrapup_plot", height = "700px"),
                       verbatimTextOutput("summary")
                )
                
              )) # close tab panel

     ) # close navbar
