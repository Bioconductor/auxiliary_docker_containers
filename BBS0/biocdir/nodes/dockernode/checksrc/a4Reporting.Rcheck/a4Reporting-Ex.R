pkgname <- "a4Reporting"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
base::assign(".ExTimings", "a4Reporting-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('a4Reporting')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("annotationTable-class")
### * annotationTable-class

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: annotationTable-class
### Title: Class "annotationTable"
### Aliases: annotationTable-class show,annotationTable-method
### Keywords: classes

### ** Examples

  showClass("annotationTable")



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("annotationTable-class", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("annotationTable")
### * annotationTable

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: annotationTable
### Title: Function to Create an annotationTable
### Aliases: annotationTable
### Keywords: manip

### ** Examples

  ## some dummy data
  dData <- data.frame(someSymbol = LETTERS[1:5], 
                      accessionNumber = 
                        c("X83928", "V00540", "U21090", "L38487", "M34057"))

  at <- annotationTable(displayData = dData, 
                        displayCols = list(accessionNumber = "EntrezId"))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("annotationTable", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("xtable-methods")
### * xtable-methods

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: xtable-methods
### Title: Methods for Function xtable in Package 'annotationTable'
### Aliases: xtable-methods
###   xtable,annotationTable,missing,missing,missing,missing,missing-method
###   xtable,annotationTable,ANY,ANY,ANY,ANY,ANY-method
###   xtable,annotationTable,ANY,ANY,ANY,numeric,ANY-method
###   xtable.topTableGlmnet xtable.topTableLognet xtable.topTableElnet
###   xtable.pamClassConfusionTable xtable.topTablePam
### Keywords: methods manip

### ** Examples

  ## some dummy data
  dData <- data.frame(someSymbol = LETTERS[1:5], 
                      accessionNumber = 
                        c("X83928", "V00540", "U21090", "L38487", "M34057"))

  at <- annotationTable(displayData = dData, 
                        displayCols = list(accessionNumber = "EntrezId"))
  xat <- xtable(at)
  print(xat, include.rownames = FALSE)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("xtable-methods", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
