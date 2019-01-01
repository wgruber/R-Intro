#---- 06_Paste_Copy_Intro

  # Aufgabe 1
    v <- c(1,4,4,3,2,2,3)
  # Aufgabe 2
    v[c(2,3,4)]
  # Aufgabe 3
    dat <- data.frame(
      time = factor(c("Lunch","Dinner"), levels = c("Lunch","Dinner")),
      total_bill = c(14.89, 17.23)
    )
    dat
    #>     time total_bill
    #> 1  Lunch      14.89
    #> 2 Dinner      17.23
  # Aufgabe 4 & 5
    library(ggplot2)# Load the ggplot2 package
    # Very basic bar graph
    ggplot(data=dat, aes(x = time, y = total_bill)) +
      geom_bar(stat="identity")
    # Map the time of day to different fill colors
    ggplot(data=dat, aes(x = time, y = total_bill, fill = time)) +
      geom_bar(stat = "identity")
    ## This would have the same result as above
    # ggplot(data=dat, aes(x=time, y=total_bill)) +
    #    geom_bar(aes(fill=time), stat="identity")
    # Add a black outline
    ggplot(data = dat, aes(x = time, y = total_bill, fill = time)) +
      geom_bar(colour = "black", stat = "identity")
    # No legend, since the information is redundant
    ggplot(data=dat, aes(x=time, y = total_bill, fill = time)) +
      geom_bar(colour = "black", stat = "identity") +
      guides(fill = FALSE)
  # Aufgabe 6
    data()
    ?tips
    ?french_fries
  # Aufgabe 7
    Dat_FF <- french_fries
    str(Dat_FF)
  # Aufgabe 8
    library(haven)
    bigfive <- read_sav("Data/bigfive.sav")
    View(bigfive)
  # Aufgabe 9
    library(readxl)
    bigfive <- read_excel("Data/bigfive.xls")
    View(bigfive)

#---- 06_Objekte_Anlegen
  
  name       <- "Max Mustermann" # Beachte das Fenster Environment
  mein.alter <- 35
  mein.alter
  mein.alter + 10
  mein.alter.1 <- mein.alter + 10
  mein.alter.1

#---- 06_Objekte_Vektoren_Anlegen
  
  # Fasse Zahlen in einem Vektor zusammen
    alter    <- c(19, 24, 20, 19) # Beispiel: Alter von 4 Studenten
    kurs.num <- c(1, 3, 2, 2) # Beispiel: Zugeh?rigkeit zu einem von 3 Kursen
  # Fasse Buchstaben in einem Vektor zusammen
    kurs.bez <- c('Kurs1', 'Kurs3', 'Kurs2', 'Kurs2')
  # Zeige Inhalt des Vektors
    alter
    kurs.num
    kurs.bez
    
#---- 06_Objekte_Vektoren_Zugreifen    
    
    alter[2]   # direkte Indizierung, das zweite Element des Vektors wird ausgegeben
    alter[1:3] # direkte Indizierung, das erste bis dritte Element des Vektors wird ausgegeben.
               # Beachte dabei die Verwendung von :
    2:4        # erzeugen eines Vektors der in ganzen Schritten von 2 beginnend bis 4 hinaufz?hlt
    v_1 <- 2:4 # speichern des Vektors in der Variablen v_1
    alter[v_1] # Verwendung des Vektors v_ind um die Elemente des Vektors alter auszugeben
    v_2 <- seq(from = 1,  # erzeugen einer Sequenz von Zahlen, die mit 1 beginnt, bei 4 endet
               to   = 4,  # und in 2-er Schritten hinaufz?hlt
               by   = 2)  # Die Sequenz wird in v_2 gespeichert.
    alter[v_2] # Verwendung des Vektors v_2 um die Elemente des Vektors alter auszugeben.
    alter[-4]  # um Werte eines Vektors nicht anzuzeigen, kann der Index des entsprechenden
               # Wertes mit einem f?hrenden Minuszeichen angegeben werden. Dadurch wird der 
               # vierte Eintrag des Vektors nicht ausgegeben!
    v_3  <- c(1, 3, 4) # auch die Verwendung der Funktion c() kann zur Erstellung von Indexlisten
                       # verwendet werden.
    alter[v_3]

