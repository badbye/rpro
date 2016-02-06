# rpro
Run R function in terminal quickly


## Install

Install from github:
```R
devtools::install_github('badbye/rpro')
```

Add environment PATH(Run in terminal):

### OS & Linux

(1) Find the path of package `rpro`

```shell
Rscript -e 'library(rpro);cat(path.package("rpro"), "bin", sep = "/")'
```

(2) Add in PATH

```shell
echo "paste path in step 1" >> ~/.bashrc
```

### Windows
This package is written purely by R, so it supports Windows(Im sure). However, I do not know how to add PTAH since I do not use Windows a long time ago (~_~). Welcome to contribute!

## Usage
After install `rpro` and add the environment path, you can run `rpro` as a command in the terminal directly.

### list
`rpro list` lists all the functions defined in the files that in your current folder. In default, it just shows the functions whose name starts with *run*.

### run
`rpro list` may show you some functions, then you can use `rpro run function_name` to run the corresponding function.


### Example

Save the follwing codes in `test.R`.

```R
options(encoding = 'GBK')

# download web page
run_ip <- function(url, ...){
  if (is.null(url)){
    return(cat('NO url\n'))
  }
  res = readLines(url, ...)
  return(cat(res, '\n'))
}

# parse command line parameters
run_arg <- function(...){
  argvs = list(...)
  arg_name = names(argvs)
  if (length(arg_name) == 0){
    return(message('No parameter offered.'))
  }
  arg_val = sapply(arg_name, function(x) argvs[[x]])
  msg = sprintf('Paramter name: %-*s; Parameter value: %s',
                max(nchar(arg_name)), arg_name, arg_val)
  cat(msg, sep = '\n')
}
```

```shell
rpro list
# Search files match: [*.R$]; Search funcitons match: [^run]
# ----> 1: test.R::run_arg
# ----> 2: test.R::run_scrapy

# return the address of your IP
rpro run test.R::run_ip -url http://ip.ws.126.net/ipquery  
```

In default, `rpro run` will add a `help` argument for the function(if you do not offer any parameters). So it is always recommended to prepare more arguments in your function(`...` in the script refers to more arguments).

```shell
rpro run test.R::run_arg
# Paramter name: help; Parameter value: 0
```

```shell
rpro run test.R::run_arg -arg1 rpro -arg2 123 -arg3 third
# Paramter name: arg1; Parameter value: rpro
# Paramter name: arg2; Parameter value: 123
# Paramter name: arg3; Parameter value: third
```

## TODO
(1) logging & email?

(2) configuration file to store parameters?
