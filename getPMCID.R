library("rentrez")

getPMCID <- function(x) {
  if(is.null(x))  {
    PMCID <- NA
  } else {
    res <- entrez_summary(db="pubmed", id=x)
    temp <- res$articleids
    PMCID <- temp$value[grepl("pmc", temp$idtype)][1]
    
    if (identical(PMCID, character(0))) {
      PMCID <- NA
    } 
  }
  return(PMCID)
}