#---- 06_Objekte_Vektoren_Datentyp
    
    class(alter) # Zeigt an, zu welcher Klasse die Inhalte des Objekts alter geh?ren
    alter_char <- as.character(alter) # wandelt num in char
    class(alter_char)
    alter_num  <- as.numeric(alter_char) # wandelt char in num
    class(alter_num)

#---- 06_Objekte_LogischeVektoren
    
    T & T
    F & F
    T & F
    T | T
    F | F
    T | F
    (T & F) | T
    
    Vec <- c(rep( "Nein", len = 25), 
                   rep( "Ja", len = 43),
                   rep( "Weder noch", len = 12))
    sum(Vec == "Ja")
    
#---- 06_Objekte_Vektorenrechnung
    
    Geburtsjahr <- 2018 - alter
    Alter_Tage  <- alter * 365
    v1 <- 1:5
    v2 <- v1*2
    v2
    v2 <- v2 - .5
    v2
    v3 <- c(2, 5, 8, 10, 12)
    v4 <- v1 * v3
    
#---- 06_Objekte_Vektorfunktionen
    
    y <- c("a", "b", "c", "d") 
    rep(y, 3) # Replicate Elements of Vectors and Lists
    rep(1:5, 4)
    n <- c(2, 4, 1, 10)
    rep(y, n)
    y <- c("i", "i", "a", "a", "E", "E", "E", "E", "U")
    unique(y) # eindeutige Elemente eines Vektors
    table(y)  # erstellt eine Kreuztabelle
    sort(y)   # sortieren von Vektoren (ACHTUNG: order() bei Datenstrukturen verwenden, siehe sp?ter)
    paste(y, 1:9)
    paste0(y, 1:9)

#---- 06_Objekte_InOperator
    
    InVec <- Vec %in% c("Nein", "Weder noch")
    InVec
    
#---- 06_Objekte_Datenextraktion
    
    VRand <- rnorm(200, mean = 50, sd = 8)
    VRand_GT_Mean_Indices <- VRand >= mean(VRand, na.rm = T)
    VRand[VRand_GT_Mean_Indices]
    sum(VRand_GT_Mean_Indices)
    sum(VRand_GT_Mean_Indices == "TRUE")
    sum(VRand_GT_Mean_Indices != "TRUE")
    any(VRand_GT_Mean_Indices)
    which(VRand_GT_Mean_Indices)
    which(VRand_GT_Mean_Indices == "TRUE")    
    which(VRand_GT_Mean_Indices == "FALSE")    

#---- 06_Objekte_Vektoren_Angaben

    # Vektoren - Combine
    id     <- c(11, 16, 17, 18, 19, 20, 23) # c() entspr. combine; <- Zuweisung zu einer Variablen
    Geschlecht <- c("m?nnlich", "weiblich")
    sex    <- c(1, 1, 7, 1, 1, 2, 2)
    lalt   <- c(2, 3, 2, 3, 1, 1, 2)
    gross  <-  c(173, 166, 178, 154, 164, 389, 181)
    mon    <- c(266, 241, 231, 265, 225, 229, 222)
    date   <- c(4, 5, 3, 3, 2, 4, 3)
    entsch <- c(3, 4, 4, 5, 3, 1, 2)
    proj   <- c(2, 1, 2, 2, 2, 1, 2)
    i1     <- c(3, 2, 1, 3, 4, 2, 2)
    i2     <- c(3, 2, 1, 3, 4, 2, 2)
    i3     <- c(3, 3, 3, 2, 2, 2, 4)
    i4     <- c(2, 1, 2, 4, 2, 1, 4)
    i5     <- c(2, 1, 4, 1, 3, 4, 1)
    
#---- 06_Objekte_Vektoren_Lsg
    
    mean(gross)          # A1: Aufruf der Funktion mean().
    gross1     <-  gross # A2: Kopiere Werte von gross in gross1
    gross1[1]  <-  NA    # A3: setzte den ersten Wert von gross1 auf NA (not available) = missing value
    mean(gross1)         # A4: BEACHTE, dass mean nun NA ist -> Markiere mean und dr?cke F1
    mean(gross1, na.rm = TRUE) # A5: nun wird der Mittelwert richtig berechnet!
    mean(gross1, trim = 0.5, na.rm = TRUE) # A6
    gross_prod <- gross[2]*gross[3] # A7
    sex[3]  <- 1    # A8
    x       <- 50:1 # A9
    x[-2]           # A10: Alle Werte bis auf den zweiten Wert der Liste.
    x       <- seq(from = 1, # A11: vgl. gegebenenfalls in der Hilfe unter seq()
                   to = 10,
                   by = 2)
    x       <- seq(from = 10, # A12
                   to = 2,
                   by = -2)
    x       <- c(seq(from = 0, # A13
                     to   = 10,
                     by = 2), 50)
    class(x)  # A14
    x_c <- as.character(x) # A15
    class(x_c) # A16
    x_n <- as.numeric(x)  # A17
    class(x_n) # A18
    sum(gross >= 173) # A19
    which(gross %in% 181) # A20

