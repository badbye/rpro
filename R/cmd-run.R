source('R/argparse.R')

#' Run functions
#'
#' Given the path of file and a function name, as well as a list of arguments, run the function.
#' @param fun_name A string with format 'function_path' + 'seperator'(":" by default) + 'function_name'
#' @param sep seperator
#' @param argv_list a list of arguments
#' @return function_name(**argv_list)
#' @export
#' @example \dontrun{
#' run_funcs('R/hello_run.R::run_123', list())
#' }
#'
run_funcs <- function(fun_name, argv_list = list(), sep = '::'){
  # new_env = new.env()
  path_fun = unlist(strsplit(fun_name, sep)) # function_path, function_name
  # source(path_fun[1], local = new_env)
  source(path_fun[1])
  do.call(path_fun[2], argv_list)
}

#' Help document of `rpro_run`
rpro_run_help <- function(){
  message('usage: rpro run function_name [-opt] [opt_value]

Choose function_name from the results of `rpro list`.

Available arguments:
  --...         More arguments for the function')
}


#' Run function with command line arguments
#' @export
rpro_run <- function(argv = c()){
  if (length(argv) == 0 || argv[1] %in% c('-h', '--help')){
    return(rpro_run_help())
  }
  fun = argv[1]
  run_funcs(fun, parse_args(argv[-1]))
}




