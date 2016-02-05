parse_args <- function(args = c()){
  nlen = length(args)
  if (nlen == 0 || (nlen == 1 && args %in% c('-h', '--help'))){
    return(list(help = nlen))
  }
  if (nlen %% 2 != 0){
    msg = sprintf('Invalide arguments: [%s]', paste(args, collapse = ' '))
    stop(msg, call. = FALSE)
  }
  arg_name = args[seq(1, nlen - 1, 2)]
  arg_name = gsub('^-+', '', arg_name)
  arg_val = args[seq(2, nlen, 2)]
  setNames(as.list(arg_val), arg_name)
}


# arg_parser <- function(description = ''){
#   data = list(description = description)
#   data$arg = list()
#   class(data) <- 'rpro_arg'
#   data
# }
#
# add_argument <- function(obj, arg = '-h', help = '', default = NULL){
#   arg = gsub('[- ]', '', arg)
#   obj$arg[[arg]] = list(help = help, default = default)
#   return(obj)
# }


# print.rpro_arg <- function(obj){
#   cat(obj$description, '\n', '\n')
#   cat('optional arguments:', '\n')
#   arg_name = names(obj$arg)
#   max_len_name = max(nchar(arg_name))
#   for (name in arg_name){
#     help = as.character(obj$arg[[name]]$help)
#     default = obj$arg[[name]]$default
#     default = ifelse(is.null(default), 'NULL', as.character(default))
#     msg = sprintf('    -%-*s    %s[default: %s]',
#                   max_len_name + 1, name, help, default)
#     cat(msg, '\n')
#   }
# }

# p <- arg_parser("Start a R project")
# p <- add_argument(p, "func", help="Function to run")
# p <- add_argument(p, "arg1", help="arg1")
# p <- add_argument(p, "arg2", help="arg2")
# print(p)

# argv <- parse_args(p)
# print(p)

# p = commandArgs(TRUE)
# print(parse_args(p))
