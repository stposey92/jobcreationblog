####################################
# global libraries used everywhere #
####################################

pkgTest <- function(x)
{
  if (!require(x,character.only = TRUE))
  {
    install.packages(x,dep=TRUE)
    if(!require(x,character.only = TRUE)) stop("Package not found")
  }
  return("OK")
}

global.libraries <- c("dplyr","rmarkdown","ggplot2","ggthemes","knitr","rjson","tidyr")

results <- sapply(as.list(global.libraries), pkgTest)

# file locations
# Main directories
basepath <- file.path(getwd())
dataloc <- file.path(basepath, "data")

for ( dir in list(dataloc)){
  if (file.exists(dir)){
  } else {
    dir.create(file.path(dir))
  }
}

# Zenodo DOI
zenodo.prefix <- "10.5281/zenodo"
# Specific DOI - resolves to a fixed version
zenodo.id <- "2649598"
# We will recover the rest from Zenodo API
zenodo.api = "https://zenodo.org/api/records/"
