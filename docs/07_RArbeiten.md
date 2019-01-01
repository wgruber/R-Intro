# Rarbeiten



Unabhängig vom verwendeten Statistik-Programm werden wir in den meisten Fällen Daten nicht erst im jeweiligen Programm definieren und erfassen, sondern auf bereits vorliegende Daten zurückgreifen. Eine wichtige Ausnahme ist dabei die Simulation von Daten. Bereits mit einem *normalen* Desktop-PC ist es möglich, eine Unmenge an Daten (surrogate data) im Handumdrehen zu erzeugen und diese mittels statistischer Verfahren, Modelle und Algorithmen innerhalb kürzester Zeit auszuwerten. Zur Prüfung der Eigenschaften von Modellen und Algorithmen ist diese Vorgehensweise ein wichtiges Hilfsmittel.

Zur Erfassung von Echtdaten wird aber üblicherweise kein statistisches Analyseprogramm verwendet. Daher liegen diese Daten auch in verschiedensten Formaten vor und es ist einer der ersten Schritte in der statistischen Datenanalyse, diese Daten vom jeweiligen Format in ein für das Statistikprogramm lesbares umzuwandeln. Die am häufigsten verwendeten Formate mit denen wir es derzeit zu tun haben sind:

* R-Dateien im *RData*, *rda* und *rds* Format
* Textdateien im *csv*, *dat*, *txt* Format
* SPSS, JAMOVI, etc. Dateien (*sav*, *omv*, etc.)
* Excel-Tabellen im xls, oder *xlsx* Format
* Binäre Daten im *bin* Format
* Proprietäre Formate diverser Labor- und Messgeräte

Im Folgenden beschränken wir uns auf die üblichsten Fileformate, den R-, Text-, SPSS- und Excel-Dateien.

## Lesen und speichern von Dateien {-}

Das Lesen und Speichern von Dateien kann entweder direkt im RStudio über das Environment-Pane, oder über einen entsprechenden R-Code in der Konsole, bzw. über den Source-Pane durchgeführt werden. Zu unterscheiden sind die verschiedenen Dateitypen, von denen es abhängt, welche Funktion zu wählen ist.

### R-Dateien {-}

Liegen Daten bereits im R-eigenen Format vor, können diese einfach mit der Funktion *load(Dateiname)* eingelesen werden. Bezüglich der Dateierweiterung unterscheidet R folgende Typen:

1. *.RData*: der Inhalt des zum Zeitpunkt des speicherns (*save()*) vorhandenen Environments.
2. *.rda*: Kurzbezeichnung für RData.
3. *.rds*: speichert ein einzelnes R-Objekt.

Der Vorteil dieser Datenformate liegt darin, dass die Datenstrukturen, wie z.B. Datentypen der Spalten (numerisch, character, factor) erhalten bleiben. Bei anderen Dateiformaten ist dies nicht automatisch gegeben. In einem ersten Schritt verwenden wir die im Environment-Pane vorhandenen Möglichkeiten Files zu laden und zu speichern. 

Kopiere zuerst den nachfolgenden Code in ein neues R-Script, speicher dieses unter dem Namen *07_RArbeiten_Files.R* und führe anschließen den Code zeilenweise aus.


```r
# Initialisierung
  rm(list = ls())
  if (!require("pacman")) install.packages("pacman")
  pacman::p_load(here)
  # Ende Initialisierung
```

