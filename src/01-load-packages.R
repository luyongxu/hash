#' ---
#' title: "Load Packages"
#' author: "Kevin Lu"
#' date: '`r format(Sys.Date(), "%B %d, %Y")`'
#' output: 
#'   html_document: 
#'     theme: default 
#'     highlight: tango
#'     toc: true 
#'     toc_float: true
#'     number_sections: false
#'     fig_width: 8 
#'     fig_height: 5 
#' ---

#' # 1. Load Libraries 
#' Description  
#' The load_library() function will load a package and will install the package first if necessary.  
#' 
#' Arguments  
#' package_name: A string indicating the package name.  
#' 
#' Value  
#' Does not return a value.  
load_library <- function(package_name) { 
  library_path <- c(.libPaths())
  suppressWarnings(suppressMessages({
    if(require(package_name, character.only = TRUE, lib.loc = library_path) == FALSE) {
      install.packages(package_name, repos = "https://cloud.r-project.org/")
      require(package_name, character.only = TRUE, lib.loc = library_path)
    }
  }))
}
load_library("openssl")
load_library("stringr")
load_library("tidyverse")

#' # 2. Options 
#' Turn off scientific notation.
options(scipen = 999)

#' # 3. Clean
rm(load_library)
