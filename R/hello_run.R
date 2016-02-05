# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

run_hello <- function(...) {
  cat("Hello, rpro\n")
}

run_hi <- function(...){
  cat('Hi, rpro\n')
}

run_arg <- function(...){
  argvs = c(as.list(environment()), list(...))
  arg_name = names(argvs)
  if (length(arg_name) == 0){
    return(message('No parameter offered.'))
  }
  arg_val = sapply(arg_name, function(x) argvs[[x]])
  msg = sprintf('Paramter name: %-*s; Parameter value: %s',
                max(nchar(arg_name)), arg_name, arg_val)
  cat(msg, sep = '\n')
}




