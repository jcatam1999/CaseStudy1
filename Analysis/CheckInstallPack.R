##Check for a required package and load if required to Add library

is.installed <- function(mypkg){
  is.element(mypkg, installed.packages()[,1])
} 
#check for ggplot2
if(!is.installed('ggplot2')){
  install.packages('ggplot2')
  library(ggplot2)
}else{
  library(ggplot2)
  print('Package is already installed')
}

#check for dplyr
if(!is.installed('dplyr')){
  install.packages('dplyr')
  library(dplyr)
}else{
  library(dplyr)
  print('Package is already installed')
}

###############
##############
##############
