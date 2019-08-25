Tooth Growth of Guinea Pigs App
========================================================
author: Pandatas
date: 25 August 2019
autosize: true
Developing Data Products - Project Week 4

Introduction
========================================================
ToothGrowth is a dataset in R containing the tooth lengths (len) of 60 guinea pigs per supplement type (supp) and dosage (dose). Each guinea pig received one of three dose levels of vitamin C (0.5, 1, and 2 mg/day) by one of two delivery methods, orange juice or ascorbic acid (a form of vitamin C and coded as VC).

This Shiny app shows the dataset "ToothGrowth" in R plotted based on user input of supplement type and Dosage. It also predicts the toothgrowth based on dosage by setting the slider to a certain dosage level.


Documentation
========================================================
The ToothGrowth dataset consists of a dataframe with 60 observations on 3 variables:

```r
data(ToothGrowth)
str(ToothGrowth)
```

```
'data.frame':	60 obs. of  3 variables:
 $ len : num  4.2 11.5 7.3 5.8 6.4 10 11.2 11.2 5.2 7 ...
 $ supp: Factor w/ 2 levels "OJ","VC": 2 2 2 2 2 2 2 2 2 2 ...
 $ dose: num  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 ...
```


The Shiny Tooth Growth App - User Inputs and Outputs
========================================================
The plot shows the dataset from R based on the following user inputs (dropdown menus):
- Supplement type (OC or VC)
- Dosage

By using the slider, input is provided to predict the tooth growth. The prediction model only takes dosage into account and makes no distinction between "OJ" and"VC".


Links
========================================================
- shiny app:   https://pandatas.shinyapps.io/shinyapp/
- source code: https://github.com/Pandatas/DevelopingDataProductsWeek4Project
