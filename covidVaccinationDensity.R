## Dades de COVID per municipi
download.file("https://analisi.transparenciacatalunya.cat/api/views/irki-p3c7/rows.csv?accessType=DOWNLOAD&bom=true&format=true&delimiter=%3B&sorting=true", destfile="Dosis_administrades_per_municipi.csv")
vac <- read.csv("Dosis_administrades_per_municipi.csv", sep=";", stringsAsFactors=FALSE)

## Dosis per dia?
vac$DATA <- as.Date(vac$DATA)
barplot(sapply(vac_fabricant, mean))


## Dosis administrades de cada vacuna
vac$FABRICANT <- factor(vac$FABRICANT)
vac_fabricant <- split(vac$RECOMPTE, vac$FABRICANT)

hist(vac_fabricant$`BioNTech / Pfizer`)
hist(vac_fabricant$`Moderna / Lonza`)


barplot(sapply(vac_fabricant, sum))

## Recompte es total de vacunats?


## Població per comarca
## Url: https://analisi.transparenciacatalunya.cat/Urbanisme-infraestructures/Dades-del-mapa-urban-stic-de-Catalunya/epsm-zskb
download.file("https://analisi.transparenciacatalunya.cat/api/views/epsm-zskb/rows.csv?accessType=DOWNLOAD&sorting=true", "poblacio_municipis.csv")
pop <- read.csv("poblacio_municipis.csv")
pop <- pop[pop$Any==2020,]

## Merge datasets
vac_muni <- merge(vac,
                  pop[,c("Codi_ine_5_txt", "Poblacio_padro")],
                  by.x = "MUNICIPI_CODI", by.y="Codi_ine_5_txt")