#---- 06_Objekte_Faktoren
    # Fasse Zahlen in einem Vektor zusammen
    alter    <- c(19, 24, 20, 19) # Beispiel: Alter von 4 Studenten
    kurs.num <- c(1, 3, 2, 2) # Beispiel: Zugeh?rigkeit zu einem von 3 Kursen
    # Fasse Buchstaben in einem Vektor zusammen
    kurs.bez <- c('Kurs1', 'Kurs3', 'Kurs2', 'Kurs2')

    A <- factor(c("male", "female", "female", "male"))
    A
    levels(A)
    nlevels(A)

    kurs.fac1 <- factor(kurs.num)
    class(kurs.fac1)

    kurs.fac2 <- factor(kurs.num, 
                        levels = c(1, 2, 3), 
                        labels = c('Kurs1', 'Kurs2', 'Kurs3'))
    str(kurs.fac2)
    levels(kurs.fac2)
    table(kurs.fac2)
    
#---- 06_Objekte_Faktoren_Aufgaben_Lsg
    
    # Aufgabe 1
    x       <- c(1, 2, 3, 1, 1, 2, 2)
    x_fact  <- factor(x, levels = c(1, 2, 3), labels = c('A', 'B', 'C'))
    # Aufgabe 2
    x_fact2         <- x_fact
    levels(x_fact2) <- c('S1', 'S2', 'S3')
    table(x_fact2)
    # Aufgabe 3
    x_fact3 <- factor(x_fact2, levels = c("S3", "S1", "S2"))
    table(x_fact2)
    table(x_fact3)
    
#---- 06_Objekte_Matrizen
    
    A <- 1:10
    B <- sample(15:93, 10, replace = TRUE)
    C <- rbind(A,B)      # Zeilenweises zusammenführen der beiden Vektoren
    str(C)               # Zeigt die Struktur und jeweiligen Datentypen in der Struktur von Matrix C
    
    matrix.col           <- cbind(A, B) # Spaltenweises zusammenf?hren der beiden Vektoren
    matrix.col
    colnames(matrix.col) <- c("LNr", "Alter")
    rownames(matrix.col) <- paste0("VP", 1:10)
    matrix.col

    matrix.col.Alternativ <- cbind(LNr = A, Alter = B) # sofortige Benennung der Variablen
    matrix.col.Alternativ
    
    matrix.rows           <- rbind(A, B) # Zeilenweises zusammenführen der beiden Vektoren
    matrix.rows
    
    AnzZeilen  <- nrow(matrix.rows)
    AnzSpalten <- ncol(matrix.rows)
    DimMat     <- dim(matrix.rows)
    DimMat[1] # Anzahl Zeilen in der Matrix matrix.rows
    DimMat[2] # Anzahl Spalten in der Matrix matrix.rows

#---- 06_Objekte_Matrizen_Zugriff

    matrix.rows
    matrix.rows[2,]    # liest alle Elemente der zweiten Zeile einer Matrix
    matrix.rows[,2]    # liest alle Elemente der zweiten Spalte einer Matrix
    matrix.rows[1,2]   # liest das Element der ersten Zeile und der zweiten Spalte einer Matrix
    matrix.rows[2,1]   # liest das Element der zweiten Zeile und der ersten Spalte einer Matrix
    matrix.rows[1,3:4] # liest das Element der ersten Zeile und der dritten bis vierten Spalte einer Matrix
    ZI <- 2            # Zeilenindex
    SI <- c(1,3,4)     # Spaltenindex
    matrix.rows[ZI,SI] # liest die ZI'te Zeile(n) und die SI'ten Spate(n)
    
    matrix.rows[3]     # Gibt das dritte Element eine Matrix aus. Ausgehend von der ersten Zeile und Spalte,
                       # werden die Elemente der ersten Spalte aufsteigend nummeriert. Am Ende einer Spalte,
                       # wird die Nummerierung in der ersten Zeile der nachfolgenden Spalte fortgesetzt - 
                       # bis das Ende der Matrix erreicht ist.
    matrix.rows[6]
    
