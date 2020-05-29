# Packages
#library(colorout)  # Colourised temrinal output

# Don't ask to save workspace on exit
utils::assignInNamespace(
  "q", 
  function(save = "no", status = 0, runLast = TRUE) 
  {
    .Internal(quit(save, status, runLast))
  }, 
  "base"
)
utils::assignInNamespace(
  "quit", 
  function(save = "no", status = 0, runLast = TRUE) 
  {
    .Internal(quit(save, status, runLast))
  }, 
  "base"
)

# Permanently set mirror
local({
  r <- getOption("repos")
  r["CRAN"] <- "https://cran.ma.imperial.ac.uk/"
  options(repos = r)
})

# Set print width
options(width = 80)

# Set significant figures
options(digits = 4)

# Set max print length
options(max.print = 100)

# Set environmental variables
Sys.setenv(ENTREZ_KEY = "d9cd1e651a746d82b62e4726838109259107")
