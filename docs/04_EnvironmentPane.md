# Environment-Pane



Im R-Arbeitsbereich (*environment*) besteht aus allen Datenobjekten, die während einer R-Sitzung erstellt oder geladen werden. Das Environment ist sozusagen das Arbeitsgedächtnis von R.

Beim Beenden von R wird man aufgefordert, den Arbeitsbereich zu speichern. Wählt man Ja, speichert R eine Datei mit dem Namen *.RData* in das aktuelle Arbeitsverzeichnis. 

Beim erneuten öffnen von R  wird diese gespeicherte .RData wieder geladen. Dadurch sind alle Datenobjekte der letzten Sitzung in R wieder verfügbar. Auch auf alle in der letzten Sitzung eingegebenen Befehle können mit den Aufwärts- und Abwärtspfeiltasten ($\uparrow$, $\downarrow$) der Tastatur zugegriffen werden.

Speichern, laden, oder löschen des Arbeitsbereich kann auch jederzeit während einer R-Sitzung über das Menü, oder durch die entsprechenden Schaltflächen im Environment-Pane durchführt werden. Das Löschen bestimmter Objekte, bzw. des gesamten Environments ist auch von der Konsole, bzw. vom Skript durch folgende Funktionen möglich:


```r
  a       <- 1:100
  b       <- c("Salzburg", "Wien", "Linz")
  Seminar <- "R-Intro"
  V1      <- 1:10
  M1      <- matrix(1, 3, 3)
  M2      <- matrix(5, 8, 3)
  center  <- function(x) {mean(x) - sd(x)}
  
  rm(a)           # löscht die Variable a
  rm(V1, M1)      # löscht die Variablen V1 und M1
  rm(list = ls()) # löscht den gesamten Inhalt des Globalen Environments
```

Am rechten Rand der Symbolleiste kann man noch die Ansicht der Objekte wählen:

* List: gibt nur die Namen der aktiven Objekte an.
* Grid: zeigt neben dem Namen auch den Variablentyp (Type), die Länge der Variablen (Length), die Größer (Size) und die ersten paar Werte im jeweiligen Objekts. *Grid ist die zu bevorzugende Darstellungsform des Environments*.

<center>

![**Abbildung 1**: Das Arbeitsgedächtnis von RStudio](/Images/04_Environment.PNG){ width=50% }

</center>

Bemerkenswert ist noch das Symbol Global Environment. Neben dem Global Environment gibt es für jedes der geladenen Pakete einen eigenen Arbeitsbereich, in welchem folgende Daten abgespeichert sind:

* die Funktionen des jeweiligen Paketes, sowie
* Datensätze die zur Testung der jeweiligen Funktion verwendet werden können

## History {-}

Die R-Verlaufsdatei (History) ist eine Kopie aller Tastenanschläge während einer Sitzung. Ein Rückgriff auf diese Verlaufsdatei kann vor allem dann nützlich sein, wenn nicht alle Schritte in einer R-Skriptdatei dokumentiert wurden. Die Rhistory-Datei ist eine einfache Textdatei, in der alle Befehle, aber nicht die Ergebnisse aufgezeichnet werden.

<center>

![**Abbildung 2**: Die Historie von verwendeten Befehlen](/Images/04_History.PNG){ width=50% }

</center>

Beachte die Symbole in dieser Ansicht. Man kann über diese:

* eine gespeicherte Historie von Befehlen laden.
* die aktuelle Historie speichern.
* Markierte Zeilen oder Blöcke der Historie an die Konsole senden und ausführen lassen (*To Console*).
* Markierte Zeilen oder Blöcke der Historie an die Source - also in ein geöffnetes R-Script - senden (*To Source*).
* markierte Einträge der Historie löschen.
* die gesamte Historie löschen.

## Connections {-}

Im RStudio-Verbindungsbereich (Connections) können Verbindung zu einer Vielzahl von Datenquellen hergestellt werden[^8]. Vorwiegend verwendet wird es für die Anbindung diverser Datenbanken. Ohne Installation von Zusatzpaketen sind derzeit folgenden Datenbankverbindungen[^9] möglich:

<center>

![**Abbildung 3**: Datenbankverbindungen über Connections](/Images/04_Connections.PNG){ width=50% }

</center>

[^8]: es ist jedoch kein Verbindungsmanager, wie z.B. PGAdmin, Toad oder SSMS.
[^9]: [ODBC](https://de.wikipedia.org/wiki/Open_Database_Connectivity), [Spark](https://de.wikipedia.org/wiki/Apache_Spark)