#---- 06_Objekte_Matrizen_Erzeugung
    
    matrix(5, 3, 3)
    matrix( rep( 0, len = 25), nrow = 5)
    matrix(runif(9), 3, 3)
    a <- sample(1:100, 9, replace = TRUE)
    matrix(a, 3, 3)
    b <- rnorm(9, mean = 100, sd = 15)
    matrix(b, 3, 3)
    
#---- 06_Objekte_Matrizen_Artihmetik

    R1 <- rnorm(9, mean = 100, sd = 15)
    m1 <- matrix(R1, 3, 3)
    R2 <- rnorm(9, mean = 100, sd = 15)
    m2 <- matrix(R2, 3, 3)
    dim(m1) == dim(m2)
    R3 <- rnorm(12, mean = 100, sd = 15)
    m3 <- matrix(R3, 4, 3)
    dim(m1) == dim(m3)

    m1 * m2    
    m1 - m2
    m1 / m2    

    m4 <- m1 %*% m2 # ACHTUNG: berechnet das Skalarprodukt!
    m4
    m5 <- m1[,1] %*% m2[,1]
    m5

#---- 06_Objekte_Matrizen_Apply
    
    R6 <- rnorm(24, mean = 100, sd = 15)
    m6 <- matrix(R6, 8, 3)
    mean(m6)           # Grand Average der Matrix m1
    apply(m6, 1, mean) # Mittelwert der Zeilen
    apply(m6, 2, mean) # Mittelwert der Spalten
    
#---- 06_Matrizen_Aufgaben_Daten
    
    id     <- c(11, 16, 17, 18, 19, 20, 23) # c() entspr. combine; <- Zuweisung zu einer Variablen
    Geschlecht <- c("männlich", "weiblich")
    sex    <- c(1, 1, 7, 1, 1, 2, 2)
    lalt   <- c(2, 3, 2, 3, 1, 1, 2)
    gross  <-  c(173, 166, 178, 154, 164, 389, 181)
    mon    <- c(266, 241, 231, 265, 225, 229, 222)
    date   <- c(4, 5, 3, 3, 2, 4, 3)
    entsch <- c(3, 4, 4, 5, 3, 1, 2)
    proj   <- c(2, 1, 2, 2, 2, 1, 2)
    i1     <- c(3, 2, 1, 3, 4, 2, 2)
    i2     <- c(3, 2, 1, 3, 4, 2, 2)
    i3     <- c(3, 3, 3, 2, 2, 2, 4)
    i4     <- c(2, 1, 2, 4, 2, 1, 4)
    i5     <- c(2, 1, 4, 1, 3, 4, 1)
    
#---- 06_Matrizen_Aufgaben_Lsg
    
    X <- cbind(lalt, sex, gross) # A1
    Z <- rbind(lalt, sex, gross) # A2
    X[2,3] # A3
    X[3,] # A4
    X[3:5,1:2]  # A5
    colnames(X)  # A6
    ColNames    <- c("Alter", "Gewicht", "Gr??e")  # A7
    colnames(X) <- ColNames # A8
    namen       <- c("Walter", "Gerda","Hannes", "Ute", "Hanna","Doris","Karin") # A9
    rownames(X) <- namen  # A10
    fix(X)  # A11
    dim(X)  # A12
    length(X)  # A13
    cbind(X, X[,3] / 100)
    which(X[,3] > 200)
    
