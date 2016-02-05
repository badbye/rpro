#!/usr/bin/env Rscript

#' Help document for main command `rpro`
#' @export
rpro_help <- function(){
  message('usage: rpro command [-opt] [opt_value]

Available commands:
  list          List all the functions to run
  run           Start to run a specific function')
#   Available commands:
#     create        Create a rpro project
#   init          Prepare rpro templates in the current folder
#   list          List all the functions to run
#   run           Start to run a specific function
#   pkg           Package')
}

