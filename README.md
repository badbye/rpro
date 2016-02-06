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

## TODO
(1) logging & email?
(3) configuration file to store parameters?
