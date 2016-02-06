# rpro
Run R function in terminal quickly


## Install

Install from github:
```R
devtools::install('badbye/rpro')
```

Add environment PATH(Run in terminal):

### OS & Linux

(1) Find the path of package `rpro`
```
$ Rscript -e 'library(rpro);cat(path.package("rpro"), "bin", sep = "/")'
```

(2) Add in PATH
```
$ echo "paste path in step 1" >> ~/.bashrc
```

### Windows
Sorry, do not use Windows any more ~_~

## Usage
After install `rpro` and add the environment path, you can run `rpro` as a command in the terminal directly.

### list
`rpro list` lists all the functions defined in the files that in your current folder. In default, it just shows the functions whose name starts with *run*.

### run
`rpro list` may show you some functions, then you can use `rpro run function_name` to run the corresponding function.


### Example

Save the follwing codes in `test.R`.
```
options(encoding = 'GBK')
run_scrapy <- function(url, ...){
  if (is.null(url)){
    return(cat('NO url\n'))
  }
  res = readLines(url, ...)
  return(cat(res, '\n'))
}
```

```
$ rpro list
Search files match: [*.R$]; Search funcitons match: [^run]
----> 1: test.R::run_scrapy

# return the address of your IP
$rpro run test.R::run_scrapy -url http://ip.ws.126.net/ipquery  
```

## TODO
(1) logging & email?

(2) configuration file to store parameters?
