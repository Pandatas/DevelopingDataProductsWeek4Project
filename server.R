# This is a shiny app to determine the effect of vitamin C on tooth growth in guinea pigs based on supplement type and dosage.
# It shows both an interactive plot representing the data from the dataset (based on type and dosage input)
# and a prediction of tooth length based on dosage.

# load libraries
library(shiny)
library(ggplot2)
library(curl)

# load data
data("ToothGrowth")

# Linear model that is used for prediction in server logic below
fit <- lm(len~dose,data=ToothGrowth)

# Define server logic
shinyServer(function(input, output) {
    
    # convert data to numeric
    ToothGrowth$len <- as.numeric(ToothGrowth$len)
    ToothGrowth$dose <- as.numeric(ToothGrowth$dose)
    
    # create the plot showing the data from the dataset
    output$distPlot <- renderPlot({
        
        # subset the data based on the inputs
        ToothGrowth_sub <- subset(ToothGrowth,
                                   supp== input$supp &
                                   dose == input$dose)
        
        # plot the tooth growth data with dose
        p <- ggplot(data = ToothGrowth_sub , aes(x = dose, y = len)) + geom_point()
        p <- p + geom_smooth(method = "lm") + xlab("Dose (mg/day)") + ylab("Tooth length")
        p <- p + xlim(0, 2.5) + ylim (0, 35)
        p
    }, height = 450)
    
    # create linear model to predict toothgrowth based on dosage
    output$predict <- renderPrint({
        ToothGrowth_sub <- subset(ToothGrowth,
                                      supp == input$supp &
                                      dose == input$dose)
        predictedlength <- summary(fit)$coefficients[1,1]+summary(fit)$coefficients[2,1]*input$doselm})
        output$text1 <- renderText(summary(fit)$coefficients[1,1]+summary(fit)$coefficients[2,1]*input$doselm)
     })
    
    
    