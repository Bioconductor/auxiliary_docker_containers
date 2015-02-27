# test annotationTable functionality

library(a4Reporting)

## some dummy data
set.seed(123)
dData <- data.frame(someSymbol = LETTERS[1:5], 
    accessionNumber = 
        c("X83928", "V00540", "U21090", "L38487", "M34057"),
    floats = rnorm(5))

at <- annotationTable(displayData = dData, 
    displayCols = list(accessionNumber = "EntrezId"))

at

xat <- xtable(at, caption = "Example LaTeX table with Hyperlinks", digits = 3)

print(xat, include.rownames = FALSE) # OK

