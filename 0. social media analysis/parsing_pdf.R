folder <- file.path("data",'pdf')
length <- length(dir(folder))
length
dirpdf <- dir(folder)
dirpdf

## xpdf - http://www.foolabs.com/xpdf/download.html
## set path to pdftotxt.exe and convert pdf to text

pdftotxt <- "C:\\Program Files\\xpdfbin-win-3.04\\bin64\\pdftotext.exe"

for (i in 1:length){
    pdf <- file.path("data",'pdf',dirpdf[i])
    system(paste("\"", pdftotxt, "\" \"", pdf, "\"", sep=""), wait=F)
}

