#---- 09_RLS_Init
  
  rm(list = ls())
  if (!require("pacman")) install.packages("pacman")
  pacman::p_load(here)

#---- 09_RLS_Aufgabe1
  
  source("RScripts/LS_Import.R")
  F2L <- "Data/survey_791736_R_data_file.csv"
  DF  <- LS_Import(F2L = F2L)
  str(DF)
  
#---- 09_RLS_Aufgabe2
  
  table(DF$Gender) # A2-1
  table(DF$Nationality) # A2-2
  table(droplevels(DF$Nationality))  # A2-3
  table(DF$Gender, droplevels(DF$Nationality)) # A2-4
  addmargins(table(DF$Gender, droplevels(DF$Nationality))) # A2-5
  addmargins(round(prop.table(table(DF$Gender, droplevels(DF$Nationality)))*100,2)) # A2-6

#---- 09_RLS_Aufgabe3
  
  library(doBy)
  summaryBy(formula = Age ~ Gender, 
            data    = DF) # A3-1
  summaryBy(formula = Age ~ Gender, 
            data    = DF, 
            FUN     = c(mean, sd, var, min, max)) # A3-2
  summaryBy(formula = Age ~ Gender + Nationality, 
            data    = DF) # A3-3
  summaryBy(formula = Age ~ Gender + Nationality, 
            data    = DF, 
            FUN     = c(mean, sd, var)) # A3-4

#---- 09_RLS_Aufgabe4
  
  library(ggplot2)
  
  LegTit          <- paste0('Overall (N  =  ', dim(DF)[1], ') answers in %')  
  ColInd          <- which(colnames(DF) %in% c("WQ1"))
  WQ_Label        <- attributes(DF)$variable.labels[ColInd]

  CT              <- round(100*addmargins(prop.table(table(DF[,ColInd], DF$Gender)), margin  =  2), 2)
  DF_CT           <- as.data.frame(CT)
  colnames(DF_CT) <- c("Answer", "Gender", "Percent")
  
  ggplot(DF_CT, aes(x  =  Answer, y  =  Percent, fill  =  Gender)) +
        geom_bar(position = position_dodge(), stat = "identity",
                 colour = "black", # Use black outlines,
                 size = .3) +
    coord_flip() +
    xlab("Answer") +
    guides(fill = guide_legend(title = LegTit)) +
    labs(title    = WQ_Label,
         subtitle = "World Knowledge Test",
         caption  = "Source: World Knowledge Query PLUS  (2018)",
         tag      = "A") +
    scale_fill_grey() +
    geom_text(aes(label = paste0(round(Percent, 1), "%")), 
              position  = position_dodge(width=0.9),
              hjust     = -0.25) +
    theme_bw()
