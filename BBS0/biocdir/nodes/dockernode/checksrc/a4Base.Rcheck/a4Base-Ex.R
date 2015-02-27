pkgname <- "a4Base"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
base::assign(".ExTimings", "a4Base-Ex.timings", pos = 'CheckExEnv')
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
library('a4Base')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("a4palette")
### * a4palette

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: a4palette
### Title: Utility function that defines a color palette for use in a4
### Aliases: a4palette
### Keywords: dplot

### ** Examples

  op <- par(mfrow = c(2, 3))
  for (nGroups in 1:6)
    pie(rep(1, nGroups), a4palette(nGroups))
  par(op)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("a4palette", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
graphics::par(get("par.postscript", pos = 'CheckExEnv'))
cleanEx()
nameEx("addQuantilesColors")
### * addQuantilesColors

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: addQuantilesColors
### Title: Compute quantiles for plotGeneDE function
### Aliases: addQuantilesColors
### Keywords: manip

### ** Examples

  if (require(ALL)){
    data(ALL, package = "ALL")
    ALLQ <- addQuantilesColors(ALL)
    fData(ALLQ)
  }



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("addQuantilesColors", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("boxPlot")
### * boxPlot

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: boxPlot
### Title: Create a boxplot for a given gene.
### Aliases: boxPlot

### ** Examples

# simulated data set
esSim <- simulateData()
boxPlot(probesetId = 'Gene.1', object = esSim, groups = 'type', addLegend = FALSE)

# ALL data set
if (require(ALL)){
  data(ALL, package = "ALL")
  ALL <- addGeneInfo(ALL)
  ALL$BTtype <- as.factor(substr(ALL$BT,0,1))

  boxPlot(geneSymbol = 'HLA-DPB1', object = ALL, boxwex = 0.3,
		  groups = 'BTtype', colgroups = 'BT', legendPos='topright')
}



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("boxPlot", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("combineTwoExpressionSet")
### * combineTwoExpressionSet

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: combineTwoExpressionSet
### Title: Combine two ExpressionSet objects
### Aliases: combineTwoExpressionSet
### Keywords: data

### ** Examples

## Not run: 
##D # prepare and combine two ExpressionSet
##D 
##D data(data.H2009); data(phenoData.H2009)
##D data(data.SKOV3); data(phenoData.SKOV3)
##D 
##D eH2009 <- prepareExpressionSet(exprs = data.H2009, phenoData = phenoData.H2009, changeColumnsNames = TRUE)
##D eSKOV3  <- prepareExpressionSet(exprs = data.SKOV3, phenoData = phenoData.SKOV3, changeColumnsNames = TRUE)
##D 
##D newE <- combineTwoExpressionSet(eH2009,eSKOV3)
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("combineTwoExpressionSet", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("computeLogRatio")
### * computeLogRatio

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: computeLogRatio
### Title: Summary statistics for gene expression
### Aliases: computeLogRatio
### Keywords: manip data dplot

### ** Examples

if (require(ALL)){
data(ALL, package = "ALL")
ALL <- addGeneInfo(ALL)
ALL$BTtype <- as.factor(substr(ALL$BT,0,1))
ALL2 <- ALL[,ALL$BT != 'T1']  # omit subtype T1 as it only contains one sample
ALL2$BTtype <- as.factor(substr(ALL2$BT,0,1)) # create a vector with only T and B

# Test for differential expression between B and T cells
tTestResult <- tTest(ALL, "BTtype", probe2gene = FALSE)
topGenes <- rownames(tTestResult)[1:20]

# plot the log ratios versus subtype B of the top genes 
LogRatioALL <- computeLogRatio(ALL2, reference=list(var='BT',level='B'))
a <- plotLogRatio(e=LogRatioALL[topGenes,],openFile=FALSE, tooltipvalues=FALSE, device='X11',
		colorsColumnsBy=c('BTtype'), main = 'Top 20 genes most differentially between T- and B-cells',
		orderBy = list(rows = "hclust"),
		probe2gene = TRUE)
}



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("computeLogRatio", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("createExpressionSet")
### * createExpressionSet

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: createExpressionSet
### Title: combine gene expression and phenotype data onto a ExpressionSet
###   object
### Aliases: createExpressionSet
### Keywords: data

### ** Examples

# simulate expression data of 10 features (genes) measured in 4 samples
x <- matrix(rnorm(40), ncol = 4)
colnames(x) <- paste("sample", 1:4, sep = "_")
rownames(x) <- paste("feature", 1:10, sep = "_")

# simulate a phenodata with two variables
ToBePheno <- data.frame(Gender = rep(c('Male','Female'), 2), 
		Treatment = rep(c('Trt','Control'), each=2))
rownames(ToBePheno) <- paste("sample", 1:4, sep = "_")

eset <- createExpressionSet(exprs = x, phenoData = ToBePheno)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("createExpressionSet", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("filterVarInt")
### * filterVarInt

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: filterVarInt
### Title: Filter Features On Intensity and Variance
### Aliases: filterVarInt
### Keywords: manip

### ** Examples

if (require(ALL)){
  data(ALL, package = "ALL")
  fALL <- filterVarInt(ALL)
  fALL
}



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("filterVarInt", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("heatmap.expressionSet")
### * heatmap.expressionSet

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: heatmap.expressionSet
### Title: Image plot of an expressionSet
### Aliases: heatmap.expressionSet
### Keywords: plot

### ** Examples

	## Not run: 
##D library(RColorBrewer)
##D library(dichromat)
##D 
##D library(Biobase)
##D library(grid)
##D  pdf.directory=getwd()
##D 
##D 
##D load(file.path(getwd(),"expressionSetRma.Rda"))      #expressionSetRma
##D 
##D 
##D eset <- expressionSetRma[100:130,pData(phenoData(expressionSetRma))[,"sample"]##D 
##D 	##### !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
##D 	exprs(eset)[1,5] <- 13.8
##D 	exprs(eset)[10,7] <- 0.5
##D 	eset2 <- expressionSetRma[200:250,] # ARG
##D 	eset3 <- expressionSetRma[1000:1009,pData(phenoData(expressionSetRma))[,"sample"]##D 
##D 	eset4 <- expressionSetRma[100:230,pData(phenoData(expressionSetRma))[,"sample"]##D 
##D 	
##D 	eset5 <- expressionSetRma[1:400,] # ARG
##D 	
##D 	# eset <- eset2
##D 	
##D 	pdf(file.path(pdf.directory,"eset.pdf"))
##D 		size <- heatmap.expressionSet(eset,subtitle.main=" ")
##D 	dev.off()
##D 	pdf(file.path(pdf.directory,"eset.pdf"),width=size[1],height=size[2])
##D 		heatmap.expressionSet(eset,subtitle.main=" ")
##D 	dev.off()
##D 
##D 
##D pdf(file.path(pdf.directory,"eset2.pdf"))
##D 	size <- heatmap.expressionSet(
##D 			eset2,
##D 			colors.nbreaks = 20,
##D 			colors.pergroup=TRUE,
##D 			legend.range="data",
##D 			row.col.groups.display=FALSE,
##D 			cell.gpar=gpar(lwd=0.5),
##D 			legend.height=unit(50,"points"),
##D 			title.just=c("center","center"),
##D 			title.maxlines=2,
##D 			col.groups.sep.width=unit(0,"points"),
##D 			row.labels=featureNames(eset),
##D 			subtitle.main="This is subtitle",
##D 			row.order="hclust",row.groups.hclust=FALSE,
##D 			title.gpar=gpar(cex=2),
##D 			subtitle.gpar=gpar(cex=1.5)
##D 	)
##D dev.off()
##D pdf(file.path(pdf.directory,"eset2.pdf"),width=size[1],height=size[2])
##D 	size <- heatmap.expressionSet(
##D 		eset2,
##D 		colors.nbreaks = 20,
##D 		colors.pergroup=TRUE,
##D 		legend.range="data",
##D 		row.col.groups.display=FALSE,
##D 		cell.gpar=gpar(lwd=0.5),
##D 		legend.height=unit(50,"points"),
##D 		title.just=c("center","center"),
##D 		title.maxlines=2,
##D 		col.groups.sep.width=unit(0,"points"),
##D 		row.labels=featureNames(eset),
##D 		subtitle.main="This is subtitle",
##D 		row.order="hclust",row.groups.hclust=FALSE,
##D 		title.gpar=gpar(cex=2),
##D 		subtitle.gpar=gpar(cex=1.5)
##D 
##D )
##D dev.off()
##D 
##D 
##D 
##D 
##D 	
##D pdf(file.path(pdf.directory,"eset3.pdf"))
##D size <- heatmap.expressionSet(
##D 		eset3,
##D 		row.labels.gpar=gpar(cex=0.4,col=c(rep("red",2),rep("black",49))	), # col will correctly be a vector only if no group...
##D 		col.labels.gpar=gpar(cex=0.6),
##D 		colors.nbreaks = 20,
##D 		colors.pergroup=TRUE,
##D 		legend.range="data",
##D 		row.col.groups.display=FALSE,
##D 		cell.gpar=gpar(lwd=0.5),
##D 		legend.height=unit(50,"points"),
##D 		title.just=c("center","center"),
##D 		title.maxlines=2,
##D 		col.groups.sep.width=unit(0,"points"),
##D 		row.labels=featureNames(eset),
##D 		subtitle.main="Essai subtitle",
##D 		row.order="hclust",row.groups.hclust=FALSE,
##D 		interactive=FALSE
##D )
##D dev.off()
##D 
##D pdf(file.path(pdf.directory,"eset3.pdf"),width=size[1],height=size[2])
##D size <- heatmap.expressionSet(
##D 		eset3,
##D 		row.labels.gpar=gpar(cex=0.4,col=c(rep("red",2),rep("black",49))	), # col will correctly be a vector only if no group...
##D 		col.labels.gpar=gpar(cex=0.6),
##D 		colors.nbreaks = 20,
##D 		colors.pergroup=TRUE,
##D 		legend.range="data",
##D 		row.col.groups.display=FALSE,
##D 		cell.gpar=gpar(lwd=0.5),
##D 		legend.height=unit(50,"points"),
##D 		title.just=c("center","center"),
##D 		title.maxlines=2,
##D 		col.groups.sep.width=unit(0,"points"),
##D 		row.labels=featureNames(eset),
##D 		subtitle.main="Essai subtitle",
##D 		row.order="hclust",row.groups.hclust=FALSE,
##D 		interactive=FALSE
##D )
##D dev.off()
##D 
##D 
##D 
##D pdf(file.path(pdf.directory,"eset4.pdf"))
##D size <- heatmap.expressionSet(
##D 		eset4,
##D 		legend.range="data",
##D 		colors.palette = dichromat(rich.colors(190)[1:128]),
##D 		row.col.groups.display=TRUE,
##D 		title.just=c("left","top"),
##D 		title.maxlines=2,
##D 		row.labels=featureNames(eset),
##D 		subtitle.main="",
##D 		row.order="hclust",row.groups.hclust=FALSE,
##D )
##D dev.off()
##D 
##D pdf(file.path(pdf.directory,"eset4.pdf"),width=size[1],height=size[2])
##D size <- heatmap.expressionSet(
##D 		eset4,
##D 		legend.range="data",
##D 		colors.palette = dichromat(rich.colors(190)[1:128]),
##D 		row.col.groups.display=TRUE,
##D 		title.just=c("left","top"),
##D 		title.maxlines=2,
##D 		row.labels=featureNames(eset),
##D 		subtitle.main="",
##D 		row.order="hclust",row.groups.hclust=FALSE,
##D )
##D dev.off()
##D 
##D pdf(file.path(pdf.directory,"eset5.pdf"))
##D size <- heatmap.expressionSet(eset5,row.order="hclust",row.groups.hclust=FALSE)
##D dev.off()
##D 
##D pdf(file.path(pdf.directory,"eset5.pdf"),width=size[1],height=size[2])
##D heatmap.expressionSet(eset5,row.order="hclust",row.groups.hclust=FALSE)
##D dev.off()
##D 
##D 	
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("heatmap.expressionSet", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("histPvalue")
### * histPvalue

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: histPvalue
### Title: Plot the Distribution of P Values
### Aliases: histPvalue histPvalue,tTest-method histPvalue,limma-method
###   histPvalue,MArrayLM-method histPvalue,numeric-method
### Keywords: dplot

### ** Examples

if (require(ALL)){
  data(ALL, package = "ALL")
  ALL <- addGeneInfo(ALL)
  ALL$BTtype <- as.factor(substr(ALL$BT,0,1))

  tTestResult <- tTest(ALL, "BTtype")
  histPvalue(tTestResult[,"p"], addLegend = TRUE)
  propDEgenesRes <- propDEgenes(tTestResult[,"p"])  
}



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("histPvalue", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("histpvalueplotter")
### * histpvalueplotter

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: histpvalueplotter
### Title: Workhorse function for the histPvalue function
### Aliases: histpvalueplotter

### ** Examples

if (require(ALL)){
  data(ALL, package = "ALL")
  ALL <- addGeneInfo(ALL)
  ALL$BTtype <- as.factor(substr(ALL$BT,0,1))
 
  tTestResult <- tTest(ALL, "BTtype")
  histPvalue(tTestResult[,"p"], addLegend = TRUE, xlab = "Adjusted P Value")
  histPvalue(tTestResult[,"p"], addLegend = TRUE, main = "Histogram of Adjusted P Values")
  propDEgenesRes <- propDEgenes(tTestResult[,"p"])
}



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("histpvalueplotter", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("lassoReg")
### * lassoReg

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: lassoReg
### Title: Multiple regression using the Lasso algorithm as implemented in
###   the glmnet package
### Aliases: lassoReg

### ** Examples

if (require(ALL)){
  data(ALL, package = "ALL")
  ALL <- addGeneInfo(ALL)
  ALL$BTtype <- as.factor(substr(ALL$BT,0,1))

  resultLasso <- lassoReg(object = ALL[1:100,], covariate = "age")
  plot(resultLasso, label = TRUE,
	   main = "Lasso coefficients in relation to degree of penalization.")
  featResultLasso <- topTable(resultLasso, n = 15)
}



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("lassoReg", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("logReg")
### * logReg

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: logReg
### Title: Logistic regression for predicting the probability to belong to
###   a certain class in binary classification problems.
### Aliases: logReg

### ** Examples

## Not run: 
##D if (require(ALL)){
##D   data(ALL, package = "ALL")
##D   ALL <- addGeneInfo(ALL)
##D   ALL$BTtype <- as.factor(substr(ALL$BT,0,1))
##D 
##D   logRegRes <- logReg(geneSymbol = "HLA-DPB1", object = ALL, groups = "BTtype")
##D 
##D   # scoresplot
##D   probabilitiesPlot(proportions = logRegRes$fit, classVar = logRegRes$y,
##D       sampleNames = rownames(logRegRes), main = 'Probability of being a T-cell type ALL')
##D   # barplot
##D   probabilitiesPlot(proportions = logRegRes$fit, classVar = logRegRes$y, barPlot=TRUE,
##D       sampleNames = rownames(logRegRes), main = 'Probability of being a T-cell type ALL')
##D }
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("logReg", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("nlcvTT")
### * nlcvTT

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: nlcvTT
### Title: Data to Demonstrate nlcv and Co Functions
### Aliases: nlcvTT
### Keywords: datasets

### ** Examples

## Not run: 
##D   data(nlcvTT)
##D   if (require(nlcv)) # on R-Forge
##D     scoresPlot(nlcvTT, tech = 'svm', nfeat = 25)
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("nlcvTT", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("plot1gene")
### * plot1gene

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: plot1gene
### Title: Create a Profile Plot for a given Gene
### Aliases: plot1gene
### Keywords: dplot

### ** Examples

if (require(ALL)){
  data(ALL, package = "ALL")
  ALL <- addGeneInfo(ALL)

  # one variable (specified by groups)
  aa <- plot1gene(geneSymbol = 'HLA-DPB1', object = ALL, groups = "BT",
	    addLegend = TRUE, legendPos = 'topright')
  aa
  
  # two variables (specified by groups and colGroups)
  ALL$BTtype <- as.factor(substr(ALL$BT,0,1))
  plot1gene(probeset = '1636_g_at', object = ALL, groups = 'BT',
      colgroups = 'mol.biol', legendPos='topright', sampleIDs = 'BT')    
}



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("plot1gene", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("plotComb2Samples")
### * plotComb2Samples

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: plotComb2Samples
### Title: Plots the correlation in gene expression between two samples
### Aliases: plotComb2Samples

### ** Examples

if (require(ALL)){
  data(ALL, package = "ALL")
  ALL <- addGeneInfo(ALL)

  plotComb2Samples(ALL,"84004", "01003",
    trsholdX = c(10,12), trsholdY = c(4,6),
	xlab = "a B-cell", ylab = "a T-cell")
}



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("plotComb2Samples", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("plotCombMultSamples")
### * plotCombMultSamples

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: plotCombMultSamples
### Title: Plots the correlation in gene expression between more than 2
###   samples
### Aliases: plotCombMultSamples

### ** Examples

if (require(ALL)){
  data(ALL, package = "ALL")
  ALL <- addGeneInfo(ALL)

  plotCombMultSamples(exprs(ALL)[,c("84004", "11002", "01003")])
}



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("plotCombMultSamples", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("plotCombination2genes")
### * plotCombination2genes

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: plotCombination2genes
### Title: Plot a Combination of Two Genes
### Aliases: plotCombination2genes
### Keywords: dplot

### ** Examples

if (require(ALL)){
  data(ALL, package = "ALL")
  ALL <- addGeneInfo(ALL)

  aa <- plotCombination2genes(geneSymbol1 = 'HLA-DPB1', geneSymbol2 = 'CD3D',
			object = ALL, groups = "BT",
			addLegend = TRUE, legendPos = 'topright')
  aa
}



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("plotCombination2genes", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("plotLogRatio")
### * plotLogRatio

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: plotLogRatio
### Title: Plot a summary gene expression graph
### Aliases: plotLogRatio
### Keywords: hplot

### ** Examples

if (require(ALL)){
  data(ALL, package = "ALL")
  ALL <- addGeneInfo(ALL)
  ALL$BTtype <- as.factor(substr(ALL$BT,0,1))
  ALL2 <- ALL[,ALL$BT != 'T1']  # omit subtype T1 as it only contains one sample
  ALL2$BTtype <- as.factor(substr(ALL2$BT,0,1)) # create a vector with only T and B

  # Test for differential expression between B and T cells
  tTestResult <- tTest(ALL, "BTtype", probe2gene = FALSE)
  topGenes <- rownames(tTestResult)[1:20]

  # plot the log ratios versus subtype B of the top genes 
  LogRatioALL <- computeLogRatio(ALL2, reference=list(var='BT',level='B'))
  a <- plotLogRatio(e=LogRatioALL[topGenes,],openFile=FALSE, tooltipvalues=FALSE, device='X11',
      colorsColumnsBy=c('BTtype'), main = 'Top 20 genes most differentially between T- and B-cells',
      orderBy = list(rows = "hclust"), probe2gene = TRUE)
}
## Not run: 
##D 		
##D   a <- plotLogRatio(e=LogRatioALL[topGenes,],openFile=TRUE, tooltipvalues=FALSE, device='pdf',
##D       colorsColumnsBy=c('BTtype'), main = 'Top 20 genes most differentially between T- and B-cells',
##D       orderBy = list(rows = "hclust", cols = "sex"), probe2gene = TRUE)
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("plotLogRatio", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("probabilitiesPlot")
### * probabilitiesPlot

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: probabilitiesPlot
### Title: Function to plot the probabilities to belong to a certain class
###   in binary classification problems.
### Aliases: probabilitiesPlot

### ** Examples

## Not run: 
##D   if (require(ALL)){
##D   data(ALL, package = "ALL")
##D   ALL <- addGeneInfo(ALL)
##D   ALL$BTtype <- as.factor(substr(ALL$BT,0,1))
##D 
##D   logRegRes <- logReg(geneSymbol = "HLA-DPB1", object = ALL, groups = "BTtype")
##D 
##D   # scoresplot
##D   probabilitiesPlot(proportions = logRegRes$fit, classVar = logRegRes$y,
##D     sampleNames = rownames(logRegRes), main = 'Probability of being a T-cell type ALL')
##D   # barplot
##D   probabilitiesPlot(proportions = logRegRes$fit, classVar = logRegRes$y, barPlot=TRUE,
##D     sampleNames = rownames(logRegRes), main = 'Probability of being a T-cell type ALL')
##D }
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("probabilitiesPlot", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("probe2gene")
### * probe2gene

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: probe2gene
### Title: Translate Affymetrix probeset IDs into gene symbols
### Aliases: probe2gene
### Keywords: manip

### ** Examples

if (require(ALL)){
  data(ALL, package = "ALL")
  chip <- annotation(ALL)
  chipAnnotationPkg <- paste(chip, "db", sep = ".")
  res <- probe2gene(featureNames(ALL), chipAnnotationPkg)
  head(res)
}



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("probe2gene", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("profilesPlot")
### * profilesPlot

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: profilesPlot
### Title: Plot expression profiles of multiple genes or probesets
### Aliases: profilesPlot

### ** Examples

if (require(ALL)){
  data(ALL, package = "ALL")
  ALL <- addGeneInfo(ALL)
  ALL$BTtype <- as.factor(substr(ALL$BT,0,1))
  
  myGeneSymbol <- c("LCK")	# a gene 
  probesetPos <- which(myGeneSymbol == featureData(ALL)$SYMBOL)
  myProbesetIds <- featureNames(ALL)[probesetPos]
  
  profilesPlot(object = ALL, probesetIds = myProbesetIds, 
      orderGroups = "BT", sampleIDs = "BT")
}



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("profilesPlot", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("propdegenescalculation")
### * propdegenescalculation

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: propdegenescalculation
### Title: Estimation of proportion of differentially expressed genes
### Aliases: propdegenescalculation

### ** Examples

if (require(ALL)){
  data(ALL, package = "ALL")
  ALL <- addGeneInfo(ALL)
  ALL$BTtype <- as.factor(substr(ALL$BT,0,1))

  tTestResult <- tTest(ALL, "BTtype")
  histPvalue(tTestResult[,"p"], addLegend = TRUE)
  propDEgenesRes <- propDEgenes(tTestResult[,"p"])
}



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("propdegenescalculation", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("replicates")
### * replicates

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: replicates
### Title: computes replicates across a vector
### Aliases: replicates
### Keywords: manip

### ** Examples

  x <- c('a','b','a','a','b','a','c','c','c')
  data.frame(val=x,rep=replicates(x))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("replicates", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("spectralMap")
### * spectralMap

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: spectralMap
### Title: Draw a Spectral Map
### Aliases: spectralMap
### Keywords: hplot

### ** Examples

if (require(ALL)){
  data(ALL, package = "ALL")
  ALL <- addGeneInfo(ALL)

  spectralMap(object = ALL, groups = "BT", legendPos = 'bottomright')

  spectralMap(object = ALL, groups = "BT",
      plot.mpm.args = list(label.tol = 10, rot = c(-1, 1), sub = "", lab.size = 0.65,
	    dim = c(1,2), sampleNames = FALSE, zoom = c(1,5), col.size = 2, 
	    do.smoothScatter = TRUE))
	  
  spectralMap(object = ALL, groups = "BT",
	  plot.mpm.args = list(label.tol = 10, rot = c(-1, 1), sub = "", lab.size = 0.65,
	      dim = c(1,2), sampleNames = as.character(pData(ALL)$BT),
          zoom = c(1,5), col.size = 2, do.smoothScatter = TRUE))
}



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("spectralMap", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("tTest")
### * tTest

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: tTest
### Title: Use t Test to Compare Two Groups
### Aliases: tTest
### Keywords: htest

### ** Examples

if (require(ALL)){
  data(ALL, package = "ALL")
  ALL <- addGeneInfo(ALL)
  ALL$BTtype <- as.factor(substr(ALL$BT,0,1))

  tTestRes <- tTest(object = ALL,	groups = "BTtype", probe2gene = TRUE)
  volcanoPlot(tTestRes)  
}



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("tTest", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("volcanoPlot")
### * volcanoPlot

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: volcanoPlot
### Title: Draw a Volcano Plot
### Aliases: volcanoPlot
### Keywords: dplot

### ** Examples

if (require(ALL)){
  data(ALL, package = "ALL")
  ALL <- addGeneInfo(ALL)
  ALL$BTtype <- as.factor(substr(ALL$BT,0,1))

  tTestRes <- tTest(object = ALL,	groups = "BTtype", probe2gene = TRUE)
  volcanoPlot(tTestRes)  
}



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("volcanoPlot", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
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
