source('R/argparse.R')
# options(error=traceback)

#' List specific functions in a given path
#'
#' Given a path, this function is used to list all the functions in the file.
#' @param path The path of file
#' @param fun_regexpr Regular expression to filter functions
#' @return A vector contains function names in the given file that math the regular expression
#' @export
#' @example \dontrun{
#' print(list_funcs('R/hello_run.R'))
#' }
#'
list_funcs <- function(path, fun_regexpr = '^run', env_name = 'rpro_project'){
  ## TODO: (1) is path exists (2)error handle
  # load files in a new environment
  new_env = new.env()
  for (p in path){
    tryCatch(source(p, local = new_env),
             warning = function(war){message(sprintf('File [%s] Warning: %s', p, war$message))},
             error = function(err){message(sprintf('File [%s] Error: %s', p, err$message))}
    )
  }
  attach(new_env, name=env_name)
  funcs = ls(env_name)
  detach(env_name, character.only = TRUE)

  # find functions match pattern
  funcs = grep(fun_regexpr, funcs, value = T)
  if (length(funcs) == 0) {
    return()
  }
  funcs_path = tail_file_path(path)
  paste(funcs_path, funcs, sep = '::')
}

#' Print functions on the screen
#' @param funs_vec A vector of function names
#' @return Nothing, just print out the names on your screen
#' @export \dontrun{
#' fun = list_funcs('R/hello.R')
#' print_funcs(fun)
#' fun = c('run_3452', 'run_asdas', 'run_asdfnjevkbwedfshbvqef')
#' print_funcs(fun)
#' fun = rep(fun, 5)
#' print_funcs(fun)
#' }
print_funcs <- function(funs_vec){
  if (length(funs_vec) == 0){
    return(cat('\n'))
  }
  count = 1; funs_vec = sort(funs_vec)
  nlen = nchar(as.character(length(funs_vec)))
  nstr = max(nchar(funs_vec))
  for (fun in funs_vec){
    cat(sprintf("---->%*d: %-*s", nlen + 1, count, nstr + 1, fun), '\n')
    count = count + 1
  }
}


tail_file_path <- function(path){
  sep = '/'
  os = .Platform$OS.type
  if (os == 'windows'){
    sep = '\\'
  }
  tail(strsplit(path, '/')[[1]], 1)
}
# split_file_path(dir)
# library(tools)
# print(dirname(sys.frame(1)$ofile))


rpro_list_help <- function(){
  message('usage: rpro list [-opt] [opt_value]

Available arguments:
  --path        Path to fund functions, support regular expression
  --funreg      Function names, support regular expression')
}

#' @export
rpro_list <- function(argv = c()){
  argv = parse_args(args = argv)
  if (ifelse(is.null(argv$help), 0, argv$help) == 1){
    rpro_list_help()
    q('no')
  }
  path = ifelse(is.null(argv$path), '*.R$', argv$path)
  funreg = ifelse(is.null(argv$funreg), '^run', argv$funreg)
  cat(sprintf('Search files match: [%s]; Search funcitons match: [%s]\n',
              path, funreg))

  # Find files
  dirs = list.files(pattern = path, path = getwd(), full.names = T)
  if (length(dirs) == 0){
    # stop('No file match!', call. = FALSE)
    return(cat('No file match!\n'))
  }

  # Find & print functions
  funcs = list_funcs(dirs, fun_regexpr = funreg)
  if (length(funcs) == 0){
    # stop('No function match!', call. = FALSE)
    return(cat('No function match!\n'))
  }
  print_funcs(funcs)
}
