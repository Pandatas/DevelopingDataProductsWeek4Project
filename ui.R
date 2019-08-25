# This is the user interface for the shiny app to determine the guinea pig tooth length
# based on supplement type and dosage.

# load libraries
library(shiny)
library(ggplot2)

# load data
data("ToothGrowth")

# define UI for the application
shinyUI(fluidPage(titlePanel("Guinea Pig Tooth Growth Dependency on Supplement Type and Dose"),
                  
                  # Sidebar with inputs for number of variables and output for predicted tooth length
                  sidebarLayout(sidebarPanel(h4("Choose Supplement Type and Dose for plot"),
                                             selectInput("supp", "Supplement Type", (sort(unique(ToothGrowth$supp)))),
                                             selectInput("dose", "Dosage", (sort(unique(ToothGrowth$dose)))),
                                             h4("Choose Dosage for Tooth Growth prediction"),
                                             sliderInput("doselm", "Dosage",
                                                         min = min(ToothGrowth$dose), max = max(ToothGrowth$dose),
                                                        value = max(ToothGrowth$dose) / 2, step = 0.1),
                                             h4("Predicted Tooth Length based on Dosage"), verbatimTextOutput("text1"), width = 4),
                                # Show a plot of the tooth length/dose relationship based on dataset data
                                mainPanel("Tooth Length/Dosage Relationship based on Data from Dataset", plotOutput("distPlot"))
                  )))