data <- read.csv("survey_791736_R_data_file.csv", quote = "'\"", na.strings=c("", "\"\""), stringsAsFactors=FALSE)

# LimeSurvey Field type: F
  data[, 1] <- as.numeric(data[, 1])
  attributes(data)$variable.labels[1] <- "id"
  names(data)[1] <- "id"
# LimeSurvey Field type: DATETIME23.2
  data[, 2] <- as.character(data[, 2])
  attributes(data)$variable.labels[2] <- "submitdate"
  names(data)[2] <- "submitdate"
# LimeSurvey Field type: F
  data[, 3] <- as.numeric(data[, 3])
  attributes(data)$variable.labels[3] <- "Gender"
  data[, 3] <- factor(data[, 3], levels=c(1,2),labels=c("weiblich", "männlich"))
  names(data)[3] <- "F1"
# LimeSurvey Field type: A
  data[, 4] <- as.character(data[, 4])
  attributes(data)$variable.labels[4] <- "Nationality"
  data[, 4] <- factor(data[, 4], levels=c("A1","A2","A3","A4","A5","A6","A7","A8","A9","A10","A11","A12","A13","A14","A15","A16","A17","A18","A19","A20","A21","A22","A23","A24","A25","A26","A27"),labels=c("Austria", "Belgium", "Bulgaria", "Croatia", "Cyprus", "Czechia", "Denmark", "Estonia", "Finland", "France", "Germany", "Greece", "Hungary", "Ireland", "Italy", "Latvia", "Lithuania", "Luxenbourg", "Malta", "Netherlands", "Poland", "Romania", "Slovakia", "Slovenia", "Spain", "Sweden", "United Kingdom"))
  names(data)[4] <- "F2"
# LimeSurvey Field type: A
  data[, 5] <- as.character(data[, 5])
  attributes(data)$variable.labels[5] <- "[Other] Nationality"
  names(data)[5] <- "F2_other"
# LimeSurvey Field type: A
  data[, 6] <- as.character(data[, 6])
  attributes(data)$variable.labels[6] <- "First two letters of your mothers first name"
  names(data)[6] <- "F3"
# LimeSurvey Field type: F
  data[, 7] <- as.numeric(data[, 7])
  attributes(data)$variable.labels[7] <- "Month of your birthday?"
  names(data)[7] <- "F4"
# LimeSurvey Field type: A
  data[, 8] <- as.character(data[, 8])
  attributes(data)$variable.labels[8] <- "First two letters of your star sign"
  names(data)[8] <- "F5"
# LimeSurvey Field type: A
  data[, 9] <- as.character(data[, 9])
  attributes(data)$variable.labels[9] <- "First two letters of your fathers first name"
  names(data)[9] <- "F6"
# LimeSurvey Field type: F
  data[, 10] <- as.numeric(data[, 10])
  attributes(data)$variable.labels[10] <- "How old are you?"
  names(data)[10] <- "F7"
# LimeSurvey Field type: A
  data[, 11] <- as.character(data[, 11])
  attributes(data)$variable.labels[11] <- "In all low-income countries across the world today, how many girls finish primary school?"
  data[, 11] <- factor(data[, 11], levels=c("A1","A2","A3","A4"),labels=c("20 percent", "40 percent", "60 percent", "80 percent"))
  names(data)[11] <- "WQ1"
# LimeSurvey Field type: A
  data[, 12] <- as.character(data[, 12])
  attributes(data)$variable.labels[12] <- "Where does the majority of the world population live?"
  data[, 12] <- factor(data[, 12], levels=c("A1","A3","A2"),labels=c("Low-income countries", "Middle-income countries", "High-income countries"))
  names(data)[12] <- "WQ2"
