
msToSpectra <- function(folder) {
  
  file_list <- dir(folder, all.files = TRUE, recursive = FALSE, pattern = '.ms')
  file_name <- file_list[1]
  
  i = 1
  
  for (file_name in file_list) {
    
    setwd(folder)
    fileopen <- read_delim(file_name, delim = ' ', col_names = FALSE)
    comp_name <- fileopen[1,2]
    precursor <- fileopen[2,2]
    collision <- fileopen[3,2]
    fragments <- data.frame(mz = as.numeric(fileopen$X1[-c(1:3)]),
                            intensity = as.numeric(fileopen$X2[-c(1:3)]))
    fragments <- arrange(fragments, mz)
    fragments$rel.intensity <- fragments$mz/max(fragments$mz)*1000
  
    #Could use substring and search to find records 
    #substring(grep('ACCESSION:',record, value = TRUE, fixed = TRUE),12)  
    
    compound <- DataFrame(
      msLevel = as.integer(2),
      polarity = as.integer(1),
      id = as.character(comp_name),
      precursorMz = as.numeric(precursor),
      collisionEnergy = as.numeric(collision))
    
    compound$mz <- list(fragments$mz)
    compound$intensity <- list(fragments$intensity)
    
    if (i == 1) {
      sampleSpectra <- compound
    } else {
      sampleSpectra <- rbind(sampleSpectra, compound)
    }
    
    i = i+1


  }
  
  sampleSpectra <- Spectra(sampleSpectra)
  return(sampleSpectra)
  
}