Verwende nun das Symbol *Open File* im Environment-Pane und wähle die Datei *bigfive.RData* im entsprechenden Datenverzeichnis (gegebenenfalls noch von [Daten zum Seminar](http://tuval.at/lehrveranstaltungen/daten/data) herunterladen und lokal am Rechner speichern). Führe folgende Arbeitsschritte durch:

1. Im Konsolenfenster wird die Funktion zum Laden der Datei (*load(xxx)*) angezeigt. Kopier diese Zeile in den Editor.
2. Erzeuge eine Kopie dieses Objektes und benenne diese mit *KopieBigFive*
3. Verwende das Symbol Speichern im Environment-Pane und speichere den Inhalt des Environments unter den Namen *BigFive_New_1*. Im Konsolenfenster wird die Funktion zum Speichern der Datei (*save.image(xxx)*) angezeigt. Kopier diese Zeile in den Editor. Ruf die Hilfefunktion auf um herauszufinden, was es mit dieser Funktion auf sich hat.
4. Bereinige das Environment unter Verwendung des Pinsel-Symbol.
5. Lade die soeben gespeicherte Datei (*BigFive_New_1.RData*) mit dem Symbol *Open File*. Beachte, dass nun beide Objekte wieder im Environment zur Verfügung stehen.

Nachfolgender Code zeigt die soeben besprochenen Aufgabenschritte.


```r
  load(here("Data/bigfive.RData")) # A1
  KopieBigFive <- bigfive  # A2
  save.image(here("Data/BigFive_1.RData"))  # A3
  rm(list = ls()) # A4
  load(here("Data/BigFive_1.RData")) # A5
  save.image(here("Data/BigFive_2.RData")) # A6
  rm(list = ls()) # A7
  load(here("Data/BigFive_2.RData")) # A8
  
  saveRDS(KopieBigFive, file = here("Data/BigFive_3.rds"))
  rm(list = ls())
  KopieBigFive <- readRDS( here("Data/BigFive_3.rds") )
```

Im folgenden werden ergänzende Möglichkeiten zum Speichern/Laden von Daten gezeigt. Mit der Funktion saveRDS() können einzelne Objekte gespeichert und mit readRDS() auch wieder geladen werden. Will man mehrere, aber nicht alle Objekte des Environments speichern, kann dies durch Angabe der Objektnamen und der Funktion save() durchgeführt werden.


```r
  Seminar <- "R-Intro"
  V1      <- 1:10
  M1      <- matrix(1, 3, 3)
  M2      <- matrix(5, 8, 3)
  
  save(Seminar, V1, file = here("Data/BigFive_4.RData") )
  rm(list = ls())
  load(here("Data/BigFive_4.RData"))
  rm(list = ls())
```

### Text-Dateien {-}

Mit der *read.csv()*, *read.table()* und verwandten Funktionen können Daten aus Textdateien (txt) importiert werden. *read.table()* ist die Basisfunktion zum Import von Textdateien. *read.csv()* und *read.csv2()* sowie einige andere Funktionen sind Anpassungen an häufig auftretenden Fülle. 

CSV[^12] ist für viele Tabellenkalkulationen und andere Anwendungen ein übliches Exportformat. Irreführend bei diesem Format ist oftmals die Verwendung der Trennzeichen für unterschiedliche Daten. Der Name *csv* suggeriert, dass ein Kommazeichen die Datensätze innerhalb der Datei trennt. Tatsächlich kann man aber ein beliebiges Zeichen verwenden. Am häufigsten findet man den Tabulator, oder den Strichpunkt als Trennzeichen. Bezüglich des Kommazeichens sollte man noch vor dem Import einer Datei prüfen, ob dieses als Trennzeichen für Dezimalzahlen verwendet wurde, oder ob (wie im englischen Sprachraum üblich) der Punkt die Dezimaltrennung kennzeichnet.

Bemerkung bezüglich der Leistungsfähigkeit von Funktionen beim Lesen von (wirklich) großen Dateien: die *read.csv()* und damit verwandten Funktionen weisen bei *big data* im Vergleich zu optimierten Funktionen wie z.B. *fread()* (aus dem Paket *data.table*) wesentlich höhere Ladezeiten auf. Bei kleinen Datensätzen ist dies jedoch zu vernachlässigen.

Um eine Textdatei zu laden, betrachten wir zunächst wie RStudio dabei vorgeht. Im Environment-Pane finden wir bei den Reitern die Möglichkeit *Import-Dataset*. Folgende Optionen werden angeboten:

* From Text (base) ...
* From Text (readr) ...
* From SPSS ...
* From Excel ...
* From SAS ...
* From Stata ...

Lade die Datei *ATM.txt* mit der Option *From Text (base) ...* und kopiere die Befehlszeilen in den Editor. Diskutiere die Ergebnisse. Entferne anschließend alle Inhalte aus dem Environment und wiederhole das Laden der Datei mit der Option *From Text (readr) ...*. Vergleiche die Funktionen und diskutiere den Unterschied der beiden Funktionen.


```r
  ATM <- read.delim("C:/NextCloud/LEHRE2019/18WS R-Intro/Data/ATM.txt")
  View(ATM)  
  
  rm(list = ls())
  
  library(readr)
  ATM <- read_table2("Data/ATM.txt")
  View(ATM)
```

[^12]: *C*omma *S*eparated *V*alues

### SPSS-Dateien {-}

Wie bei den Textdateien, verwenden wir in einem ersten Schritt die Importfunktion von RStudio. Lade die Datei *bigfive.sav* (eine SPSS Datei) und kopiere den Code aus der Konsole in den Editor.


```r
  rm(list = ls())
  library(haven)
  bigfive <- read_sav("Data/bigfive.sav")
  View(bigfive)
  str(bigfive)
```

Überprüfe die Struktur des geladenen Objektes. Auffallend ist der bislang noch nicht besprochenen Datentyp *tbl_df*. Dabei handelt es sich im Wesentlichen um einen Dataframe. Gehe in den Files-Pane zu den Packages und suche nach dem Paket *haven*. Öffne die Doku des Pakets, bzw. öffne die Hilfe zu *haven::read_sav()* direkt. Weiterführend Information zu diesem Datenformat ist unter anderem auf folgender Seite zu finden: [Tibble](https://tibble.tidyverse.org/)

Eine weitere - zum Einlesen von SPSS-Dateien - geeignete Funktion wird im Paket *foreign* angeboten (*read.spss()*).

Aufgabe:

1. Stelle fest, ob in deinem Repository dieses Paket bereits geladen ist (*Hinweis*: vgl. [List of Packages](https://www.r-bloggers.com/list-of-user-installed-r-packages-and-their-versions/)). Falls nicht, lade das Paket samt abhängigen Paketen. 
2. Bereinigen das Environment und lade die Datei *bigfive.sav* mit Hilfe der Funktion *read.spss()*.
3. Überprüfe und diskutiere den Inhalt, bzw. die Datentypen des geladenen Objektes.


```r
  ip           <- as.data.frame(installed.packages()[,c(1,3:4)])
  rownames(ip) <- NULL
  ip           <- ip[is.na(ip$Priority),1:2, drop = FALSE]
  print(ip, row.names = FALSE)
  library(foreign)  
  BF           <- read.spss("Data/bigfive.sav", to.data.frame = TRUE)
  str(BF)
```

Neben den Paketen *haven* und *foreign* gibt es noch weitere Packages welche Funktionen zum Einlesen von SPSS-Dateien beinhalten (z.B. *Hmisc* mit der Funktion *spss.get()*). Die derzeit wahrscheinlich beste Funktion ist im Paket *haven* zu finden, aber auch alle anderen Funktionen aus anderen Packages erfüllen i.A. ihren Zweck.

### Excel-Dateien {-}

Das Laden und Speichern von Excel-Dateien sollte aufgrund der Häufigkeit mit der Daten aus diesem Programm in R übernommen werden keine Hexerei sein. Erfahrungsgemäß ist aber gerade dieses Format (*xls* und *xlsx*) nicht so einfach zu handhaben wie zu erwarten wäre.

Die einfachste (und oft durchgeführte Alternative) ist die Speicherung von *xls*-Tabellen als *csv*-Dateien. Anderenfalls gibt es natürlich verschiedene Packages mit Funktionen die derartige Dateien direkt lesen und schreiben können. Folgende Packages enthalten Funktionen zum Lesen von Excel-Files:

* *readxl* (kann nur Excel-Dateien lesen, nicht schreiben)
* *xlsx* 
* *XLConnect*
* *gdata* u.v.m.

Die Entscheidung, welches davon genutzt wird, bleibt dem Anwender überlassen. RStudio verwendet im Import das *readxl*. Zum Kennenlernen werden wir in einem ersten Schritt die Datei *bigfive_excel.xls* über den Datenimport von RStudio laden. Bitte den entsprechenden Code in den Editor kopieren. Anschließend testen wir die Funktion des Packages *xlsx*. Für die Verwendung von *XLConnect* und *gdata* sei aus zeitlichen Gründen auf die entsprechende Dokumentation verwiesen.

Neben dem Einlesen von Excel-Files ist das Speichern von Ergebnissen in Excelformat für die weitere Verwendung des Endnutzers sehr wichtig. Wie Daten in ein Excelfile übertragen und dieses auch abgespeichert wird, ist dem nachfolgenden Code zu entnehmen. Kopiere den Code in den Editor und führe diesen zeilenweise aus. Diskutiere die Ergebnisse.


```r
  rm(list = ls())
  
  library(readxl)
    ptm <- proc.time()
    bigfive_excel_1 <- readxl::read_excel("Data/bigfive_excel.xls") # Funktion prüft ob xls oder xlsx
    proc.time() - ptm
    str(bigfive_excel_1)  
    bigfive_excel_2 <- readxl::read_xls("Data/bigfive_excel.xls") # Funktion lädt nur xls Format
    bigfive_excel_3 <- readxl::read_xlsx("Data/bigfive_excel.xlsx") # Funktion lädt nur xlsx Format

  library(xlsx)
    ptm <- proc.time()
    bigfive_excel_4 <- xlsx::read.xlsx("Data/bigfive_excel.xlsx", sheetIndex = 1)
    proc.time() - ptm
    
    write.xlsx(bigfive_excel_4, 
               "Data/bigfive_excel_Write.xlsx", 
               sheetName = "Datenblatt", 
               col.names = TRUE, 
               row.names = TRUE, 
               append    = FALSE, 
               showNA    = TRUE, 
               password  = NULL)
```

*Bemerkung zu Excel-Packages*: neben den oben angeführten Packages existieren noch einige weitere, die Funktionen mit Excel-Read-Write anbieten. Manche verlangen Java, andere Perl-Scripts. Einige sind spezialisiert auf effizienten Zugriff und der Bearbeitung von Zellen, andere sind extrem schnell beim Laden von großen Dateien. Üblicherweise reichen die beiden vorgestellten Pakete.

### Dateien vom Web {-}

Die verschiedensten Dateiformate können auch von einer Website oder eine FTP-Server geladen werden. Nachfolgend ein Beispiel, wie eine Datei direkt von einem Server eingelesen werden kann. 


```r
    WebData <- read.table("http://www.tuval.at/wp-content/uploads/Airquality.txt", header = FALSE)
```
