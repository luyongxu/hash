#' ---
#' title: "Generate Hash"
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

#' # 1. Load Packages 
source(here::here("src/01-load-packages.R"))

#' # 2. Generate Hash
#' Description  
#' Generates a cryptographic hash. 
#' 
#' Arguments  
#' x: The string that is passed to the hashing function.  
#' algorithm: An openssl hashing function that indicates the cryptographic hash function.  
#' rounds: An integer indicating the number of hashing rounds.  
#' salt: A character string that is concatenated to the string.  
#' length: An integer indicating the length of the desired hash.  
#' 
#' Value  
#' Returns a string indicating the cryptographic hash.  
generate_hash <- function(x, algorithm, rounds, salt, length = 64) { 
  
  # Append salt 
  string <- str_c(x, salt)
  
  # Initial hash
  hash <- algorithm(string)
  
  # Repeat hash n rounds 
  for (i in 1:rounds) { 
    hash <- algorithm(hash)
  }
  
  # Modify hash
  str_sub(hash, 5, 5) <- "@"
  str_sub(hash, 8, 8) <- "O"
  
  # Truncate hash
  hash <- str_sub(hash, 1, length)
  
  # Return hash
  return(hash)
}