#---- Objekte_DataFrames
    
    A  <- 1:10
    B  <- c(rep(0,5), rep(1,5))
    B  <- factor(B, levels = c(0,1), labels = c("Male", "Female"))
    C  <- c("Georg", "Hanna", "Belinda", "Christoph", "Claudia", 
           "Peter", "Nikolas", "Eva", "Gerda", "August")
    D  <- sample(15:93, 10, replace = TRUE)
    
    E  <- rbind(A, B, C, D) # Wandelt alle Daten in Character! Daher verwendet man die Funktion data.frame()
    
    DF <- data.frame(A, B, C, D)
    str(DF)               # Zeigt die Struktur und jeweiligen Datentypen in der Struktur Dataframe E
    DF
    DF[1,2]
    colnames(DF)
    rownames(DF)
    colnames(DF) <- c("LNr", "Geschlecht", "Name","Alter")
    AnzZeilenDF  <- dim(DF)[1] # oder nrow(DF)
    rownames(DF) <- paste0("VP", 1:AnzZeilenDF)
    rownames(DF) <- paste0("VP", 1:nrow(DF))    # gleichwertige M?glichkeit
    rownames(DF) <- paste0("VP", 1:dim(DF)[1])  # gleichwertige M?glichkeit
    DF
    DF$Name
    DF$Alter[2:3]
    attach(DF)
    Alter
    detach(DF)

#---- Objekte_DataFrames_Aufgaben_Lsg
    
    fragebogen <- data.frame(id, sex, lalt, gross, mon, date, entsch, proj, i1, i2, i3, i4, i5) # A1
    fragebogen[3,] # A2
    head(fragebogen) # A3
    fragebogen$i1[1:3] # A4
    fragebogen[1:3,9] # A5
    fragebogen[1:3,"i1"] # A5 - Alternative L?ung mit Verwendung des Spaltennamens
    attach(fragebogen) # A6
    detach(fragebogen) # A6

#---- Objekte_Listen

    LI        <- list("Rot", c(21,32,11), TRUE, 51.23, m1) # Generiere Liste mit verschiedenen Eintr?gen
    str(LI) # Zeige die Struktur der Liste an
    names(LI) <- c("Farbe", "Alter", "Raucher","Gewicht", "Matrix")
    str(LI)
    # Alternativ kann man die Namen der Listen auch bereits bei der Erstellung durchf?hren
    LI1        <- list(Farbe = "Rot", 
                       Vec = c(21,32,11), 
                       Logi = TRUE, 
                       Wert = 51.23, 
                       Mat = m1) # Generiere Liste mit verschiedenen Eintr?gen
    str(LI1)
    
    LI$Farbe
    LI$Matrix[2, 2:3]
    LI[5]
    LI[[5]][2, 2:3]
    
    LI[6] <- list(Matrix2 = m2) # F?ge Element als letztes Element der Liste hinzu
    str(LI)
    LI[6] <- NULL # Entferne letztes Element der Liste

    LI    <- list(LI, list("green",12.3)) # Listen ineinander verschachteln
    str(LI) # Zeige die Struktur der Liste an
    LI[[1]]$Farbe
    LI[[2]][1]
    XLi <- unlist(LI)
    XLi
    
#---- Objekte_Tables
    rm(list = ls())
    F1 <- factor(c("A","A","B","A","B","B","C","A","C"))
    results <- table(F1)
    results
    attributes(F1)
    
    
    V1 <- c("Sometimes","Sometimes","Never","Always","Always","Sometimes","Sometimes","Never")
    V2 <- c("Maybe","Maybe","Yes","Maybe","Maybe","No","Yes","No")
    results <- table(V1,V2)
    results    
    
    sexsmoke           <- matrix(c(70,120,65,140),ncol = 2,byrow = TRUE)
    rownames(sexsmoke) <- c("male","female")
    colnames(sexsmoke) <- c("smoke","nosmoke")
    sexsmoke           <- as.table(sexsmoke)
    sexsmoke
    
    sexsmoke_DF        <- as.data.frame(sexsmoke)
    
    library(data.table)
    
    DT <- data.table( ID = 1:50,
                      Capacity = sample(100:1000, size = 50, replace = F),
                      Code = sample(LETTERS[1:4], 50, replace = T),
                      State = rep(c("Alabama","Indiana","Texas","Nevada"), 50))
    
    #simple data.table command
    DT[Code == "C", mean(Capacity), State]
    
    DT[Code == "D"]
    DT[, mean(Capacity), by = State]
    DT[Code == "A", mean(Capacity)]
    
#---- Objekte_Attribute    

    str(sexsmoke)
    attr(sexsmoke, "dim")
    
    y <- 1:10
    attr(y, "Mein_Attribut") <- "y ist ein Vektor"
    
    attr(y, "Mein_Attribut")
    str(attributes(y))
    