# LimeSurvey Field type: A
  data[, 13] <- as.character(data[, 13])
  attributes(data)$variable.labels[13] <- "In the last 20 years, the proportion of the world population living in extreme poverty has …"
  data[, 13] <- factor(data[, 13], levels=c("A1","A2","A3"),labels=c("almost doubled", "remained more or less the same", "almost halved"))
  names(data)[13] <- "WQ3"
# LimeSurvey Field type: A
  data[, 14] <- as.character(data[, 14])
  attributes(data)$variable.labels[14] <- "What is the life expectancy of the world today?"
  data[, 14] <- factor(data[, 14], levels=c("A1","A2","A3"),labels=c("50 years", "60 years", "70 years"))
  names(data)[14] <- "WQ4"
# LimeSurvey Field type: A
  data[, 15] <- as.character(data[, 15])
  attributes(data)$variable.labels[15] <- "There are 2 billion children in the world today, aged 0 to 15 years old. How many children will there be in the year 2100, according to the United Nations?"
  data[, 15] <- factor(data[, 15], levels=c("A1","A2","A3"),labels=c("4 billion", "3 billion", "2 billion"))
  names(data)[15] <- "WQ5"
# LimeSurvey Field type: A
  data[, 16] <- as.character(data[, 16])
  attributes(data)$variable.labels[16] <- "The UN predicts that by 2100 the world population will have increased by another 4 billion people. What is the main reason?"
  data[, 16] <- factor(data[, 16], levels=c("A1","A2","A3"),labels=c("There will be more children (age below 15)", "There will be more adults (age 15 to 74)", "There will be more very old people (age 75 and older)"))
  names(data)[16] <- "WQ6"
# LimeSurvey Field type: A
  data[, 17] <- as.character(data[, 17])
  attributes(data)$variable.labels[17] <- "How did the number of deaths per year from natural disasters change over the last hundred years?"
  data[, 17] <- factor(data[, 17], levels=c("A1","A2","A3"),labels=c("More than doubled", "Remained about the same", "Decreased to less than half"))
  names(data)[17] <- "WQ7"
# LimeSurvey Field type: A
  data[, 18] <- as.character(data[, 18])
  attributes(data)$variable.labels[18] <- "How many of the world’s 1-year-old children today have been vaccinated against some disease?"
  data[, 18] <- factor(data[, 18], levels=c("A1","A2","A3"),labels=c("20 percent", "50 percent", "80 percent"))
  names(data)[18] <- "WQ8"
# LimeSurvey Field type: A
  data[, 19] <- as.character(data[, 19])
  attributes(data)$variable.labels[19] <- "Worldwide, 30-year-old men have spent 10 years in school, on average. How many years have women of the same age spent in school?"
  data[, 19] <- factor(data[, 19], levels=c("A1","A2","A3"),labels=c("9 years", "6 years", "3 years"))
  names(data)[19] <- "WQ9"
# LimeSurvey Field type: A
  data[, 20] <- as.character(data[, 20])
  attributes(data)$variable.labels[20] <- "In 1996, tigers, giant pandas, and black rhinos were all listed as endangered. How many of these three species are more critically endangered today?"
  data[, 20] <- factor(data[, 20], levels=c("A1","A2","A3"),labels=c("Two of them", "One of them", "None of them"))
  names(data)[20] <- "WQ10"
# LimeSurvey Field type: A
  data[, 21] <- as.character(data[, 21])
  attributes(data)$variable.labels[21] <- "How many people in the world have some access to electricity?"
  data[, 21] <- factor(data[, 21], levels=c("A1","A2","A3"),labels=c("20 percent", "50 percent", "80 percent"))
  names(data)[21] <- "WQ11"
# LimeSurvey Field type: A
  data[, 22] <- as.character(data[, 22])
  attributes(data)$variable.labels[22] <- "Global climate experts believe that, over the next 100 years, the average temperature will …"
  data[, 22] <- factor(data[, 22], levels=c("A1","A2","A3"),labels=c("get warmer", "remain the same", "get colder"))
  names(data)[22] <- "WQ12"
