datacache <- new.env(hash=TRUE, parent=emptyenv())

.onLoad <- function(libname, pkgname)
{
    ## Connect to the SQLite DB
    genelocate <- system.file("extdata", "genelocate.txt", package=pkgname, lib.loc=libname)
    genelocate <- read.table(genelocate,header=TRUE,sep="\t",stringsAsFactors=FALSE)
    assign("genelocate", genelocate, envir=datacache)
    chromLength <- system.file("extdata", "chromLength.txt", package=pkgname, lib.loc=libname)
    chromLength <- read.table(chromLength,header=FALSE,sep="\t",stringsAsFactors=FALSE)
    assign("chromLength", chromLength, envir=datacache)
}

.onAttach <- function(libname, pkgname) {
    msg <- sprintf(
        "Package '%s' is deprecated and will be removed from Bioconductor
         version %s", pkgname, "3.20")
    .Deprecated(msg=paste(strwrap(msg, exdent=2), collapse="\n"))
}

