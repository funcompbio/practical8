all : practical8.Rmd
	R -e 'rmarkdown::render("practical8.Rmd", "rmarkdown::md_document", "practical8.md")'
	cp *.png docs/.
	pandoc practical8.md -o docs/practical8.html
