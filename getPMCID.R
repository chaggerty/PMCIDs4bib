library(RefManageR)

addPMC2Bib <- function(bibfile) {
  source('getPMCID.R')
  bib <- ReadBib(bibfile)
  for (idx in seq_len(length(bib))) {
    
    bib[[idx]] <- LookupPubMedID(bib[[idx]])
    temp <- as.data.frame(bib[[idx]])
    temp$pmcid <- getPMCID(bib[[idx]]$pmid)
    bib[[idx]] <- as.BibEntry(temp)
  }
  
}
